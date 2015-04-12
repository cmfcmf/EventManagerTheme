<?php

function smarty_function_getLegacyTitle($params, Zikula_View $view)
{
    $text = PageUtil::getVar('title');
    $pattern = System::getVar('pagetitle', '');
    if (empty($pattern)) {
        return $text;
    }

    $pattern = str_replace('%sitename%', System::getVar('sitename', ''), $pattern);
    $moduleInfo = ModUtil::getInfoFromName(ModUtil::getName());
    $moduleDisplayName = $moduleInfo['displayname'];
    $pattern = str_replace('%modulename%', $moduleDisplayName, $pattern);

    for ($i = 0; $i < strlen($pattern); $i++) {
        if (substr($pattern, $i, strlen('%pagetitle%')) == '%pagetitle%') {
            $start = $i;
            $end = -(strlen($pattern) - $i - strlen('%pagetitle%'));
            break;
        }
    }

    $view->assign($params['assign'], substr($text, $start, $end));
}
