<?php
require_once(HTML2PS_DIR . 'pipeline.class.php');
require_once(HTML2PS_DIR . 'fetcher.url.class.php');

class PipelineFactory
{
    public static function &create_default_pipeline($encoding, $filename)
    {
        $pipeline = new Pipeline();

        if (isset($GLOBALS['g_config'])) {
            $pipeline->configure($GLOBALS['g_config']);
        } else {
            $pipeline->configure(array());
        }

        // @formatter:off
    $pipeline->fetchers[]        = new FetcherURL();
    $pipeline->data_filters[]    = new DataFilterDoctype();
    $pipeline->data_filters[]    = new DataFilterUTF8($encoding);
    $pipeline->data_filters[]    = new DataFilterHTML2XHTML();
    $pipeline->parser            = new ParserXHTML();
    $pipeline->pre_tree_filters  = array();
    $pipeline->layout_engine     = new LayoutEngineDefault();
    $pipeline->post_tree_filters = array();
    $pipeline->output_driver     = new OutputDriverFPDF();
    $pipeline->output_filters    = array();
    // Changed to use one parameter by RCR 20181129
    //    $pipeline->destination       = new DestinationDownload($filename, ContentType::pdf());
    $pipeline->destination       = new DestinationDownload($filename);
    // @formatter:on
        return $pipeline;
    }
}
