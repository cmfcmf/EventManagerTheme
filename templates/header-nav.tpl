{pageaddvar name='stylesheet' value="$scriptpath/appbar/appbar.css"}
{pageaddvar name='stylesheet' value="$scriptpath/appbar/sidenav.css"}

{pageaddvar name='javascript' value="$scriptpath/appbar/appbar.js"}
{pageaddvar name='javascript' value="$scriptpath/appbar/appbar-tabs.js"}
{pageaddvar name='javascript' value="$scriptpath/appbar/sidenav.js"}

{pagegetvar name='material-header' assign='header'}
{if !is_array($header)}
    {getLegacyTitle assign='smallTitle'}
{else}
    {assign var='smallTitle' value=$header.smallTitle}
    {if isset($header.bigTitle)}
        {assign var='bigTitle' value=$header.bigTitle}
    {/if}
    {if isset($header.smallTitleActions)}
        {assign var='smallTitleActions' value=$header.smallTitleActions}
    {/if}
    {if isset($header.tabs)}
        {assign var='tabs' value=$header.tabs}
    {/if}
    {if isset($header.color)}
        {getTextAndContrastColor color=$header.color}
        <style>
            .appbar.inverse, .appbar-tabs.inverse, .appbar.inverse a:not([role="menuitem"]), .appbar.inverse .fa, .appbar-tabs.inverse a:not([role="menuitem"]) {
                background: rgb({{$header.color.0}}, {{$header.color.1}}, {{$header.color.2}});
                color: rgb({{$textColor.0}}, {{$textColor.1}}, {{$textColor.2}});
            }
            .appbar.inverse .icon-link:hover, .appbar-tabs.inverse .icon-link:hover, .appbar.inverse .fa:hover {
                background: rgb({{$contrastColor.0}}, {{$contrastColor.1}}, {{$contrastColor.2}});
                color: rgb({{$textColor.0}}, {{$textColor.1}}, {{$textColor.2}});
            }
        </style>
    {/if}
{/if}
{getmaterialheaderactions assign='actions'}
<nav class="sidenav" id="left-sidenav" style="display: none;">
    {userloggedin assign='loggedIn'}
    {if $loggedIn}
        {usergetvar name='email' assign='email'}
        {usergetvar name='firstname' assign='firstname'}
        {usergetvar name='lastname' assign='lastname'}
        {if empty($firstname) || empty($lastname)}
            {usergetvar name='realname' assign='firstname'}
            {if empty($firstname)}
                {usergetvar name='uname' assign='firstname'}
            {/if}
        {/if}
        <div class="nav-header">
            {img src='Nav Header.png' style="position: absolute; top: 0; left: 0"}
            <img class="img img-circle avatar" src="https://www.gravatar.com/avatar/{$email|trim|strtolower|md5}?default=mm&s=60"/>
            <span class="username"><a href="{modurl modname='EventManager' type='user' func='dashboard'}">{$firstname} {$lastname}</a></span>
        </div>
    {/if}
    {blockposition name='sidenav'}
</nav>
{assign var='padding' value=64}
<nav class="appbar-container">
    <div class="appbar inverse">
        <ul class="actions">
            <li>
                <a href="#" class="icon-link" data-toggle="tooltip" data-placement="bottom" title="Menu" data-sidenav="left-sidenav">
                    <i class="fa fa-bars nav-icon"></i>
                </a>
            </li>
        </ul>
        <div class="title">
            <div class="dropdown">
                <a href="#" data-toggle="dropdown"{if empty($smallTitleActions)} data-sidenav="left-sidenav"{/if}>
                    {$smallTitle}
                    {if !empty($smallTitleActions)}
                        <span class="caret"></span>
                    {/if}
                </a>
                {if !empty($smallTitleActions)}
                    <ul class="dropdown-menu" role="menu">
                        {foreach from=$smallTitleActions item='action'}
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="{$action.url|safetext}">{$action.title|safetext}</a></li>
                        {/foreach}
                    </ul>
                {/if}
            </div>
        </div>
        <ul class="actions right">
            <li class="hidden-xs">
                <a href="javascript:void(0)" class="icon-link em-theme-report-bug" data-toggle="tooltip" data-placement="bottom" title="{gt text='Report an error'}">
                    <i class="fa fa-bug"></i>
                </a>
            </li>
            {foreach from=$actions item='action'}
                <li>
                    <a href="{$action.url}" class="icon-link" data-toggle="tooltip" data-placement="bottom" title="{$action.title}">
                        <i class="fa {$action.icon}"></i>
                    </a>
                </li>
            {/foreach}
        </ul>
    </div>
    {if isset($bigTitle)}
        <div class="appbar-extended inverse">
            <span class="title">{$bigTitle|safetext}</span>
        </div>
        {assign var='padding' value=$padding+64}
    {/if}
    {if isset($tabs)}
        <div class="appbar-tabs inverse">
            <i class="fa fa-arrow-left js-scroll-left"></i>
            <ul>
                {foreach from=$tabs item='tab'}
                    <li{if isset($tab.active) && $tab.active} class="active"{/if}>
                        <a href="{if isset($tab.url)}{$tab.url}{else}javascript:void(0){/if}"{if isset($tab.target)} target="{$tab.target}"{/if}>
                            {$tab.title}
                        </a>
                    </li>
                {/foreach}
            </ul>
            <i class="fa fa-arrow-right js-scroll-right"></i>
        </div>
        {assign var='padding' value=$padding+48}
    {/if}
</nav>
{pageaddvarblock name='header'}
<style type="text/css">
    body {
        padding-top: {{$padding}}px;
    }
</style>
{/pageaddvarblock}
