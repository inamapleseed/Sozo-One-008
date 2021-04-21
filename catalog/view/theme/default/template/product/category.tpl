<?php echo $header; ?>
<div>
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $i => $breadcrumb) { ?>
        <?php if ($i == 0): ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php endif ?>
      <?php } ?>
      
      <li><a href="index.php?route=product/category">Products</a></li>

      <?php foreach ($breadcrumbs as $i => $breadcrumb) { ?>
        <?php if ($i == 1): ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php endif ?>
      <?php } ?>

    </ul>
    <div class="row">
    
      <?php echo $column_left; ?>

      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>

      <div id="content" class="<?php echo $class; ?>">

        <div id="product-filter-replace">
          <div id="product-filter-loading-overlay"></div>
          <h2><?php echo $heading_title; ?></h2> 
          
            <?php if ($products) { ?>
            <div class="try">
              <?php echo $content_top; ?>
              <?php include_once('sort_order.tpl'); ?>
            </div>    
              <div id="product-filter-detect">
                
                <div class="row row-special">
                  <div class="product-view">
                    <?php foreach ($products as $product) { ?>
                      <?php echo $product; ?>
                    <?php } ?>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
                </div>

              </div> <!-- #product-filter-detect -->

            <?php } ?>

            <?php if (!$products) { ?>
            
              <p><?php echo $text_empty; ?></p>
              <div class="buttons hidden">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
              </div>

            <?php } ?>

        </div> <!-- #product-filter-replace -->
      </div> <!-- #content -->

      <?php echo $column_right; ?></div>
      <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?>
