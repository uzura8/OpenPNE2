<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_home extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('pc', 'page_h_home');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $inc_navi = fetch_inc_navi('h');
        $this->set('inc_navi', $inc_navi);

        /// infomation ///

        // 運営者からのおしらせ
        $this->set('site_info', p_common_c_siteadmin4target_pagename('h_home'));

        //未読メッセージの数をお知らせ
        $this->set('num_message_not_is_read', p_h_message_count_c_message_not_is_read4c_member_to_id($u));
        //日記コメントの未読の数をお知らせ
        $this->set('num_diary_not_is_read', p_h_diary_count_c_diary_not_is_read4c_member_id($u));
        //日記コメントの未読の中で、読ませるものを送る
        $this->set('first_diary_read', p_h_diary_c_diary_first_diary_read4c_member_id($u));

        //あなたにフレンド承認を求めているメンバーリスト
        $f_confirm_list = p_h_confirm_list_anatani_c_friend_confirm_list4c_member_id($u);
        $this->set('f_confirm_list', $f_confirm_list);
        $this->set('num_f_confirm_list', count($f_confirm_list));
        //あなたにコミュニティ参加承認を求めているメンバーリスト
        $h_confirm_list = p_h_confirm_list_anatani_c_commu_member_confirm_list4c_member_id($u);
        $this->set('h_confirm_list', $h_confirm_list);
        $this->set('num_h_confirm_list', count($h_confirm_list));
        // あなたにコミュニティ管理者交代を希望しているメンバー
        $anatani_c_commu_admin_confirm_list = p_h_confirm_list_anatani_c_commu_admin_confirm_list4c_member_id($u);
        $this->set('anatani_c_commu_admin_confirm_list', $anatani_c_commu_admin_confirm_list);
        $this->set('num_anatani_c_commu_admin_confirm_list', count($anatani_c_commu_admin_confirm_list));

        // 誕生日かどうか
        $this->set('birthday_flag', p_h_home_birthday_flag4c_member_id($u));

        /// 左側 ///

        // メンバ情報
        $c_member = db_common_c_member4c_member_id($u);
        $this->set('c_member', $c_member);
        // フレンドリスト
        $c_friend_list = p_f_home_c_friend_list4c_member_id($u, 9);
        $this->set('c_friend_list', $c_friend_list);
        $this->set('c_friend_count', db_friend_count_friends($u));
        // 参加コミュニティ
        $c_commu_user_list = p_h_home_c_commu_list4c_member_id($u, 9);
        $this->set('c_commu_user_list', $c_commu_user_list);
        $this->set('fh_com_count_user', p_common_count_c_commu4c_member_id($u));

        /// 最新情報 ///

        // フレンド最新日記
        $c_diary_friend_list = p_h_home_c_diary_friend_list4c_member_id($u, 5);
        $this->set('c_diary_friend_list', $c_diary_friend_list);
        // フレンド最新blog
        $this->set('c_rss_cache_list', p_h_diary_list_friend_c_rss_cache_list($u, 5));
        // 日記コメント記入履歴
        $c_diary_my_comment_list = p_h_home_c_diary_my_comment_list4c_member_id($u, 5);
        $this->set('c_diary_my_comment_list', $c_diary_my_comment_list);
        // 参加コミュニティの新着書き込み
        $this->set('c_commu_topic_comment_list', p_h_home_c_commu_topic_comment_list4c_member_id($u, 5));
        // レビュー
        $this->set('c_friend_review_list', p_h_home_c_friend_review_list4c_member_id($u, 5));

        /// 自分の情報 ///

        // 日記
        $c_diary_list = db_diary_get_c_diary_list4c_member_id($u, 5);
        $this->set('c_diary_list', $c_diary_list);
        // 外部blog
        $this->set('c_blog_list', p_h_home_h_blog_list_friend4c_member_id($u, 5, 1));
        // レビュー
        $this->set('c_review_list', db_review_c_review_list4member($u, 5));

        /// その他 ///

        // 紹介文
        $c_friend_intro_list = p_h_home_c_friend_intro_list4c_member_id($u, 5);
        $this->set('c_friend_intro_list', $c_friend_intro_list);

        // 今日の日付、曜日
        $this->set('r_datetime', date('m/d'));
        $date = array('日','月','火','水','木','金','土');
        $this->set('r_datetime_date', $date[date('w')]);

        /// 週間カレンダー
        if (DISPLAY_SCHEDULE_HOME) {
			//開始曜日の設定
			if ($c_member['schedule_start_day'] == 2) {
                $start_day = date("w");
            } else {
                $start_day = $c_member['schedule_start_day'];
            }
            $this->set('calendar', $this->get_calendar($u, $requests['w'], $start_day));
        }

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_h_home($this->getView()));

        //お気に入りフィード
        if (USE_BOOKMARK_FEED) {
            //お気に入りの最新日記
            $this->set('bookmark_diary_list', db_bookmark_diary_list($u, 5));

            //お気に入りの最新ブログ
            $this->set('bookmark_blog_list', db_bookmark_blog_list($u, 5));

            //お気に入りのメンバ
            $bookmark_member_list = db_bookmark_member_list($u, 9);
            $this->set('bookmark_member_list', $bookmark_member_list);
            $this->set('bookmark_count', db_bookmark_count($u));
        }

        // API用セッションID
        $this->set('api_session_id', get_api_sessionid($u));

        // アクセス日時を記録
        p_common_do_access($u);

        return 'success';
    }

    function get_calendar($u, $week, $start_day)
    {
        include_once 'Calendar/Week.php';
        $w = intval($week);
        if (empty($w)) {
            $w = 0;
        }
        $this->set('w', $w);
        $time = strtotime($w . ' week');
        $Week = new Calendar_Week(date('Y', $time), date('m', $time), date('d', $time), $start_day);
        $Week->build();
        $calendar = array();
        $dayofweek = array('日','月','火','水','木','金','土');
        $i = $start_day;
        $dayofweek = array_merge($dayofweek,
            array_slice($dayofweek, 0, ($start_day + 1)));
        while ($Day = $Week->fetch()) {
            $y = $Day->thisYear();
            $m = $Day->thisMonth();
            $d = $Day->thisDay();
            $birth = p_h_home_birth4c_member_id($m, $d, $u);
            $item = array(
                'year'=> $y,
                'month'=>$m,
                'day' => $d,
                'dayofweek'=>$dayofweek[$i++],
                'now' => false,
                'birth' => $birth,
                'event' => p_h_home_event4c_member_id($y, $m, $d, $u),
                'schedule' => p_h_calendar_c_schedule_list4date($y, $m, $d, $u),
                'holiday' => db_c_holiday_list4date($m, $d),
            );
            if ($w == 0 && $d == date('d')) {
                $item['now'] = true;
            }
            $calendar[] = $item;
        }
        return $calendar;
    }
}

?>
