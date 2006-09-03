<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_review_list_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_member_id = $requests['target_c_member_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        if (p_common_is_access_block($u, $c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $page_size = 30;
        $page = $page + $direc;

        if (!$c_member_id) {
            $c_member_id = $u;
            $type = "h";
        } elseif ($c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";
        }

        $this->set('c_member', db_common_c_member4c_member_id($c_member_id));

        list($c_review_list, $is_prev, $is_next, $total_num, $start_num, $end_num)
            = p_fh_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size);
        $this->set('c_review_list', $c_review_list);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num", $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);
        $this->set('type', $type);

        $this->set('inc_navi', fetch_inc_navi($type, $c_member_id));
        return 'success';
    }
}

?>
