{*
/*
* Script: itemised.tpl
* 	 Itemized invoice template
*
* License:
*	 GPL v3 or above
*
* Website:
*	https://simpleinvoices.group*/
*}
{literal}
<script type="text/javascript" charset="utf-8">
    $(function () {
        for (var x = 0; x <= {/literal}{$dynamic_line_items}{literal}; x++) {
            $('.product_select' + x).chainSelect('#attr1-' + x, './index.php?module=invoices&amp;view=ajax&amp;search=attr1');
            $('.product_select' + x).chainSelect('#attr2-' + x, './index.php?module=invoices&amp;view=ajax&amp;search=attr2');
{/literal} 
{if $number_of_attributes == "3"}
            $('.product_select' + x).chainSelect('#attr3-' + x, './index.php?module=invoices&amp;view=ajax&amp;search=attr3');
{/if}
{literal}
	}

});
</script>
{/literal}

{* Note that frmpost_Validator() is generated at runtime using the jsFormValidationBegin() function*}
<form name="frmpost" action="index.php?module=invoices&amp;view=save" method="post" onsubmit="return frmpost_Validator(this);">

<h3>{$LANG.inv} {$LANG.inv_itemized}</h3>

{include file="$path/header.tpl" }
    {* NOTE: the <table> tag for the following is in the header.tpl file. *}
<tr>
	<td class="details_screen">Qty</td>
	<td class="details_screen">Desc</td>
	<td class="details_screen">Attr1</td>
	<td class="details_screen">Attr2</td>
	{if $number_of_attributes == "3"}
	<td class="details_screen">Attr3</td>
	{/if}
	<td class="details_screen">{$LANG.unit_price}</td>
</tr>


        {section name=line start=0 loop=$dynamic_line_items step=1}

			<tr>

				<td>
					<input type="text"  id="quantity{$smarty.section.line.index}" name="quantity{$smarty.section.line.index}" size="5" /></td>
				<td>
                    {if !isset($products) }
				<p><em>{$LANG.no_products}</em></p>
			{else}
				<select class="product_select{$smarty.section.line.index}" 
				        name="products{$smarty.section.line.index}"
					    onchange="invoice_product_change_price($(this).val(), {$smarty.section.line.index}, jQuery('#quantity{$smarty.section.line.index}').val() );">
					<option value=""></option>
				{foreach from=$products item=product}
					<option {if $product.id == $defaults.product} selected {/if} value="{if isset($product.id)}{$product.id}{/if}">{$product.description}</option>
				{/foreach}
				</select>
			{/if}
                </td>
			<td>
				<select id="attr1-{$smarty.section.line.index}" name="attr1-{$smarty.section.line.index}" class="linkSel" disabled="disabled">
					<option value="">--  --</option>
				</select>
			</td>
			<td>
				<select id="attr2-{$smarty.section.line.index}" name="attr2-{$smarty.section.line.index}" class="linkSel" disabled="disabled">
					<option value="">--  --</option>
				</select>
			</td>	
			{if $number_of_attributes == "3"}
			<td>
				<select id="attr3-{$smarty.section.line.index}" name="attr3-{$smarty.section.line.index}" class="linkSel" disabled="disabled">
					<option value="">--  --</option>
				</select>
			</td>	
			{/if}
			<td>
				<input id="unit_price{$smarty.section.line.index}" name="unit_price{$smarty.section.line.index}" size="7" value="" />
			</td>
{*
				<td>
					<select name="products{$smarty.section.line.index}">
						<option value=""></option>
						{foreach from=$matrix item=matrix_item}
							<option {if $product.id == $defaults.product} selected {/if} value="{if isset($matrix_item.id)}{$matrix_item.id}{/if}">{$matrix_item.display}</option>
						{/foreach}
					</select>
				</td>	
				<td>
					<select name="products{$smarty.section.line.index}">
						<option value=""></option>
						{foreach from=$matrix item=matrix_item}
							<option {if $product.id == $defaults.product} selected {/if} value="{if isset($matrix_item.id)}{$matrix_item.id}{/if}">{$matrix_item.display}</option>
						{/foreach}
					</select>
				</td>	
*}
		</tr>

        {/section}
	{$customFields.1}
	{$customFields.2}
	{$customFields.3}
	{$customFields.4}
	{showCustomFields categorieId="4" itemId=""}

        <tr>
            <td class="details_screen">{$LANG.tax}</td>
<td>
                {if !isset($taxes) }
	<p><em>{$LANG.no_taxes}</em></p>
{else}
	<select name="tax_id">
	{foreach from=$taxes item=tax}
                            <option {if $tax.tax_id == $defaults.tax} selected {/if} value="{$tax.tax_id}">{$tax.tax_description}</option>
	{/foreach}
	</select>
{/if}

</td>
</tr>

<tr>
<td class="details_screen">{$LANG.inv_pref}</td>
<td>
<input type="text" name="preference_id" />
                {if !isset($preferences) }
	<p><em>{$LANG.no_preferences}</em></p>
{else}
	<select name="preference_id">
	{foreach from=$preferences item=preference}
		<option {if $preference.pref_id == $defaults.preference} selected {/if} value="{if isset($preference.pref_id)}{$preference.pref_id}{/if}">{$preference.pref_description}</option>
	{/foreach}
	</select>
{/if}

</td>
</tr>	
<tr>
	<td align="left">
		<a href="index.php?module=documentation&amp;view=view&amp;page=help_invoice_custom_fields" rel="gb_page_center[450, 450]">{$LANG.want_more_fields}<img src="{$help_image_path}help-small.png" alt="" /></a>

	</td>
</tr>
</table>
<!-- </div> -->
<hr />
<div style="text-align:center;">
	<input type="hidden" name="max_items" value="{if isset($smarty.section.line.index)}{$smarty.section.line.index}{/if}" />
	<input type="submit" name="submit" value="{$LANG.save_invoice}" />
	<input type="hidden" name="type" value="2" />
</div>
</form>
