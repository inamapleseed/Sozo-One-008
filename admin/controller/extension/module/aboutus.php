<?php
class ControllerExtensionModuleAboutus extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'About Us',
            'modulename' => 'aboutus',
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Items', 'name' => 'items',
                    'fields' => array(
                    array('type' => 'image', 'label' => 'Main Image', 'name' => 'mimage'),
                    )
                ),
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'desc', 'ckeditor' => true),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
