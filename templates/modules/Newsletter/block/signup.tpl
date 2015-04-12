<form action="{modurl modname='Newsletter' type='user' func='edit' ot='user'}" method="post" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="authid" value="{insert name="csrftoken" module="Newsletter"}" />
    <input type="hidden" name="user[frequency]" value="{$modvars.Newsletter.default_frequency}" />
    <input type="hidden" name="user[type]" value="{$nl_type}" />

    {if !$coredata.logged_in}
        <input class="form-control input-sm" placeholder="{gt text='Your Name'}" id="user_name" name="user[name]" type="text" size="10" maxlength="64" />
        <input class="form-control input-sm" placeholder="{gt text='Your E-Mail Address'}" id="user_email" name="user[email]" type="text" size="10" maxlength="128" />
    {else}
        <input class="form-control input-sm" placeholder="{gt text='Your Name'}" id="user_name" name="user[name]" type="text" size="10" maxlength="64" value="{$coredata.user.email}" readonly />
    {/if}
    {if $modvars.Newsletter.enable_multilingual}
        <div class="z-formrow">
            <label for="user_lang">{gt text='Language'}</label>
            {html_select_languages id="user_lang" name="user[lang]" installed=true selected=$coredata.language}
        </div>
    {else}
        <input type="hidden" name="user[lang]" value="{lang}" />
    {/if}

    {if $modvars.Newsletter.require_tos}
        <div class="z-formrow">
            <label for="nl_tos">
                <a href="{modurl modname='Newsletter' type='user' func='main' ot='tos'}" title="{gt text='Terms of Service'}">
                    {gt text="Yes, I agree to the terms of service."}
                </a>
            </label>
            <input type="checkbox" name="user[tos]" value="1" id="nl_tos" />
        </div>
    {else}
        <input type="hidden" name="user[tos]" value="1" />
    {/if}

    <div style="height: 18px"></div>
    <input class="btn btn-default btn-sm btn-block" type="submit" name="submit" value="{gt text='Subscribe to Newsletter'}" />
</form>
