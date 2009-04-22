<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //ランダム５０人のフレンド
        $this->set("c_friend_list", db_friend_ktai_c_friend_list_random4c_member_id($u));

        return 'success';
    }
}

?>
