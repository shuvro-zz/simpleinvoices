<?php
global $smarty;
// stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin ();

// Deal with op and add some basic sanity checking
$display_message = "<div class='si_message_warning'>{$LANG['cancelled']}</div>";
$refresh_redirect = "<meta http-equiv='refresh' content='2;URL=index.php?module=products&amp;view=manage' />";

$op = (!empty ( $_POST ['op'] ) ? $_POST['op'] : NULL);
if ($op === 'insert_product') {
    try {
        if (isset($_POST['save_product'])) {
            if (Product::insertProduct() > 0) {
                $display_message = "<div class='si_message_ok'>{$LANG['save_product_success']}</div>";
            } else {
                $display_message = "<div class='si_message_error'>{$LANG['save_product_failure']}</div>";
            }
        }
    } catch (Exception $e) {
        error_log("products save.php - error: " . $e->getMessage());
        $display_message = "<div class='si_message_error'>{$LANG['save_product_failure']}</div>";
    }
} else if ($op === 'edit_product') {
    try {
        if (isset($_POST ['save_product'])) {
            if (Product::updateProduct()) {
                $display_message = "<div class='si_message_ok'>{$LANG['save_product_success']}</div>";
            } else {
                $display_message = "<div class='si_message_error'>{$LANG['save_product_failure']}</div>";
            }
        }
    } catch (Exception $e) {
        error_log("products save.php - error: " . $e->getMessage());
        $display_message = "<div class='si_message_error'>{$LANG['save_product_failure']}</div>";
    }
}

$smarty->assign('display_message', $display_message);
$smarty->assign('refresh_redirect', $refresh_redirect);

$smarty->assign( 'pageActive', 'product_manage' );
$smarty->assign( 'active_tab', '#product' );
