({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ﾒｯｾｰｼﾞ</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾒｯｾｰｼﾞをごみ箱へ移動<br>
</td></tr></table>

このﾒｯｾｰｼﾞをごみ箱に本当に移動しますか?<br>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_h_message_update_c_message_is_deleted})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_h_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_message_id" value="({$c_message_id})">
<input type="submit" value="　いいえ　">
</form>

</center>

({$inc_ktai_footer|smarty:nodefaults})
