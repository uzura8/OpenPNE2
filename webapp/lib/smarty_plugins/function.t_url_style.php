<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_url_style($params, &$smarty)
{
    $custom_css = p_common_c_siteadmin4target_pagename('inc_custom_css');
    $decoration_config = db_decoration_enable_list();
    $colors = util_get_color_config();
    $skin_filename_list = db_get_c_skin_filename_list();

    $hash = md5(OPENPNE_ENABLE_ROLLOVER . OPENPNE_SKIN_THEME . $custom_css . serialize($decoration_config) . serialize($colors) . serialize($skin_filename_list));
    return './xhtml_style.php?hash=' . $hash;
}

?>
