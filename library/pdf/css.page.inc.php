<?php
// $Header: /cvsroot/html2ps/css.color.inc.php,v 1.13 2007/01/24 18:55:51 Konstantin Exp $

class CSSPage extends CSSPropertyHandler {
  function __construct() {
      parent::__construct(true, true);
  }

  function default_value() { 
    return 'auto'; 
  }

  function parse($value) {
    return $value;
  }

  function getPropertyCode() {
    return CSS_PAGE;
  }

  function getPropertyName() {
    return 'page';
  }
}

$css_page_inc_reg1 = new CSSPage();
CSS::register_css_property($css_page_inc_reg1);
