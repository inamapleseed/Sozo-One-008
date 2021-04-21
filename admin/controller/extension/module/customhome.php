<?php
class ControllerExtensionModuleCustomHome extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Custom Home',
            'modulename' => 'customhome',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'desc'),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
