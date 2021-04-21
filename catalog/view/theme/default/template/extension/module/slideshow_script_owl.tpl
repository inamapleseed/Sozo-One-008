<script type="text/javascript">
    // Note.. it supports Animate.css
    // Manual Slider don't support animate css
    $('#slideshow<?= $module; ?>').owlCarousel({
        items: 1,
        <?php if (count($banners) > 1) { ?>
            loop: true,
        <?php } ?>

        autoplay: true,
        autoplayTimeout: 5000,
        
        smartSpeed: 450,
        
        nav: <?= $arrows; ?>,
        navText: ["<img src='image/catalog/slicing/01_Topgirl/left1.png'>", "<img src='image/catalog/slicing/01_Topgirl/right1.png'>"],
        
        dots: <?= $dots; ?>,
        dotsClass: 'slider-dots slider-custom-dots absolute position-bottom-left w100 list-inline text-center',
        
        //animateOut: 'slideOutDown',
        //animateIn: 'slideInDown',
    });
</script>