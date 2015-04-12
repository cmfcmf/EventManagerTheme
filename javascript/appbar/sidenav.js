(function ($) {
    $(function () {
        var currentTarget = null;
        $('body').append('<div id="sidenav-backdrop" style="display: none"></div>');
        $("a[data-sidenav]").each(function () {
            var target = $(this).data('sidenav');
            $('#' + target).hide();
            $(this).on('click touchend', function () {
                currentTarget = target;
                $('#' + target).animate({width:'show'}, 240);
                $('#sidenav-backdrop').fadeIn();
            });
        });
        $('#sidenav-backdrop').on('click touchend', function () {
            $('#' + currentTarget).animate({width:'hide'}, 240);
            $('#sidenav-backdrop').fadeOut();
        });
    })
})(jQuery);

