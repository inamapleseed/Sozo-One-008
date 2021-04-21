<?php
class ControllerExtensionModuleAboutus extends Controller {
    public function index() {
        // Handle custom fields
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'aboutus';
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);

        $data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );
        $data['desc'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'desc' );
        $data['items'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'items' );
        
        return $this->load->view('extension/module/aboutus', $data);
    }
}