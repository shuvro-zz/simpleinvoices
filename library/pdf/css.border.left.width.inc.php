<?php
// $Header: /cvsroot/html2ps/css.border.left.width.inc.php,v 1.2 2007/02/04 17:08:18 Konstantin Exp $

class CSSBorderLeftWidth extends CSSSubProperty
{
    public function __construct(&$owner)
    {
        parent::__construct($owner);
    }

    public function setValue(&$owner_value, &$value)
    {
        if ($value != CSS_PROPERTY_INHERIT) {
            $owner_value->left->width = $value->copy();
        } else {
            $owner_value->left->width = $value;
        }
    }

    public function &getValue(&$owner_value)
    {
        return $owner_value->left->width;
    }

    public static function getPropertyCode()
    {
        return CSS_BORDER_LEFT_WIDTH;
    }

    public static function getPropertyName()
    {
        return 'border-left-width';
    }

    public static function parse($value)
    {
        if ($value == 'inherit') {
            return CSS_PROPERTY_INHERIT;
        }

        $width_handler = CSS::get_handler(CSS_BORDER_WIDTH);
        $width = $width_handler->parse_value($value);
        return $width;
    }

    public static function default_value()
    {
    }

}
