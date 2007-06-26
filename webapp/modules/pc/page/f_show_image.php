<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_show_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi("f", $target_c_member_id));
        $this->set("u", $u);

        //メンバー情報
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        return 'success';
    }
}

?>
