({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">ﾗﾝｷﾝｸﾞ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
({if $kind == "ashiato"})
ｱｸｾｽ数
({elseif $kind == "friend"})
({$WORD_MY_FRIEND_HALF})数
({elseif $kind == "com_member"})
ｺﾐｭﾆﾃｨ参加人数
({elseif $kind == "com_comment"})
ｺﾐｭﾆﾃｨ盛り上がり度
({/if})
ﾗﾝｷﾝｸﾞ<br>
</td></tr></table>

[i:150]
({if $kind == "ashiato"})
昨日のｱｸｾｽ数が多かったﾒﾝﾊﾞｰのﾗﾝｷﾝｸﾞです。<br>
({elseif $kind == "friend"})
登録されている({$WORD_MY_FRIEND_HALF})の数が多いﾒﾝﾊﾞｰのﾗﾝｷﾝｸﾞです。<br>
({elseif $kind == "com_member"})
参加者の多いｺﾐｭﾆﾃｨのﾗﾝｷﾝｸﾞです。<br>
({elseif $kind == "com_comment"})
昨日の掲示板書き込み数が多かったｺﾐｭﾆﾃｨのﾗﾝｷﾝｸﾞです。<br>
({/if})
<hr color="#({$ktai_color_config.border_01})">

<table width="100%">
({foreach from=$rank_list key=rank item=list name=ranking})
({if $rank == 1})
({foreach from=$list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_05`,`$ktai_color_config.bg_08`"})">
[i:1015]<font color="#({$ktai_color_config.font_02})">第({$rank})位</font><br>
({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.c_member.nickname})</a>さん
({else})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.c_commu.name|t_truncate:22:""})</a>
({/if})
：
({if $kind == "ashiato"})
({$item.count})ｱｸｾｽ<br>
({elseif $kind == "friend"})
({$item.count})人<br>
({elseif $kind == "com_member"})
({$item.count})人<br>
({elseif $kind == "com_comment"})
書き込み({$item.count})件<br>
({/if})
</td></tr>
({/strip})
({/foreach})
<tr><td>
<hr color="#({$ktai_color_config.border_01})">
</td></tr>
({else})

({foreach from=$list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_05`,`$ktai_color_config.bg_08`"})">
<font color="#({$ktai_color_config.font_02})">第({$rank})位</font><br>
({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.c_member.nickname})</a>さん
({else})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.c_commu.name|t_truncate:22:""})</a>
({/if})：({if $kind == "ashiato"})
({$item.count})ｱｸｾｽ<br>
({elseif $kind == "friend"})
({$item.count})人<br>
({elseif $kind == "com_member"})
({$item.count})人<br>
({elseif $kind == "com_comment"})
書き込み({$item.count})件<br>
({/if})
</td></tr>
({/strip})
({/foreach})
<tr><td>
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/if})

({foreachelse})
ﾗﾝｷﾝｸﾞﾃﾞｰﾀがありません<br>
</td></tr>
<tr><td>
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

[i:1015]<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=ashiato&amp;({$tail})">ｱｸｾｽ数No1</a><br>
[i:1015]<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=friend&amp;({$tail})">({$WORD_MY_FRIEND_HALF})数No1</a><br>
[i:1015]<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=com_member&amp;({$tail})">参加人数No1ｺﾐｭﾆﾃｨ</a><br>
[i:1015]<a href="({t_url m=ktai a=page_h_ranking})&amp;kind=com_comment&amp;({$tail})">盛り上がり度No1ｺﾐｭﾆﾃｨ</a><br>

({$inc_ktai_footer|smarty:nodefaults})