<div id="LayoutA">
<div id="Top">

({if $smarty.const.DISPLAY_SEARCH_HOME})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block m=pc a=do_h_home_search})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="q" value="" size="30" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_1})" value="diary" alt="日記" name="diary" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_2})" value="community" alt="コミュニティ" name="community" /></li>
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_4})" value="message" alt="メッセージ" name="message" /></li>
({if $smarty.const.USE_EXTRA_SERVICE})
<li><input type="image" class="input_image" src="({t_img_url_skin filename=button_search_3})" value="web" alt="web" name="web" /></li>
({/if})
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

({if $birthday_flag})
<div class="parts">
<img src="({t_img_url_skin filename=birthday_h})" alt="Happy Birthday!" />
</div>
({/if})

({* {{{ homeInfoBox *})
<div class="parts homeInfoBox">
<table><tr>
<th><img src="({t_img_url_skin filename=icon_information})" alt="お知らせ" /></th>
<td>
<p>({$site_info|smarty:nodefaults|default:"&nbsp;"|t_url2cmd:'info'|t_cmd:'info'})</p>
({if $num_f_confirm_list || $num_message_not_is_read || $num_diary_not_is_read || $num_h_confirm_list || $anatani_c_commu_admin_confirm_list || $anatani_c_commu_sub_admin_confirm_list})
<ul>
({if $num_f_confirm_list})
<li>★<span class="caution">承認待ちのメンバーが({$num_f_confirm_list})名います！</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $num_message_not_is_read})
<li>★<span class="caution">新着メッセージが({$num_message_not_is_read})件あります！</span> <a href="({t_url m=pc a=page_h_message_box})"><strong>メッセージを読む</strong></a></li>
({/if})
({if $num_diary_not_is_read})
<li>★<span class="caution">({$num_diary_not_is_read})件の日記に対して新着コメントがあります！</span> <a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})"><strong>日記を見る</strong></a></li>
({/if})
({if $num_h_confirm_list})
<li>★<span class="caution">コミュニティ参加承認待ちのメンバーが({$num_h_confirm_list})名います！</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<li>★<span class="caution">コミュニティ管理者交代依頼が({$num_anatani_c_commu_admin_confirm_list})件きています。</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
({if $anatani_c_commu_sub_admin_confirm_list})
<li>★<span class="caution">コミュニティ副管理者依頼が({$num_anatani_c_commu_sub_admin_confirm_list})件きています。</span> <a href="({t_url m=pc a=page_h_confirm_list})"><strong>承認・拒否</strong></a></li>
({/if})
</ul>
({/if})
</td>
</tr></table>
</div>
({* }}} *})

({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Top -->
<div id="Left">

({if $inc_entry_point[4]})({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({* {{{ homePhotoBox *})
<div class="dparts homePhotoBox">
<div class="parts">
<p class="photo"><img src="({t_img_url filename=$c_member.image_filename w=180 h=180 noimg=no_image})" alt="プロフィール写真" /></p>
<ul class="moreInfo button">
<li><a href="({t_url m=pc a=page_h_config_image})"><img src="({t_img_url_skin filename=button_edit_photo})" alt="写真を編集" /></a></li>
<li><a href="({t_url m=pc a=page_h_prof})"><img src="({t_img_url_skin filename=button_prof_conf})" alt="プロフィール確認" /></a></li>
</ul>
</div>
({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $c_member.c_member_id != 1})
({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<p class="rank"><img src="({t_img_url filename=$rank.image_filename})" alt="({$rank.name})" /></p>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
<p class="point">({$point}) Point</p>
({/if})
({/if})
({/if})
<p class="text">({$c_member.nickname})さん (({$c_friend_count}))</p>
</div>
({* }}} *})

({if $inc_entry_point[5]})({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_friend_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})リスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_friend_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>
({else})
<table>
({if $c_friend_list[0]})
<tr class="photo">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[3]})
<tr class="photo">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[6]})
<tr class="photo">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_friend_list})">全てを見る(({$c_friend_count})人)</a></li>
<li><a href="({t_url m=pc a=page_h_manage_friend})">({$WORD_MY_FRIEND})管理</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[6]})({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_commu_user_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>コミュニティリスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_commu_user_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_commu_id})
&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_c_home _urlencode=true _html=false})%26target_c_commu_id=({$item.c_commu_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.count_commu_members})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>
({else})
<table>
({if $c_commu_user_list[0]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=0 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_user_list[3]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=3 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_user_list[6]})
<tr class="photo">
({t_loop from=$c_commu_user_list start=6 num=3})
<td>({if $item})({if $item.c_member_id_admin == $c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_user_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_com_list})">全てを見る(({$fh_com_count_user}))</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $bookmark_member_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>お気に入りリスト</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$bookmark_member_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
<!--
show_flash('flash/list.swf', '({$flashvars})');
//-->
</script>
({else})
<table>
({if $bookmark_member_list[0]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $bookmark_member_list[3]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $bookmark_member_list[6]})
<tr class="photo">
({t_loop from=$bookmark_member_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$bookmark_member_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_list})">全てを見る(({$bookmark_count}))</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[7]})({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Left -->
<div id="Center">

