({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ﾊﾟｽﾜｰﾄﾞ再発行</a></font><br>
</td></tr></table>

({if $msg})
<font color="#ff0000">({$msg})</font><br>
({/if})
<br>
({t_form m=ktai a=do_o_password_query})
<font color="#999966">携帯ﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet"></textarea><br>
<br>
<font color="#999966">秘密の質問：</font><br>
<select name="c_password_query_id">
<option value="0">選択してください
({foreach from=$password_query_list key=key item=item})
<option value="({$key})">({$item})
({/foreach})
</select><br>
<br>
<font color="#999966">秘密の質問の答え：</font><br>
<input type="text" name="password_query_answer" value=""><br>
<center>
<input type="submit" value="ﾊﾟｽﾜｰﾄﾞを再発行する"><br>
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
