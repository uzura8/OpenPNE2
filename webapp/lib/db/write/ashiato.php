<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * あしあとを付ける
 */
function db_ashiato_insert_c_ashiato($c_member_id_to, $c_member_id_from)
{
    // 同一人物の場合は記録しない
    if ($c_member_id_to == $c_member_id_from) {
        return false;
    }

    // 一定時間以内の連続アクセスは記録しない
    $wait = date('Y-m-d H:i:s', strtotime('-5 minute'));
    $sql = 'SELECT c_ashiato_id FROM c_ashiato WHERE r_datetime > ?' .
            ' AND c_member_id_to = ? AND c_member_id_from = ?';
    $params = array($wait, intval($c_member_id_to), intval($c_member_id_from));
    if (db_get_one($sql, $params)) {
        return false;
    }

    // 忍び足
    if (USE_SHINOBIASHI) {
        if (db_member_is_shinobiashi($c_member_id_from)) {
            return false;
        }
    }

    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    if (!db_insert('c_ashiato', $data)) {
        return false;
    }

    if ($ashiato_mail_num = p_h_ashiato_ashiato_mail_num4c_member_id($c_member_id_to)) {
        //総足あと数を取得
        $ashiato_num = p_h_ashiato_c_ashiato_num4c_member_id($c_member_id_to);

        //あしあとお知らせメールを送る
        if ($ashiato_num == $ashiato_mail_num) {
            do_common_send_ashiato_mail($c_member_id_to, $c_member_id_from);
        }
    }

    return true;
}

?>
