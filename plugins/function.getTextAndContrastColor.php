<?php

function smarty_function_getTextAndContrastColor($params, Zikula_View $view)
{
    $color = $params['color'];

    function lightBackground($color) {
        $r = $color['r'];
        $g = $color['g'];
        $b = $color['b'];

        $contrast = sqrt(
            $r * $r * .241 +
            $g * $g * .691 +
            $b * $b * .068
        );
        return $contrast > 175;
    };

    $percent = 10;
    $light = lightBackground($color);
    foreach ($color as $k => $val) {
        $color[$k] = $light ? round($val * (100-($percent*2))/100) : round($val * (100+($percent*2))/100);
    }
    $view->assign('contrastColor', $color);
    $view->assign('textColor', $light ? [0, 0, 0] : [255, 255, 255]);
}
