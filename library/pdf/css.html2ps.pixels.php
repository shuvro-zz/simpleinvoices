<?php

class CSSHTML2PSPixels extends CSSPropertyHandler {
  function __construct() {
      parent::__construct(false, false);
  }

  function &default_value() { 
    $value = 800;
    return $value;
  }

  function &parse($value) {
    $value_data = (int)$value;
    return $value_data;
  }

  function getPropertyCode() {
    return CSS_HTML2PS_PIXELS;
  }

  function getPropertyName() {
    return '-html2ps-pixels';
  }
}

$css_html2ps_pixels_reg1 = new CSSHTML2PSPixels();
CSS::register_css_property($css_html2ps_pixels_reg1);
