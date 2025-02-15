<?php

class FakeTableCellBox extends TableCellBox
{
    var $colspan;
    var $rowspan;

    public function __construct()
    {
        // Required to reset any constraints initiated by CSS properties
        parent::__construct();

        $this->colspan = 1;
        $this->rowspan = 1;

        $this->setCSSProperty(CSS_DISPLAY, 'table-cell');
        $this->setCSSProperty(CSS_VERTICAL_ALIGN, VA_MIDDLE);
    }

    // &$root parameter Added by RCR 20180918
    public static function &create(&$root, &$pipeline)
    {
        $box = new FakeTableCellBox;

        $css_state =& $pipeline->getCurrentCSSState();
        $css_state->pushDefaultState();

        $box->readCSS($css_state);

        $nullbox = new NullBox;
        $nullbox->readCSS($css_state);
        $box->add_child($nullbox);

        $box->readCSS($css_state);

        $css_state->popState();

        return $box;
    }

    public function show(&$viewport)
    {
        return true;
    }

    public function is_fake()
    {
        return true;
    }

    public function get_width_constraint()
    {
        return new WCNone();
    }

    public function get_height_constraint()
    {
        return new HCConstraint(null, null, null);
    }

    public function get_height()
    {
        return 0;
    }

    public function get_top_margin()
    {
        return 0;
    }

    public function get_full_height()
    {
        return 0;
    }

    public function get_max_width(&$content = null, $limit = 10E6)
    {
        return 0;
    }

    public function get_min_width(&$content = null, $limit = 10E6)
    {
        return 0;
    }
}
