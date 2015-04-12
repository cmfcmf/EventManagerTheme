(function ($) {
    $(function(){
        $('.appbar-tabs').each(function () {
            var iv = false;
            var $ul = $(this).find('ul');
            var $leftBtn = $(this).find('.js-scroll-left');
            var $rightBtn = $(this).find('.js-scroll-right');
            
            function check() {
                if ($ul.scrollLeft() == 0) {
                    $leftBtn.hide();
                } else {
                    $leftBtn.show();
                }
                if ($ul.width() + $ul.scrollLeft() == $ul[0].scrollWidth) {
                    $rightBtn.hide();
                } else {
                    $rightBtn.show();
                }
            }

            $(window).resize(check);

            check();

            $leftBtn.on('mousedown touchstart', function(){
                if (iv === false) {
                    iv = setInterval(function(){
                        $ul.scrollLeft( $ul.scrollLeft() - 6);
                        check();
                    },20);
                }
            });
            $rightBtn.on('mousedown touchstart', function(){
                if (iv === false) {
                    iv = setInterval(function(){
                        $ul.scrollLeft( $ul.scrollLeft() + 6);
                        check();
                    },20);
                }
            });
            $rightBtn.add($leftBtn).on('mouseup mouseleave touchend', function(){
                clearInterval(iv);
                iv = false;
            });
        });
    });
})(jQuery);