<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティに参加
 */
class ktai_do_inc_join_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //年齢制限チェック
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        $c_member = db_member_c_member4c_member_id($c_member_id, false, true, 'private');
        if ($c_commu['is_adult'] && $c_member['age'] < 18) {
            ktai_display_error('入会できる年齢に達していません');
        }

        $status = do_common_get_c_join_status($u, $target_c_commu_id);
        $p = array('target_c_commu_id' => $target_c_commu_id);

        //非公開コミュニティに管理者から招待されている場合は強制的に承認を回避
        $admin_invite = db_commu_c_commu4c_admin_invite_id($target_c_commu_id, $u);
        if ($admin_invite) {
            $status = STATUS_C_JOIN_REQUEST_FREE;
            db_commu_delete_c_commu_admin_invite($admin_invite);
        }

        switch ($status) {
        //承認必要なし
        case STATUS_C_JOIN_REQUEST_FREE:
            db_commu_join_c_commu($target_c_commu_id, $u);
            do_inc_join_c_commu_send_mail($target_c_commu_id, $u);
            openpne_redirect('ktai', 'page_c_home', $p);
            break;

        //管理者承認必要
        case STATUS_C_JOIN_REQUEST_NEED:
            openpne_redirect('ktai', 'page_c_join_request', $p);
            break;

        //承認待ち
        case STATUS_C_JOIN_WAIT:
            openpne_redirect('ktai', 'page_c_home', $p);
            break;

        //既に参加
        case STATUS_C_JOIN_ALREADY:
            openpne_redirect('ktai', 'page_c_home', $p);
            break;
        }
    }
}
?>
