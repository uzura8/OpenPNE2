<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_insert_biz_state extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $state = $request['state'];
        $member_id = $request['member_id'];
        // ----------

        biz_changeState($member_id, $state);

        client_redirect("?m=pc&a=page_h_home");
    }
}

?>
