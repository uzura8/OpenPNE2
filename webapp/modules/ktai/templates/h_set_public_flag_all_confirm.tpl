({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
日記公開範囲の一括変更<br>
</td></tr></table>

これまでに書かれた日記の公開設定を以下の通りに一括で変更します。よろしいですか?<br>
<br>
({t_form m=ktai a=do_h_set_public_flag_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})">
<font color="#999966">変更内容：</font><br>
({if $public_flag_diary_all == 'private'})
公開しない
({elseif $public_flag_diary_all == 'friend'})
({$smarty.const.WORD_MY_FRIEND_HALF})まで公開
({else})
全員に公開
({/if})<br>

<hr color="#b3ceef">
<center>
<input type="submit" class="submit" value="　は　い　"><br>
</center>
</form>

({t_form m=ktai a=page_h_config_public_flag_diary})
<center>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" class="submit" value="　いいえ　">
</center>
</form>
<hr color="#0d6ddf">
%%i117%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>
({$inc_ktai_footer|smarty:nodefaults})
