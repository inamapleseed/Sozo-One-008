<?php
class ControllerExtensionModuleInstagram extends Controller {
	public function index($setting) {
		
		$file = DIR_APPLICATION . 'view/javascript/instagram/css/mycustom.css';
		$filename = 'instagram.log';
		
		$data['heading_title'] = $setting['instagram_module_name'];

		$this->document->addStyle('catalog/view/javascript/instagram/slick/slick.css');
		$this->document->addStyle('catalog/view/javascript/instagram/slick/slick-theme.css');
	
		if( file_exists($file) ){
			$this->document->addStyle('catalog/view/javascript/instagram/css/mycustom.css');
		}else{			
			$this->document->addStyle('catalog/view/javascript/instagram/css/custom.css');
		}

		$this->document->addScript('catalog/view/javascript/instagram/slick/slick.min.js');
		
		$json_link="https://api.instagram.com/v1/users/self/media/recent/?";

		if ($this->request->server['HTTPS']) {
			$json_link.="access_token=".str_replace('http', 'https', $setting['instagram_access_token'])."&count={$setting['instagram_photo_amount']}";	
		} else {
			$json_link.="access_token=".$setting['instagram_access_token']."&count={$setting['instagram_photo_amount']}";		
		}

		$data['log'] = '';
		$data['error_warning'] = '';

		// $cUrl = curl_init();

		// curl_setopt($cUrl, CURLOPT_URL, $json_link);
		
		// curl_setopt($cUrl, CURLOPT_SSL_VERIFYPEER, false);
		// curl_setopt($cUrl, CURLOPT_SSL_VERIFYHOST, false);

		// curl_setopt($cUrl, CURLOPT_RETURNTRANSFER, 1);

		// $returnCurl = curl_exec($cUrl);
		
		// if($returnCurl){
			// $json = $returnCurl;
			// $instagram = json_decode($json, true, 512, JSON_BIGINT_AS_STRING);
			
			// foreach ($instagram['data'] as $instagram ) {
				// $data['instagrams'][] = array(
					// 'href'  => $instagram['link'],
					// 'likes' => $instagram['likes']['count'],				
					// 'img' 	=> str_replace('http://', 'https://', $instagram['images']['standard_resolution']['url']),
					// 'text'	=> $instagram['caption']['text']
				// );
			// }		

			$instagram_arr = $this->getCacheOrJson($json_link, $filename);
			//$instagram = json_decode($json, true, 512, JSON_BIGINT_AS_STRING);
			
			if(isset($instagram_arr['data'])) {
				foreach ($instagram_arr['data'] as $instagram ) {
					$data['instagrams'][] = array(
						'href'  => $instagram['link'],
						'likes' => $instagram['likes']['count'],				
						'img' 	=> str_replace('http://', 'https://', $instagram['images']['standard_resolution']['url']),
						'text'	=> $instagram['caption']['text']
					);
				}
			}

			$data['entry_instagram'] 	= html($setting['instagram_module_name']);

			$data['slidesToShow'] 		= $setting['instagram_plugin_slide_show'];		
			$data['slidesToScroll'] 	= $setting['instagram_plugin_slide_scroll'];
			$data['autoplay'] 			= $setting['instagram_plugin_auto_play'];
			$data['autoplaySpeed'] 		= $setting['instagram_plugin_auto_play_speed'];
			$data['dots'] 				= $setting['instagram_plugin_dots'];
			$data['arrows'] 			= $setting['instagram_plugin_arrows'];

			$data['heart_color'] 		= $setting['instagram_heart_color'];
			$data['heart_text_color'] 	= $setting['instagram_text_heart_color'];

			$data['slidesToShowTablet'] 	= $setting['instagram_plugin_slide_show_tablet'];
			$data['slidesToScrollTablet'] 	= $setting['instagram_plugin_slide_scroll_tablet'];
			$data['slidesToShowCelphone'] 	= $setting['instagram_plugin_slide_show_celphone'];
			$data['slidesToScrollCelphone'] = $setting['instagram_plugin_slide_scroll_celphone'];
			$data['center_mode']			= $setting['instagram_center_mode'];

			$data['use_plugin']				= $setting['instagram_use_plugin'];

			$data['color'] = $setting['instagram_arrow_color'];
			$data['text_align'] = $setting['instagram_text_align'];
			$data['hover_effect'] = $setting['instagram_hover_heart'];
			
			return $this->load->view('extension/module/instagram.tpl', $data);			
		// }else{
			// $this->log = new log($filename);
			// $this->log->write(file_get_contents($json_link));
		// }
	}
	
	function getCacheOrJson($json_link, $filename) {
		$cacheFile = DIR_CACHE . DIRECTORY_SEPARATOR . 'cache-ig-'.md5('cache-ig-data');

		if (file_exists($cacheFile)) {
			$fh = fopen($cacheFile, 'r');
			$cacheTime = trim(fgets($fh));

			// if data was cached recently, return cached data
			if ($cacheTime > strtotime('-10 minutes')) {
				//return json_decode(fread($fh, filesize($cacheFile)), true);
				return json_decode(fread($fh, filesize($cacheFile)), true, 512, JSON_BIGINT_AS_STRING);
			}

			// else delete cache file
			fclose($fh);
			unlink($cacheFile);
		}

		$cUrl = curl_init();

		curl_setopt($cUrl, CURLOPT_URL, $json_link);
		
		curl_setopt($cUrl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($cUrl, CURLOPT_SSL_VERIFYHOST, false);

		curl_setopt($cUrl, CURLOPT_RETURNTRANSFER, 1);

		$returnCurl = curl_exec($cUrl);
		
		if($returnCurl){
			//$fh = fopen($cacheFile, 'w');
			//fwrite($fh, time() . "\n");
			//fwrite($fh, json_encode($json));
			//fclose($fh);
			
			file_put_contents($cacheFile, time()."\n".$returnCurl);
			
			return json_decode($returnCurl, true, 512, JSON_BIGINT_AS_STRING);
		}else{
			$this->log = new log($filename);
			$this->log->write(file_get_contents($json_link));
			
			return array();
		}
	}
}