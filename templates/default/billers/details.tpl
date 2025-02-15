{*
 * Script: details.tpl
 *   Biller details template
 *
 * Last edited:
 *   2018-09-21 by Rich Rowley to add signature field.
 *   2008-08-25
 *
 * License:
 *   GPL v3 or above
 *}
<form name="frmpost"
      action="index.php?module=billers&amp;view=save&amp;id={$smarty.get.id}"
      method="post"
      id="frmpost"
      onsubmit="return checkForm(this);">

  {if $smarty.get.action== 'view' }
  <input type="hidden" name="op" value="view_biller">
  <div class="si_form si_form_view">
    <table>
      <tr>
        <th>{$LANG.biller_name}: </th>
        <td>{$biller.name}</td>
      </tr>
      <tr>
        <th>{$LANG.street}: </th>
        <td>{$biller.street_address}</td>
      </tr>
      <tr>
        <th>{$LANG.street2}: </th>
        <td>{$biller.street_address2}</td>
      </tr>
      <tr>
        <th>{$LANG.city}: </th>
        <td>{$biller.city}</td>
      </tr>
      <tr>
        <th>{$LANG.zip}: </th>
        <td>{$biller.zip_code}</td>
      </tr>
      <tr>
        <th>{$LANG.state}: </th>
        <td>{$biller.state}</td>
      </tr>
      <tr>
        <th>{$LANG.country}: </th>
        <td>{$biller.country}</td>
      </tr>
      <tr>
        <th>{$LANG.mobile_phone}: </th>
        <td>{$biller.mobile_phone}</td>
      </tr>
      <tr>
        <th>{$LANG.phone}: </th>
        <td>{$biller.phone}</td>
      </tr>
      <tr>
        <th>{$LANG.fax}: </th>
        <td>{$biller.fax}</td>
      </tr>
      <tr>
        <th>{$LANG.email}: </th>
        <td>{$biller.email}</td>
      </tr>
      <tr>
      <th>{$LANG.signature}: </th>
      <td>{$biller.signature}</td>
    </tr>
    <tr>
        <th>{$LANG.paypal_business_name}: </th>
        <td>{$biller.paypal_business_name}</td>
      </tr>
      <tr>
        <th>{$LANG.paypal_notify_url}: </th>
        <td>{$biller.paypal_notify_url}</td>
      </tr>
      <tr>
        <th>{$LANG.paypal_return_url}: </th>
        <td>{$biller.paypal_return_url}</td>
      </tr>
      <tr>
        <th>{$LANG.eway_customer_id}: </th>
        <td>{$biller.eway_customer_id}</td>
      </tr>
      <tr>
        <th>{$LANG.paymentsgateway_api_id}: </th>
        <td>{$biller.paymentsgateway_api_id}</td>
      </tr>
      {if !empty($customFieldLabel.biller_cf1)}
      <tr>
        <th>{$customFieldLabel.biller_cf1|htmlsafe}: </th>
        <td>{$biller.custom_field1}</td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf2)}
      <tr>
        <th>{$customFieldLabel.biller_cf2|htmlsafe}: </th>
        <td>{$biller.custom_field2}</td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf3)}
      <tr>
        <th>{$customFieldLabel.biller_cf3|htmlsafe}: </th>
        <td>{$biller.custom_field3}</td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf4)}
      <tr>
        <th>{$customFieldLabel.biller_cf4|htmlsafe}: </th>
        <td>{$biller.custom_field4}</td>
      </tr>
      {/if}
      <tr>
        <th>{$LANG.logo_file}: </th>
        <!-- <td><a href="templates/invoices/logos/{$biller.logo}" target="new">{$biller.logo}</a></td> -->
        <td>
          {if $biller.logo != ''}
          <img src="templates/invoices/logos/{$biller.logo}" alt="{$biller.logo}">
          <br />
          {$biller.logo}
          {/if}
        </td>
      </tr>
      <tr>
        <th>{$LANG.invoice_footer}: </th>
        <td>{$biller.footer}</td>
      </tr>
      <tr>
        <th>{$LANG.notes}: </th>
        <td>{$biller.notes}</td>
      </tr>
      <tr>
        <th>{$LANG.enabled}: </th>
        <td>{$biller.wording_for_enabled}</td>
      </tr>
    </table>
  </div>
  <div class="si_toolbar si_toolbar_form">
    <a href="index.php?module=billers&amp;view=details&amp;action=edit&amp;id={$biller.id}" class="positive">
      <img src="images/famfam/report_edit.png" alt="" />
      {$LANG.edit}
    </a>
  </div>
  {/if}
  {* ######################################################################################### *}
  {if $smarty.get.action== 'edit' }
  <div class="si_form">
  <input type="hidden" name="domain_id" value="{if isset($biller.domain_id)}{$biller.domain_id}{/if}" />
    <table>
      <tr>
        <th>{$LANG.biller_name}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_required_field"
             title="{$LANG.required_field}">
            <img src="{$help_image_path}required-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="name"
                   value="{if isset($biller.name)}{$biller.name|htmlsafe}{/if}" size="50" id="name"
                   class="validate[required]" /></td>
      </tr>
      <tr>
        <th>{$LANG.street}</th>
        <td><input type="text" name="street_address"
                   value="{if isset($biller.street_address)}{$biller.street_address|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.street2}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_street2"
             title="{$LANG.street2}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="street_address2"
                   value="{if isset($biller.street_address2)}{$biller.street_address2|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.city}</th>
        <td><input type="text" name="city"
                   value="{if isset($biller.city)}{$biller.city|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.zip}</th>
        <td><input type="text" name="zip_code"
                   value="{if isset($biller.zip_code)}{$biller.zip_code|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.state}</th>
        <td><input type="text" name="state"
                   value="{if isset($biller.state)}{$biller.state|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.country}</th>
        <td><input type="text" name="country"
                   value="{if isset($biller.country)}{$biller.country|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.mobile_phone}</th>
        <td><input type="text" name="mobile_phone"
                   value="{if isset($biller.mobile_phone)}{$biller.mobile_phone|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.phone}</th>
        <td><input type="text" name="phone"
                   value="{if isset($biller.phone)}{$biller.phone|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.fax}</th>
        <td><input type="text" name="fax"
                   value="{if isset($biller.fax)}{$biller.fax|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.email}</th>
        <td><input type="text" name="email"
                   value="{if isset($biller.email)}{$biller.email|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.signature}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_signature"
             title="{$LANG.signature}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><textarea  name="signature" class="editor" rows="8" cols="30">{$biller.signature|htmlsafe}</textarea></td>
      </tr>
      <tr>
        <th>{$LANG.paypal_business_name}</th>
        <td><input type="text" name="paypal_business_name"
                   value="{if isset($biller.paypal_business_name)}{$biller.paypal_business_name|htmlsafe}{/if}" size="25" /></td>
      </tr>
      <tr>
        <th>{$LANG.paypal_notify_url}</th>
        <td><input type="text" name="paypal_notify_url"
                   value="{if isset($biller.paypal_notify_url)}{$biller.paypal_notify_url|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.paypal_return_url}</th>
        <td><input type="text" name="paypal_return_url"
                   value="{if isset($biller.paypal_return_url)}{$biller.paypal_return_url|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.eway_customer_id}</th>
        <td><input type="text" name="eway_customer_id"
                   value="{if isset($biller.eway_customer_id)}{$biller.eway_customer_id|htmlsafe}{/if}" size="50" /></td>
      </tr>
      <tr>
        <th>{$LANG.paymentsgateway_api_id}</th>
        <td><input type="text" name="paymentsgateway_api_id"
                   value="{if isset($biller.paymentsgateway_api_id)}{$biller.paymentsgateway_api_id|htmlsafe}{/if}" size="50" /></td>
      </tr>
      {if !empty($customFieldLabel.biller_cf1)}
      <tr>
        <th>{$customFieldLabel.biller_cf1|htmlsafe}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
             title="{$LANG.custom_fields}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="custom_field1"
                   value="{if isset($biller.custom_field1)}{$biller.custom_field1|htmlsafe}{/if}" size="50"></td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf2)}
      <tr>
        <th>{$customFieldLabel.biller_cf2|htmlsafe}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
             title="{$LANG.custom_fields}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="custom_field2"
                   value="{if isset($biller.custom_field2)}{$biller.custom_field2}{/if}" size="50"></td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf3)}
      <tr>
        <th>{$customFieldLabel.biller_cf3|htmlsafe}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
             title="{$LANG.custom_fields|htmlsafe}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="custom_field3"
                   value="{if isset($biller.custom_field3)}{$biller.custom_field3|htmlsafe}{/if}" size="50"></td>
      </tr>
      {/if}
      {if !empty($customFieldLabel.biller_cf4)}
      <tr>
        <th>{$customFieldLabel.biller_cf4|htmlsafe}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
             title="{$LANG.custom_fields}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td><input type="text" name="custom_field4"
                   value="{if isset($biller.custom_field4)}{$biller.custom_field4|htmlsafe}{/if}" size="50"></td>
      </tr>
      {/if}
      <tr>
        <th>{$LANG.logo_file}
          <a class="cluetip" href="#"
             rel="index.php?module=documentation&amp;view=view&amp;page=help_insert_biller_text"
             title="{$LANG.logo_file}">
            <img src="{$help_image_path}help-small.png" alt="" />
          </a>
        </th>
        <td>{html_options name=logo output=$files values=$files selected=$biller.logo }</td>
      </tr>
      <tr>
        <th>{$LANG.invoice_footer}</th>
        <td><textarea name="footer" class="editor" rows="4" cols="50">{$biller.footer|htmlsafe}</textarea></td>
      </tr>
      <tr>
        <th>{$LANG.notes}</th>
        <td><textarea name="notes" class="editor" rows="8" cols="50">{$biller.notes|htmlsafe}</textarea></td>
      </tr>
      <tr>
        <th>{$LANG.enabled}</th>
        <td>{html_options name=enabled options=$enabled selected=$biller.enabled}</td>
      </tr>
    </table>
    <div class="si_toolbar si_toolbar_form">
      <button type="submit" class="positive" name="save_biller" value="{$LANG.save_biller}">
        <img class="button_img" src="images/common/tick.png" alt="" />
        {$LANG.save}
      </button>
      <a href="index.php?module=billers&amp;view=manage"
         class="negative">
        <img src="images/common/cross.png" alt="" />
        {$LANG.cancel}
      </a>
    </div>
  </div>
  <input type="hidden" name="op" value="edit_biller">
  <input type="hidden" name="categorie" value="1" />
  {/if}
</form>
