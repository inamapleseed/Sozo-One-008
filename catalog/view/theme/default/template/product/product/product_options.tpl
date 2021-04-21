<div id="product">

  <?php if(!$not_avail) { ?>

      <?php if ($options) { ?>
        <?php foreach ($options as $i => $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?= ($option['required'] ? ' required' : ''); ?> options">
              <label class="options-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
              <select name="option[<?= $option['product_option_id']; ?>]" id="input-option<?= $option['product_option_id']; ?>" class="form-control">
                <option value=""><?= $text_select; ?></option>

                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <?php if ($option_value['qty'] > 1): ?>
                    <option value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                    <?php } ?>
                    </option>

                    <?php else: ?>

                    <option disabled value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?> - Out Of Stock
                    <?php if ($option_value['price']) { ?>
                    (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
                    <?php } ?>
                    </option>

                  <?php endif ?>
                <?php } ?>
              </select>
            </div>
          <?php } ?>

        <?php if ($option['type'] == 'radio') { ?>
          <div class="options option<?=$i;?> form-group<?= ($option['required'] ? ' required' : ''); ?>">
            <label class=""><?= $option['name']; ?></label>
            <div id="input-option<?= $option['product_option_id']; ?>" class="colors">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label class="the-label">
                      <?php if ($option_value['qty'] >= 1): ?>
                          <input type="radio" class="rad" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option_value['product_option_value_id']; ?>"/>
                      <?php endif ?>
                      <?php if (!$option_value['qty'] >= 1): ?>
                          <input disabled type="radio" class="rad" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option_value['product_option_value_id']; ?>" />
                          <img src="image/catalog/slash.png" alt="X" class="sold-out" title="Out of Stock">
                      <?php endif ?>

                      <?php if ($option_value['image']) { ?>
                        <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                      <?php } ?>

                      <div class="circle img-con" style="border: 1px solid #D7D7D7; background-color: <?= $option_value['name']; ?>; text-align: center; font-weight: normal;">
                        <?php if ($option_value['qty'] <= 0): ?>
                        <?php endif ?>

                        <?php if ($option['name'] == 'Size' || $option['name'] == 'Shoe Size'): ?>
                          <?= $option_value['name']; ?>
                        <?php endif ?>
                      </div>

                    </label>
                  </div>  
              <?php } ?>
            </div>
          </div>
        <?php } ?>        
        <?php } ?>
      <?php } ?>
  <?php } ?>

  <?php if ($recurrings) { ?>
    <hr>
    <h3><?= $text_payment_recurring; ?></h3>
    <div class="form-group required">
      <select name="recurring_id" class="form-control">
        <option value=""><?= $text_select; ?></option>
        <?php foreach ($recurrings as $recurring) { ?>
        <option value="<?= $recurring['recurring_id']; ?>"><?= $recurring['name']; ?></option>
        <?php } ?>
      </select>
      <div class="help-block" id="recurring-description"></div>
    </div>
  <?php } ?>

  <div class="form-group">

    <?php if(!$not_avail) { ?>
      <div class="input-group">
        <label class="qty-label"><?= $entry_qty; ?></label>
          <span class="input-group-btn">
            <button type="button" class="btn btn-default btn-number" data-type="minus" data-field="qty-<?= $product_id; ?>" onclick="descrement($(this).parent().parent())")>
              <span class="glyphicon glyphicon-minus"></span> 
            </button>
          </span>
          <input type="text" name="quantity" class="form-control input-number integer text-center" id="input-quantity" value="<?= $minimum; ?>" >
          <span class="input-group-btn">
            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="qty-<?= $product_id; ?>" onclick="increment($(this).parent().parent())">
              <span class="glyphicon glyphicon-plus"></span>
            </button>
          </span>
      </div>
    <?php } ?>
    <input type="hidden" name="product_id" value="<?= $product_id; ?>" />
    <br />

    <?php if($share_html){ ?>
      <div class="share">
        <span><?= $text_share; ?></span>
        <div><?= $share_html; ?></div>
      </div>
      
    <?php } ?>
    <div class="buttons">
      <?php $currentdate = date('Y-m-d'); if ($date_available <= $currentdate): ?>

          <?php if(!$not_avail) { ?>
          <button type="button" id="button-cart" data-loading-text="<?= $text_loading; ?>" class="btn this-button"><?= $button_cart; ?></button>
          <?php } ?>
        <button 
          type="button" 
          onclick="wishlist.add('<?= $product_id; ?>');" class="btn this-button wlbutton">
          Add to Wishlist
        </button>
      <?php else: ?>
        <button 
          type="button" 
          onclick="wishlist.add('<?= $product_id; ?>');" class="btn this-button wlbutton">
          Add to Wishlist
        </button>
      <?php endif ?>
    </div>
      
    <?php if($download){ ?>
      <a href="<?= $download; ?>" target="_blank" class="btn btn-primary" ><?= $button_download; ?></a>
    <?php } ?>
  </div>
  
  <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?= $text_minimum; ?></div>
  <?php } ?>
