<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_f_home_add_biz_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $target_id = $requests['target_id'];

        $start = $requests['start_date'];
        $text = $requests['title'];

        //書式チェック
        preg_match("/([0-2][0-9]:{0,1}[0-5][0-9]){0,1}(-{0,1})([0-2][0-9]:{0,1}[0-5][0-9]){0,1}\s*(.*)/", $text, $matches);
        
        if($matches)  //クイック入力に対応した書式
        {
            $begin = $matches[1];
            $delim = $matches[2];
            $finish = $matches[3];
            $title = $matches[4];

            $begin_date = $finish_date = $start;
            
            //書式パターンは以下の通り
            //  [開始時刻][時刻デリミタ][終了時刻][予定内容]
            //  [開始時刻][終了時刻][予定内容]
            //  [開始時刻][時刻デリミタ][予定内容]
            //  [時刻デリミタ][終了時刻][予定内容]
            //  [予定内容]

            if(!empty($begin) && !empty($finish))  //開始時刻と終了時刻が存在する
            {
                $begin_time = date("H:i", strtotime($begin));
                $finish_time = date("H:i", strtotime($finish));
            }
            
            elseif(!empty($begin) && !empty($delim))
            {
                $begin_time = date("H:i", strtotime($begin));
                $finish_time = null;
            }
            
            elseif(!empty($finish) && !empty($delim))
            {
                $begin_time = null;
                $finish_time = date("H:i", strtotime($finish));
            }

            else
            {
                $title = $text;
                $begin_date = $finish_date = $start;
                $begin_time = $finish_time = null;
            }
        }
        else  //通常の予定入力
        {
            $title = $text;
            $begin_date = $finish_date = $start;
            $begin_time = $finish_time = null;
        }

        if(empty($title))
        {
            client_redirect_absolute("?m=pc&a=page_f_home&target_c_member_id=$target_id&msg=".urlencode('タイトルを入力してください。'));
            exit();
        }
        
        if(empty($target_id))
        {
            client_redirect_absolute("?m=pc&a=page_f_home&target_c_member_id=$target_id&msg=".urlencode('不正な登録です。'));
            exit();
        }

        biz_insertSchedule($title, $target_id, $begin_date, $finish_date, $begin_time, $finish_time, '', 0, 0, array($target_id));  //予定の登録

        client_redirect_absolute("?m=pc&a=page_f_home&target_c_member_id=$target_id");

    }
}
?>
