<?php

function smarty_function_getmaterialheaderactions($params, Zikula_View $view)
{
    $actions = array();

    if (ModUtil::available('Search')) {
        $actions[] = array (
            'icon' => 'fa-search',
            'url' => ModUtil::url('Search', 'user', 'main'),
            'title' => __('Search', ZLanguage::getThemeDomain('EventManager'))
        );
    }
//    if (UserUtil::isLoggedIn()) {
//        $actions[] = array (
//            'icon' => 'fa-user',
//            'url' => ModUtil::url('Users', 'user', 'main'),
//            'title' => __('Account', ZLanguage::getThemeDomain('EventManager'))
//        );
//    }
    $header = PageUtil::getVar('material-header');
    if (isset($header['actions'])) {
        foreach ($header['actions'] as $action) {
            $actions[] = $action;
        }
    }
    $actions[] = array (
        'icon' => 'fa-home',
        'url' => System::getBaseUrl(),
        'title' => __('Home', ZLanguage::getThemeDomain('EventManager'))
    );

    $view->assign($params['assign'], $actions);
}
