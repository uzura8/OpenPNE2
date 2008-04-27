<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_event_detail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $page = $requests['page'];
        $all = $requests['all'];
        $err_msg = $requests['err_msg'];
        $body = $requests['body'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
        if (!$c_commu) {
            openpne_redirect('pc', 'page_h_err_c_home');
        }
        if (!$c_topic['event_flag']) {
            $p = array('target_c_commu_topic_id' => $c_topic['c_commu_topic_id']);
            openpne_redirect('pc', 'page_c_topic_detail', $p);
        }

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));

        //詳細部分
        $this->set("c_commu", $c_commu);
        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $this->set("c_topic", $c_topic);

        //書き込み一覧部分
        if ($all) {
            $page_size = null;
        } else {
            $page_size = 20;
        }

        $lst = db_commu_c_topic_write4c_commu_topic_id($c_commu_topic_id, $page, $page_size);
        $this->set("c_topic_write", $lst[0]);
        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);
        $this->set("page", $page);
        $this->set("all", $all);
        $this->set('page_size', $page_size);

        $this->set("start_num", $lst[4]);
        $this->set("end_num", $lst[5]);

        $this->set("is_c_commu_admin", db_commu_is_c_commu_admin($c_commu_id, $u));
        $this->set("is_c_commu_member", db_commu_is_c_commu_member($c_commu_id, $u));
        $this->set("is_c_event_member", db_commu_is_c_event_member($c_commu_topic_id, $u));
        $this->set("is_c_event_admin", db_commu_is_c_event_admin($c_commu_topic_id, $u));
        $this->set('is_event_join_date', db_commu_is_event_join_date($c_commu_topic_id));

        $this->set('err_msg', $err_msg);
        $this->set('body', $body);

        $this->set('c_member_id', $u);

        return 'success';
    }
}
?>
