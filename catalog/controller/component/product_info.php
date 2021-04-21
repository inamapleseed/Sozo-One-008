<?php
    class ControllerComponentProductInfo extends Controller{
        public function index($product_id = 0){

            $url = '';

            if( is_array($product_id) ){
                $url = $product_id['url']; 
                $product_id = $product_id['product_id']; 
            }

            $this->load->language('component/product_info');
            // Clean Value
            $product_id = (int)$product_id;

            // No product id pass into this controller
            if(!$product_id) return '';

            $this->load->model('catalog/product');

            $product_info = $this->model_catalog_product->getProduct($product_id);

            // Product Disabled / Deleted
            if(!$product_info) return '';

            $theme = $this->config->get('config_theme');
            $width = $this->config->get($theme . '_image_product_width');
            $height = $this->config->get($theme . '_image_product_height');

            $image = $this->model_tool_image->resize('no_image.png', $width, $height);
                
            $price = false;
            $mpn = false;
            $isbn = false;
            $special = false;
            $special2 = false;
            $special3 = false;
            $rating = false;
            $tax = false;

            if (is_file(DIR_IMAGE . $product_info['image']) && $product_info['image']) 
                $image = $this->model_tool_image->resize($product_info['image'], $width, $height);
            
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')){
                if ($this->config->get('config_product_decimal_places')) {
                    $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $isbn = $this->currency->format($this->tax->calculate($product_info['isbn'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $mpn = $this->currency->format($this->tax->calculate($product_info['mpn'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = $this->currency->format2($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $isbn = $this->currency->format2($this->tax->calculate($product_info['isbn'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                    $mpn = $this->currency->format2($this->tax->calculate($product_info['mpn'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                }
            }

            if ((float)$product_info['special']) {
                if ($this->config->get('config_product_decimal_places')) {
                    $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    $special2 = $this->currency->format($this->tax->calculate($product_info['special2'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    $special3 = $this->currency->format($this->tax->calculate($product_info['special3'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = $this->currency->format2($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    $special2 = $this->currency->format2($this->tax->calculate($product_info['special2'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    $special3 = $this->currency->format2($this->tax->calculate($product_info['special3'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                }
            }
            
            if ($this->config->get('config_tax')) 
                $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
            
            if ($this->config->get('config_review_status'))
                $rating = (int)$product_info['rating'];

            $options = $this->model_catalog_product->getProductOptions($product_id);

            $product_url = $this->url->link('product/product', 'product_id=' . $product_info['product_id']);

            if ($url) {
                $product_url = $this->url->link('product/product', $url . '&product_id=' . $product_info['product_id']);
            }

            $sticker = $this->load->controller('component/sticker', $product_info['product_id']);

            $info = array(
                'product_id'        => $product_info['product_id'],
				'thumb'             => $image, 
                'name'              => $product_info['name'],
                'minimum'           => $product_info['minimum'],
				'description'       => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($theme . '_product_description_length')),
                'date_available'    => $product_info['date_available'],
                // 'cname'             => $category_info['name'],
				'price'             => $price,
                'mpn'               => $mpn,
                'isbn'              => $isbn,
				'special'           => $special,
                'special2'           => $special2,
                'special3'           => $special3,
				'tax'               => $tax,
				'rating'            => $rating,
                'href'              => $product_url,
                
                // Text
				'text_tax'			=> $this->language->get('text_tax'),
				'button_cart'		=> $this->language->get('button_cart'),
				'button_wishlist'	=> $this->language->get('button_wishlist'),
                'button_compare'	=> $this->language->get('button_compare'),
                'button_enquiry'    => $this->language->get('button_enquiry'),
                'label_enquiry'     => $this->language->get('label_enquiry'),

                'more_options'      => $options?$this->language->get('text_more_options_available'):'',
                
                'enquiry'           => ((float)$product_info['price'] <= 0),

                'sticker'           =>  $sticker,
                'out_of_stock'      =>  $this->config->get('config_stock_checkout')?'':($product_info['quantity']>0?'':'out-of-stock'),
                'show_special_sticker' => $special ? 1 : 0,
                'text_sale' => $this->language->get('text_sale'),
            );
            // debug($info);
            //cname present except in home page
            
            return $this->load->view('component/product_info', $info);
        }
    }