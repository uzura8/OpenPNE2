<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下の内容でよろしいですか？</h3></div>
<table>
<tr>
<th>タイトル</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>アルバム説明</th>
<td>({$form_val.description|nl2br})</td>
</tr>
<tr>
<th>表紙</th>
<td>({$form_val.image_filename})</td>
</tr>
<tr>
<th>公開範囲</th>
<td>
({* #1931 *})({if $form_val.public_flag == "public"})
({* #1931 *})全員に公開
({* #1931 *})({elseif $form_val.public_flag == "friend"})
({* #1931 *})({$WORD_MY_FRIEND})まで公開
({* #1931 *})({elseif $form_val.public_flag == "private"})
({* #1931 *})公開しない
({* #1931 *})({/if})
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_add_insert_c_album})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　作 　成　" />
({*
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="description" value="({$form_val.description})" />
<input type="hidden" name="public_flag" value="({$form_val.public_flag})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
*})
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_add})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　修 　正　" />
({*
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="description" value="({$form_val.description})" />
<input type="hidden" name="public_flag" value="({$form_val.public_flag})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
*})
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
