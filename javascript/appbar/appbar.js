(function ($){
    // Written by yckart, http://stackoverflow.com/a/15191130/2560557
    // Modified to include a start angle.
    $.fn.animateRotate = function(start, end, duration, easing, complete) {
        var args = $.speed(duration, easing, complete);
        var step = args.step;
        return this.each(function(i, e) {
            args.complete = $.proxy(args.complete, e);
            args.step = function(now) {
                $.style(e, 'transform', 'rotate(' + now + 'deg)');
                if (step) return step.apply(e, arguments);
            };

            $({deg: start}).animate({deg: end}, args);
        });
    };
    $(function () {
        $('.appbar-container [data-toggle="tooltip"]').tooltip()

        $("a[data-show-appbar]").on('click touchstart', function () {
            var $target = $(this).data('show-appbar');
            $target = $('#' + $target);
            var duration = 500;

            $target.hide().removeClass('hidden').fadeIn(duration);
            $(this).parents('.appbar').fadeOut(duration);

            var $oldMainAction = $(this).parents('.appbar').find('.js-main-action');
            $oldMainAction.animateRotate(0, 180, duration, 'linear');

            var $newMainAction = $target.find('.js-main-action');
            $newMainAction.animateRotate(180, 360, duration, 'linear');

            $target.find('.search').focus();
        });

        $("a[data-hide-appbar]").on('click touchstart', function () {
            var $target = $(this).data('hide-appbar');
            $target = $('#' + $target);
            var duration = 500;

            $target.fadeIn(duration);
            $(this).parents('.appbar').fadeOut(duration);

            var $oldMainAction = $(this).parents('.appbar').find('.js-main-action');
            $oldMainAction.animateRotate(0, -180, duration, 'linear');

            var $newMainAction = $target.find('.js-main-action');
            $newMainAction.animateRotate(180, 0, duration, 'linear');
        });

        var availableWidth = $('.appbar-container').width() - 50 - $('.appbar-container .actions.right').width();
        if ($('.appbar-container .title').width() > availableWidth) {
            $('.appbar-container .title a').wrap('<marquee>'); // attr('class', 'marquee')
        }
    });
})(jQuery);
