<div id="LayoutC">
<div id="Center">

<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>以下の内容でよろしいですか？</h3></div>

<table>
<tr>
<th>タイトル</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>写真１</th>
<td>({$form_val.upfile_1.name})</td>
</tr>
<tr>
<th>写真１説明</th>
<td>({$form_val.image_description1})</td>
</tr>
<tr>
<th>写真２</th>
<td>({$form_val.upfile_2.name})</td>
</tr>
<tr>
<th>写真２説明</th>
<td>({$form_val.image_description2})</td>
</tr>
<tr>
<th>写真３</th>
<td>({$form_val.upfile_3.name})</td>
</tr>
<tr>
<th>写真３説明</th>
<td>({$form_val.image_description3})</td>
</tr>
<tr>
<th>写真４</th>
<td>({$form_val.upfile_4.name})</td>
</tr>
<tr>
<th>写真４説明</th>
<td>({$form_val.image_description4})</td>
</tr>
<tr>
<th>写真５</th>
<td>({$form_val.upfile_5.name})</td>
</tr>
<tr>
<th>写真５説明</th>
<td>({$form_val.image_description5})</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_image_add_insert_c_album_image})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　追 　加　">
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_image_add})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})">
({/foreach})
<input type="submit" class="input_submit" value="　修 　正　" />
({/t_form_block})
</li>
</ul>
</div> <!-- operation -->
</div> <!-- parts -->
</div> <!-- dparts formTable -->


</div><!-- Center -->
</div><!-- LayoutC -->


({* unknown *})({*********************
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:640px;">
({* unknown *})<tr>
({* unknown *})<td align="center">
({* unknown *})<div id="xsnazzy">
({* unknown *})<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
({* unknown *})<div class="xboxcontent">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="bg_11">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* unknown *})<td style="padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$ltag.tfcb})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:624px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:150px;" class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.album_Title})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td style="width:413px" class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.subject})</div>
({* unknown *})</td>
({* unknown *})<td style="width:1px;" class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_1})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.upfile_1.name})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_1})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.image_description1|nl2br|t_truncate:60})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_2})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.upfile_2.name})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_2})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.image_description2|nl2br|t_truncate:60})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_3})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.upfile_3.name})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_3})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.image_description3|nl2br|t_truncate:60})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_4})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.upfile_4.name})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_4})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.image_description4|nl2br|t_truncate:60})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_5})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})
({* unknown *})<div class="padding_s">
({* unknown *})
({* unknown *})({$form_val.upfile_5.name})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$ltag.photo_5})({$ltag.description})
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="left" valign="middle">
({* unknown *})<div class="padding_s">
({* unknown *})({$form_val.image_description5|nl2br|t_truncate:60})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})<td class="bg_02" align="center" valign="middle" colspan="3">
({* unknown *})<div class="padding_w_m">
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:2em;margin:0px auto;">
({* unknown *})<tr>
({* unknown *})({t_form m=pc a=do_h_album_image_add_insert_c_album_image})
({* unknown *})<input type="hidden" name="sessid" value="({$PHPSESSID})">
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$form_val.c_album_id})">
({* unknown *})<input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})<input type="hidden" name="image_description1" value="({$form_val.image_description1})">
({* unknown *})<input type="hidden" name="image_description2" value="({$form_val.image_description2})">
({* unknown *})<input type="hidden" name="image_description3" value="({$form_val.image_description3})">
({* unknown *})<input type="hidden" name="image_description4" value="({$form_val.image_description4})">
({* unknown *})<input type="hidden" name="image_description5" value="({$form_val.image_description5})">
({* unknown *})<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})">
({* unknown *})<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})">
({* unknown *})<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})">
({* unknown *})<input type="hidden" name="tmpfile_4" value="({$form_val.tmpfile_4})">
({* unknown *})<input type="hidden" name="tmpfile_5" value="({$form_val.tmpfile_5})">
({* unknown *})<td class="padding_s"><input name="submit" type="submit" class="submit" value="　({$ltag.released_2})　"></td>
({* unknown *})</form>
({* unknown *})({t_form m=pc a=page_h_album_image_add})
({* unknown *})<input type="hidden" name="subject" value="({$form_val.subject})">
({* unknown *})<input type="hidden" name="target_c_album_id" value="({$form_val.c_album_id})">
({* unknown *})<input type="hidden" name="image_description1" value="({$form_val.image_description1})">
({* unknown *})<input type="hidden" name="image_description2" value="({$form_val.image_description2})">
({* unknown *})<input type="hidden" name="image_description3" value="({$form_val.image_description3})">
({* unknown *})<input type="hidden" name="image_description4" value="({$form_val.image_description4})">
({* unknown *})<input type="hidden" name="image_description5" value="({$form_val.image_description5})">
({* unknown *})<td class="padding_s"><input type="submit" class="submit" value="　({$ltag.Changes})　"></td>
({* unknown *})</form>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})</td>
({* unknown *})<td class="bg_02" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})</div>
({* unknown *})</div>
({* unknown *})<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
({* unknown *})</div>    
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})<img src="./skin/dummy.gif" class="v_spacer_l">
({* unknown *})
({* unknown *})<!-- delete by openkaku team on 080313
({* unknown *})({ext_include file="inc_layoutcolumn_middle_750px.tpl"})
({* unknown *})-->
({* unknown *})({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({* unknown *})({ext_include file="inc_footer.tpl"})
({* unknown *})**********************})