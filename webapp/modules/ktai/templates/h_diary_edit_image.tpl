({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">日記の編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
({$target_c_diary.subject})<br>
</td></tr></table>

<center>
({if $target_c_diary.image_filename_1 || $target_c_diary.image_filename_2 || $target_c_diary.image_filename_3})
({if $target_c_diary.image_filename_1})
<img src="({t_img_url filename=$target_c_diary.image_filename_1 w=120 h=120 f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$target_c_diary.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_h_diary_delete_image_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;img_num=1&amp;({$tail})">削除</a>]<br>
<br>
({/if})

({if $target_c_diary.image_filename_2})
<img src="({t_img_url filename=$target_c_diary.image_filename_2 w=120 h=120 f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$target_c_diary.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_h_diary_delete_image_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;img_num=2&amp;({$tail})">削除</a>]<br>
<br>
({/if})

({if $target_c_diary.image_filename_3})
<img src="({t_img_url filename=$target_c_diary.image_filename_3 w=120 h=120 f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$target_c_diary.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_h_diary_delete_image_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;img_num=3&amp;({$tail})">削除</a>]<br>
<br>
({/if})

({else})
画像はありません
({/if})
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_diary_edit})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">日記の編集</a><br>

({$inc_ktai_footer|smarty:nodefaults})
