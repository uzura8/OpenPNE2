({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu_topic_name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ｺﾒﾝﾄの削除<br>
</td></tr></table>

このｺﾒﾝﾄを本当に削除しますか?<br>
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_02})">ｺﾒﾝﾄ:</font><br>

({foreach from=$c_commu_topic_comment_list item=item})
({if $item.number != 0})
({$item.r_datetime|date_format:"%y/%m/%d %H:%M"})<br>
({if $item.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a>({/if})
<br>
({$item.body|t_url2a_ktai|nl2br})<br>
({if $item.image_filename1})写真：[<a href="({t_img_url filename=$item.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>({/if})
({if $item.image_filename2})写真：[<a href="({t_img_url filename=$item.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>({/if})
({if $item.image_filename3})写真：[<a href="({t_img_url filename=$item.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>({/if})
<br>
({/if})
({/foreach})

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_c_bbs_delete_c_commu_topic_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_comment_id" value="({$c_commu_topic_comment_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_c_bbs})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
