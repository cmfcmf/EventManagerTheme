
// @todo https://github.com/WickyNilliams/headroom.js/issues/38
(function ($) {
    function getInternetExplorerVersion()
    {
        var rv = -1;
        var ua = navigator.userAgent;
        var re;
        if (navigator.appName == 'Microsoft Internet Explorer')
        {
            re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null)
                rv = parseFloat( RegExp.$1 );
        }
        else if (navigator.appName == 'Netscape')
        {
            re  = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null)
                rv = parseFloat( RegExp.$1 );
        }
        return rv;
    }
    var ieVersion = getInternetExplorerVersion();
    if (ieVersion > 1 && ieVersion < 9) {
        document.documentElement.className += ' unsupported-browser';
    }

    $(function () {
        fixSystemNotices();
        fixFooterNav();

        function fixSystemNotices() {
            $('.z-errormsg').removeClass('z-errormsg').addClass('alert alert-danger');
            $('.z-warningmsg').removeClass('z-warningmsg').addClass('alert alert-warning');
            $('.z-informationmsg').removeClass('z-informationmsg').addClass('alert alert-info');
            $('.z-statusmsg').removeClass('z-statusmsg').addClass('alert alert-success');
            $('.alert > a').addClass('alert-link');
        }

        function fixFooterNav() {
            var $footer =  $('#theme-footer');
            $footer.find('.navcontainer > ul').addClass('list-unstyled').css({'margin-bottom': '-10px'});
            $footer.find('.navcontainer > ul > li > a').addClass('btn btn-default btn-sm btn-block').css({'margin-bottom': '10px'});
            $footer.find('.navcontainer > p.extmenuadmin').addClass('hidden');
            $footer.find('.navcontainer').css({'padding-bottom': '10px'});
        }


        /*
        var $navbar = $("#theme-navbar").find("> nav");
        var navbar = $navbar[0];
        var $navMenu = $navbar.find('ul.navlist');

        $navMenu.addClass('nav navbar-nav');
        var headerHeight = $('#theme-header').height() + $('#theme-navbar').height();
        // Dummy headroom on header to add the fixed-top class to the navbar.
        new Headroom(document.getElementById("theme-header"), {
            offset: headerHeight,
            onTop: function () {
                $navbar.removeClass('navbar-fixed-top');
                $('#theme-navbar-placeholder').height(0);
            },
            onNotTop: function () {
                $('#theme-navbar-placeholder').height($navbar.height());
                $navbar.addClass('navbar-fixed-top');
            }
        }).init();

        new Headroom(navbar, {
            offset: headerHeight + 350
        }).init();

        function calculateSearchInputWidth() {
            if ($(window).width() < 786) {
                $('#theme-header-search-input').css('max-width', '100%');

                return;
            }
            var width = parseInt(
                $navbar.width()
                    - $navMenu.width()
                    - 2 * $navMenu.position().left
                    - 70
                    - 25
            );
            if (width < 80) {
                width = 80;
            }
            $('#theme-header-search-input').css('max-width', width + 'px');
        }
        calculateSearchInputWidth();
        $(window).resize(calculateSearchInputWidth);
        */
    });

    $(function(){
        $('.z-bkey-adminnav > div > ul').addClass('list-group');
        $('.z-bkey-adminnav > div > ul > li').addClass('list-group-item');
        $('.z-bkey-adminnav > div > ul > li:not([style])').addClass('list-group-item-info');
    });
})(jQuery);