</div>

<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    
    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    
    $('.time').datetimepicker({
        pickDate: false
    });

    // Fix for datetimepicker positon issue
    $('.date, .datetime, .time').on('dp.show', function() {
      var datepicker = $('body').find('.bootstrap-datetimepicker-widget');
      if (datepicker.hasClass('bottom')) {
        var top = $(this).offset().top + $(this).outerHeight();
        var left = $(this).offset().left;
        datepicker.css({
          'top': top + 'px',
          'bottom': 'auto',
          'left': left + 'px'
        });
      }
      else if (datepicker.hasClass('top')) {
        var top = $(this).offset().top - datepicker.outerHeight();
        var left = $(this).offset().left;
        datepicker.css({
          'top': top + 'px',
          'bottom': 'auto',
          'left': left + 'px'
        });
      }
    });
    // Fix for datetimepicker positon issue
    
    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;
    
        $('#form-upload').remove();
    
        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
    
        $('#form-upload input[name=\'file\']').trigger('click');
    
        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }
    
        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);
    
                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();
    
                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }
    
                        if (json['success']) {
                            alert(json['success']);
    
                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
  // << OPTIONS IMAGE
    function isEmpty(obj) {
        for(var key in obj) {
            if(obj.hasOwnProperty(key))
                return false;
        }
        return true;
    }
    function getoptionimages(prodid, poid, povid) {
      $('.product-image-additional').css('opacity',0);
      $.ajax({
            url: 'index.php?route=product/product/getoptionimages',
            type: 'get',
            dataType: 'json',
            data: {'prodid': prodid, 'poid': poid, 'povid': povid},
            success: function(json) {
                //console.log(json);
                if(!isEmpty(json['images']) && !isEmpty(json['additional_images'])) {
                  destroySlick();
                  for(var i = 0; i < json['images'].length; i++) {
                    //console.log(json['images'][i]['thumb']);
                    $('.product-image-main').append('<img src="' + json['images'][i]['thumb'] + '" alt="<?= $product_title ?>" title="<?= $product_title ?>" class="main_images pointer" href="' + json['images'][i]['popup'] + '" />');
                    $('.product-image-additional').append('<img src="' + json['additional_images'][i]['thumb'] + '" alt="<?= $product_title ?>" title="<?= $product_title ?>" class="pointer" />');
                  }
                  initSlick();
                }
                else {
                  getprodimages(<?= $product_id ?>, '<?= $prod_image ?>');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
    function getprodimages(prodid, prodimage) {
      $('.product-image-additional').css('opacity',0);
      $.ajax({
            url: 'index.php?route=product/product/ajaxgetprodimages',
            type: 'get',
            dataType: 'json',
            data: {'product_id': prodid, 'prodimage': prodimage},
            success: function(json) {
                //console.log(json);
                if(!isEmpty(json['images']) && !isEmpty(json['additional_images'])) {
                  destroySlick();
                  for(var i = 0; i < json['images'].length; i++) {
                    //console.log(json['images'][i]['thumb']);
                    $('.product-image-main').append('<img src="' + json['images'][i]['thumb'] + '" alt="<?= $product_title ?>" title="<?= $product_title ?>" class="main_images pointer" href="' + json['images'][i]['popup'] + '" />');
                    $('.product-image-additional').append('<img src="' + json['additional_images'][i]['thumb'] + '" alt="<?= $product_title ?>" title="<?= $product_title ?>" class="pointer" />');
                  }
                  initSlick();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
    $(document).on('change', '#product input[type=radio], #product select', function() {
        if($(this).val()) {
            console.log($(this).parent().parent().parent().attr('id'));
            if($(this).parent().parent().parent().attr('id') !== undefined){
            var poid = $(this).parent().parent().parent().attr('id').replace('input-option', '');
            
            } else {
              var poid = $(this).attr('id').replace('input-option', '');
            }
            var povid = $(this).val();
            getoptionimages(<?= $product_id ?>, poid, povid);
        }
        else {
          getprodimages(<?= $product_id ?>, '<?= $prod_image ?>');
        }
    });
    // >> OPTIONS IMAGE 

    //--></script>
  <?php if(isset($update_price_status) && $update_price_status) { ?>
  <script type="text/javascript">
  
    $("#product input[type='checkbox']").click(function() {
      changePrice();
    });
    
    $("#product input[type='radio']").click(function() {
      changePrice();
    });
    
    $("#product select").change(function() {
      changePrice();
    });
    
    $("#input-quantity").blur(function() {
      changePrice();
    });

    $("#input-quantity").parent(".input-group").find(".btn-number").click(function() {
      changePrice();
    });

    $('.input-group-btn .btn').click(function(){
      let inputValue = document.getElementById('input-quantity').value;
        if (inputValue == 1) {
          let priceOne = document.getElementById('price-1').innerHTML;
          console.log(priceOne);
        } else if (inputValue == 2 ) {
          let priceTwo = document.getElementById('price-2').innerHTML;
          console.log(priceTwo);
        } else {
          let priceThree = document.getElementById('price-3').innerHTML;
          console.log(priceThree);
        }
    })   

    function changePrice() {
      $.ajax({
        url: 'index.php?route=product/product/updatePrice&product_id=<?php echo $product_id; ?>',
        type: 'post',
        dataType: 'json',
        data: $('#product input[name=\'quantity\'], #product select, #product input[type=\'checkbox\']:checked, #product input[type=\'radio\']:checked'),
        beforeSend: function() {
          
       
        },
        complete: function() {
          
        },
        success: function(json) {
          $('.alert-success, .alert-danger').remove();
          
          if(json['new_price_found']) {
            
            $('.new-prices').html(json['total_price']);
            $('.product-tax').html(json['tax_price']);
          } else {
            $('.price-').html(json['total_price']);
            $('.product-tax').html(json['tax_price']);
          }

        }


      });
    }
  </script>
<?php } ?>

<style type="text/css">
    .radio {
      display: block !important;
    }

    .colors .radio input {
      display: none !important;
    }    

    input[type=radio][disabled] {
        display: block !important;
        position: absolute;
        right: 0;
        width: 100%;
        height: 0;

    }

    .radio label {
        padding-left: 0;
        margin-right: 20px;
    }

    .sold-out {
        position: absolute;
        width: 100%;
    }

    input[type=radio][disabled]::after {
        content: "";
        background-image: url('../../../../../../../image/catalog/slash.png');
        background-size: cover;
        position: absolute;
        height: 1.5em;
        background-repeat: no-repeat;
        left: 0;
        right: 0;
        top: -2px;
        border: 1px solid transparent;
        z-index: 1;
        background-color: rgba(255,255,255,.4);        
    }

    @media(min-width: 1024px){
      .circle {
        padding: 0 !important;
      }
    }

    @media(max-width: 1023px){
      input[type=radio][disabled]::after {
        right: -93%
      }
    }

    .the-label {
      height: 100%;
      position: relative;
      overflow: hidden;
    }
  </style>