<!DOCTYPE html>
<html lang="{lang}">
<head>
    <meta charset="{charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset={charset}"/>
    <title>{pagegetvar name='title'}</title>
    <meta name="description" content="{$metatags.description}"/>
    <meta name="keywords" content="{$metatags.keywords}"/>
    <link rel="icon" href="{$imagepath}/favicon.ico" type="image/x-icon">

    {include file='apple-settings.tpl'}

    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
    <![endif]-->

    {pageaddvar name="stylesheet" value="$stylepath/bootstrap/bootstrap.min.css"}
    {pageaddvar name="stylesheet" value="$stylepath/fontawesome/css/font-awesome.min.css"}

    {pageaddvar name="stylesheet" value="$stylepath/flat-btns.css"}

    {pageaddvar name="javascript" value="jquery"}
    {pageaddvar name="javascript" value="$scriptpath/bootstrap.min.js"}

    {pageaddvar name="javascript" value="$scriptpath/headroom.js"}
    {pageaddvar name="javascript" value="$scriptpath/modernizr.custom.js"}

    {pageaddvar name="javascript" value="$scriptpath/ivoviz-feedback/feedback.min.js"}
    {pageaddvar name="javascript" value="$scriptpath/ivoviz-feedback/html2canvas.min.js"}
    {pageaddvar name="stylesheet" value="$scriptpath/ivoviz-feedback/feedback.min.css"}
    {pageaddvarblock}
        <script type="text/javascript">
            jQuery(function () {
                jQuery.feedback({
                    ajaxURL: '{{modurl modname='EventManager' type='ajax' func='bugReport' assign='url'}}{{$url}}',
                    html2canvasURL: '{{$scriptpath}}/ivoviz-feedback/html2canvas.min.js',
                    initButtonText: 'Fehler auf dieser Seite melden',
                    highlightElement: false,
                    tpl: {
                        description: '<div id="feedback-welcome"><div class="feedback-logo">Fehler melden</div><p>Schreiben Sie eine kurze Problembeschreibung:</p><textarea id="feedback-note-tmp"></textarea><p>Next we\'ll let you identify areas of the page related to your description.</p><button id="feedback-welcome-next" class="feedback-next-btn feedback-btn-gray">Weiter</button><div id="feedback-welcome-error">Bitte geben Sie eine Beschreibung ein.</div><div class="feedback-wizard-close"></div></div>',
                        highlighter: '<div id="feedback-highlighter"><div class="feedback-logo">Fehler melden</div><p>Klicken und ziehen Sie mit der linken Maustaste, um Bereiche auf der Seite zu makieren. Sie können dieses Fenster bewegen, wenn es im Weg ist.</p><br /><button class="feedback-sethighlight feedback-active"><div class="ico"></div><span>Hervorheben</span></button><label>Heben Sie Bereiche der Seite hervor, die wichtig sind.</label><button class="feedback-setblackout"><div class="ico"></div><span>Schwärzen</span></button><label class="lower">Schwärzen Sie etwaige persönliche Informationen.</label><div class="feedback-buttons"><button id="feedback-highlighter-next" class="feedback-next-btn feedback-btn-gray">Weiter</button><button id="feedback-highlighter-back" class="feedback-back-btn feedback-btn-gray">Zurück</button></div><div class="feedback-wizard-close"></div></div>',
                        overview: '<div id="feedback-overview"><div class="feedback-logo">Fehler melden</div><div id="feedback-overview-description"><div id="feedback-overview-description-text"><h3>Beschreibung</h3><h3 class="feedback-additional">Weitere Informationen </h3><div id="feedback-additional-none"><span>None</span></div><div id="feedback-browser-info"><span>Browser Informationen</span></div><div id="feedback-page-info"><span>Seiteninformationen</span></div><div id="feedback-page-structure"><span>Seitenstruktur</span></div></div></div><div id="feedback-overview-screenshot"><h3>Screenshot</h3></div><div class="feedback-buttons"><button id="feedback-submit" class="feedback-submit-btn feedback-btn-blue">Abschicken</button><button id="feedback-overview-back" class="feedback-back-btn feedback-btn-gray">Zurück</button></div><div id="feedback-overview-error">Bitte geben Sie eine Beschreibung ein.</div><div class="feedback-wizard-close"></div></div>',
                        submitSuccess: '<div id="feedback-submit-success"><div class="feedback-logo">Fehler melden</div><p>Danke für Ihre Fehlermeldung.</p><button class="feedback-close-btn feedback-btn-blue">OK</button><div class="feedback-wizard-close"></div></div>',
                        submitError: '<div id="feedback-submit-error"><div class="feedback-logo">Fehler melden</div><p>Es trat ein Fehler beim Senden auf, wir bitten um Entschuldigung!</p><button class="feedback-close-btn feedback-btn-blue">OK</button><div class="feedback-wizard-close"></div></div>'
                    }
                });
            });
        </script>
    {/pageaddvarblock}
    {pageaddvar name="javascript" value="$scriptpath/Theme.js"}
    {pageaddvar name="stylesheet" value="$stylepath/style.css"}
    {pageaddvarblock}
        <!--[if gte IE 9]>
        <style type="text/css">
            .gradient {
                filter: none;
            }
        </style>
        <![endif]-->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    {/pageaddvarblock}
    {pageaddvar name='javascript' value="$scriptpath/prototype-fix.js"}
</head>
<body>
{include file='header-nav.tpl'}
<div class="container">
    <div class="alert alert-danger unsupported-browser-message hidden">
        <br />
        Sie benutzen einen veralteten Browser. Die Seite wird unter Umständen nicht richtig funktionieren.
    </div>
    <div class="row">
        <div class="col-xs-12 hidden-print">
            {blockposition name='center'}
        </div>
        <div class="col-xs-12">
            {$maincontent}
        </div>
        <div class="col-xs-12 hidden-print">
            {blockposition name='bottom'}
        </div>
    </div>
</div>
<div id="theme-footer" class="container-fluid hidden-print">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-3">
                {blockposition name='footerleft'}
            </div>
            <div class="col-xs-12 col-sm-3">
                {blockposition name='footermiddleleft'}
            </div>
            <div class="col-xs-12 col-sm-3">
                {blockposition name='footermiddleright'}
            </div>
            <div class="col-xs-12 col-sm-3">
                {blockposition name='footerright'}
            </div>
        </div>
    </div>
    <div class="row" id="theme-footer-bottom-row">
        <div class="container">
            <div class="col-xs-12">
                &copy; {'Y'|date} Christian Flach, katholische Schule Liebfrauen<span class="hidden-xs hidden-sm"> &mdash; {pagerendertime round=2}</span>
                <br class="visible-xs-inline" />
                <br class="visible-xs-inline" />
                <br class="visible-xs-inline" />
            </div>
        </div>
    </div>
</div>
</body>
</html>

