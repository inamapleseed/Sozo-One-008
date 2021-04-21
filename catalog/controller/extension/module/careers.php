<?php
class ControllerExtensionModuleCareers extends Controller {
    public function index() {
        // Handle custom fields
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'careers';
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);

        $data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );
        $data['desc'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'desc' );
        
        return $this->load->view('extension/module/careers', $data);
    }
}