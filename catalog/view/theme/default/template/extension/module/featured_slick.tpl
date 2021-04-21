<div class="featured-module featured_<?= $uqid; ?>" data-aos="flip-right">
  <h2 class="text-center target-heading">
    <?= $heading_title; ?>
  </h2>
  <div class="featured section relative" style="opacity: 0;">
    <div id="featured_slider_<?= $uqid; ?>">
      <?php foreach ($products as $product) { ?>
        <?= html($product); ?>
      <?php } ?>
    </div>

      <?php if ($uqid == '31_'): ?>
        <div class="view-tton">
            <a href="index.php?route=product/category&path=11" class="this-button">View All</a>
        </div>
      <?php endif ?>
      <?php if ($uqid == '32_1'): ?>
        <div class="view-tton">
            <a href="index.php?route=product/category&path=12" class="this-button">View All</a>
        </div>
      <?php endif ?>      

    <script type="text/javascript">

      $(window).load(function(){
        setTimeout(function () {
          featured_product_slick<?= $uqid; ?>();
          AOS.init();
        }, 250);
      });

      function featured_product_slick<?= $uqid; ?>(){
        $("#featured_slider_<?= $uqid; ?>").on('init', function (event, slick) {
          $('#featured_slider_<?= $uqid; ?>').parent().removeAttr('style');
        });

        $("#featured_slider_<?= $uqid; ?>").slick({
          dots: false,
          infinite: false,
          speed: 300,
          slidesToShow: 4,
          slidesToScroll: 1,
          centerMode: false,
          arrows: false,
          autoplay: false,
          responsive: [
            {
              breakpoint: 1199,
              settings: {
                slidesToShow: 3,
              }
            },
            {
              breakpoint: 991,
              settings: "unslick"
            }
          ],
          prevArrow: "<div class='contain-arrows'><div class='contain-inner-arrow'><img src='image/catalog/slicing/01_Topgirl/left-min.png'><div class='hide-at-first'><img src='image/catalog/slicing/01_Topgirl/left1.png'></div></div></div>",
          nextArrow: "<div class='contain-arrows'><div class='contain-inner-arrow'><img src='image/catalog/slicing/01_Topgirl/Shape-2-1.png'><div class='hide-at-first'><img src='image/catalog/slicing/01_Topgirl/right1.png'></div></div></div>",
        });

        
      }
    </script>
  </div>
</div>