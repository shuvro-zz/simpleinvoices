{* Note that frmpost_Validator() is generated at runtime using the jsFormValidationBegin() function*}
<form name="frmpost" action="index.php?module=system_defaults&amp;view=save"
      method="post" onsubmit="return frmpost_Validator(this);">
<div class="si_center">
    <h3>{$LANG.edit} {$description|htmlsafe}</h3>
</div>
<div class="si_form">
    <table>
        <tr>
            <th>{$description|htmlsafe}</th>
            <td>{$value}</td>
        </tr>
    </table>
</div>
<br />
<div class="si_toolbar si_toolbar_form">
    {if isset($default)}
        <button type="submit" class="positive" name="submit" value="{$LANG.save}">
            <img class="button_img" src="images/common/tick.png" alt=""/>
            {$LANG.save}
        </button>
    {/if}
    <a href="index.php?module=system_defaults&amp;view=manage" class="negative">
        <img src="images/common/cross.png" alt=""/>
        {$LANG.cancel}
    </a>
</div>
<input type="hidden" name="name" value="{if isset($default)}{$default|htmlsafe}{/if}">
<input type="hidden" name="op" value="update_system_defaults"/>
</form>
