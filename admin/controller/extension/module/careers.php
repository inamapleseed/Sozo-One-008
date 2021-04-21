<?php
class ControllerExtensionModuleCareers extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Careers',
            'modulename' => 'careers',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'desc', 'ckeditor' => true),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