({if $inc_entry_point[8]})({$inc_entry_point[8]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $calendar})
({* {{{ weeklyCalendarTable *})
<div class="dparts weeklyCalendarTable"><div class="parts">
({t_form_block m=pc a=do_h_home_insert_c_schedule})
<input type="hidden" name="w" value="({$w})" />
<p class="scheduleForm">予定 <input type="text" class="input_text" name="title" value="" size="24" />
<select name="start_date">
({foreach from=$calendar item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="input_submit" value="追加" />
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w-1})" title="前の週">＜</a>
<a href="({t_url m=pc a=page_h_home})" title="今週">■</a>
<a href="({t_url m=pc a=page_h_home})&amp;w=({$w+1})" title="次の週">＞</a>
</p>
({/t_form_block})
<table class="calendar">
<tr>
({foreach from=$calendar item=item name=calendar})
<th class="day({if $item.dayofweek == "日" || $item.holiday}) sun({elseif $item.dayofweek == "土"}) sat({/if})({if $item.now}) now({/if})">({strip})
({capture name=day})
({if $smarty.foreach.calendar.first || $item.day == 1})({$item.month})/({/if})({$item.day})<br />
(({$item.dayofweek}))
({/capture})
({if $item.now})<strong>({$smarty.capture.day|smarty:nodefaults})</strong>({else})({$smarty.capture.day|smarty:nodefaults})({/if})
({/strip})</th>
({/foreach})
</tr><tr>
({foreach from=$calendar item=item name=calendar})
<td class="day({if $item.now}) now({/if})">
({strip})
({* 祝日 *})
({foreach from=$item.holiday item=item_holiday})
<span class="holiday">({$item_holiday})</span><br />
({/foreach})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<img src="({t_img_url_skin filename=icon_birthday})" alt="誕生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br />
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="イベント" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a><br />
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
<img src="({t_img_url_skin filename=icon_pen})" alt="予定" /><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a><br />
({/foreach})
({/strip})
</td>
({/foreach})
</tr>
</table>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_calendar})">月別カレンダー</a></li>
</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[9]})({$inc_entry_point[9]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_diary_friend_list || $c_rss_cache_list || $c_diary_my_comment_list || $c_commu_topic_comment_list || $c_friend_review_list || $bookmark_diary_list || $bookmark_blog_list})
({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>最新情報</h3></div>
<table>
({if $c_diary_friend_list})
<tr><th>({$WORD_MY_FRIEND})<br />最新日記</th><td>
<dl class="articleList">
({foreach from=$c_diary_friend_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|t_truncate:30}) (({$item.count_comments|default:0}))</a> (({$item.nickname|default:"&nbsp;"})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_list_friend})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_rss_cache_list})
<tr><th>({$WORD_MY_FRIEND})<br />最新Blog</th><td>
<dl class="articleList">
({foreach from=$c_rss_cache_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a> (({$item.c_member.nickname}))</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_list_friend})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_diary_my_comment_list})
<tr><th>日記コメント<br />記入履歴</th><td>
<dl class="articleList">
({foreach from=$c_diary_my_comment_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">({$item.subject|t_truncate:30}) (({$item.num_comment}))</a> (({$item.nickname}))</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_diary_comment_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_commu_topic_comment_list})
<tr><th>コミュニティ<br />最新書き込み</th><td>
<dl class="articleList">
({foreach from=$c_commu_topic_comment_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;comment_count=({$item.number})">({$item.c_commu_topic_name|t_truncate:30}) (({$item.number}))</a> (({$item.c_commu_name})) ({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_com_comment_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_friend_review_list})
<tr><th>({$WORD_MY_FRIEND})<br />最新レビュー</th><td>
<dl class="articleList">
({foreach from=$c_friend_review_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a> (({$item.nickname}))</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_friend_review_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $bookmark_diary_list})
<tr><th>お気に入り<br />最新日記</th><td>
<dl class="articleList">
({foreach from=$bookmark_diary_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.count_comments})">({$item.subject|t_truncate:30}) (({$item.count_comments}))</a> (({$item.nickname})) ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $bookmark_blog_list})
<tr><th>お気に入り<br />最新Blog</th><td>
<dl class="articleList">
({foreach from=$bookmark_blog_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a> (({$item.nickname}))</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_bookmark_diary_blog_list})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[10]})({$inc_entry_point[10]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_diary_list || $c_blog_list || $c_review_list})
({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>最新日記・レビュー</h3></div>
<table>
({if $c_diary_list})
<tr><th>最新日記</th><td>
<dl class="articleList">
({foreach from=$c_diary_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.comment_count})">({$item.subject|t_truncate:30}) (({$item.comment_count}))</a> ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if})</dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_h_diary_add})">日記を書く</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_blog_list})
<tr><th>最新Blog</th><td>
<dl class="articleList">
({foreach from=$c_blog_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a></dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})#blog">もっと読む</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_review_list})
<tr><th>最新レビュー</th><td>
<dl class="articleList">
({foreach from=$c_review_list item=item})
<dt>({$item.r_datetime|date_format:"%m月%d日"})</dt><dd><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a></dd>
({/foreach})
</dl>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_review_list_member})">もっと読む</a></li>
<li><a href="({t_url m=pc a=page_h_review_add})">レビューを書く</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[11]})({$inc_entry_point[11]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_friend_intro_list})
({* {{{ friendIntroList *})
<div class="dparts friendIntroList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})からの紹介文</h3></div>
<table>
({foreach from=$c_friend_intro_list item=item})
<tr>
<th><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /><br />({$item.nickname})</a></th>
<td>({$item.intro|t_truncate:36:"":3})</td>
</tr>
({/foreach})
</table>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_intro})">全て見る</a></li>
<li><a href="({t_url m=pc a=page_h_manage_friend})">紹介文を書く</a></li>
</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[12]})({$inc_entry_point[12]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Center -->
</div><!-- LayoutA -->
