<?php if($images){ ?>
<div class="product-image-column flex vertical">
   <div class="product-image-additional-container related hidden-xs">
    <div class="product-image-additional">
      <?php foreach($additional_images as $u => $image){ ?>
      <img id="<?=$u;?>" src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>" title="<?= $heading_title; ?>" class="pointer" />
      <?php } ?>
    </div>
  </div>
  <div class="product-image-main-container related">
    <?php $currentdate = date('Y-m-d'); if ($date_available > $currentdate): ?>
          <span 
          class="sticker absolute" 
          style="color: white ; background-color: black">
            Coming Soon!
          </span>
    <?php endif ?>    
    <?php if($sticker && $sticker['name']){ ?>
        <span 
        class="sticker absolute" 
        style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>">
          <?= $sticker['name']; ?>
        </span>
    <?php } ?>
      <?php if($show_special_sticker){ ?>
      <a 
      class="sticker absolute" 
      style="color: #fff; background-color: #E20612; text-transform: uppercase;">
        Sale
      </a>
      <?php } ?>
    <div class="product-image-main">
      <?php foreach($images as $i => $image){ ?>
          <img src="<?= $image['thumb']; ?>" id="img" alt="<?= $heading_title; ?>"
            class="main_images theimage pointer" href="<?= $image['popup']; ?>" title="<?= $heading_title; ?>"
          />
      <?php } ?>
    </div>

    <div class="magnify">
      <a type="btn" data-toggle="modal" data-target="#imagesmodal">
        <img src="image/catalog/slicing/general/magnifying-glass.png" alt="image">
      </a>
    </div>
  </div>
  <div class="product-image-additional-container related visible-xs">
    <div class="product-image-additional">
      <?php foreach($additional_images as $image){ ?>
      <img src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>" title="<?= $heading_title; ?>" class="pointer" />
      <?php } ?>
    </div>
  </div>  

</div>
<?php } ?>

<script type="text/javascript">
    $(document).ready(function () {
      $('.main_images').magnificPopup({
        type: 'image',
        gallery: {
          enabled: true
        }
      });
    });

    $('.magnify').click(function(){
      $('.slick-active .main_images').click();
    })
    if($(window).width() >= 768){
      function initEzPlus() {
          $('.slick-slide.slick-current.slick-active .main_images').ezPlus({
            zoomType: 'inner',
            cursor: 'crosshair',
            easing: true
          });
       }
    }
</script>

