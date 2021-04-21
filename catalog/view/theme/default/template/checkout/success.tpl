<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
      
      <?php if($success_ref) : ?>
      <h2><?=$success_ref?></h2>
      <?php else : ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php endif; ?>
      <div class='checkout-success text-center'>
        <div class="line-1">
            <?= $text_order_numrber_is; ?>
        </div>
        <div class="line-2">
            <p><?= $text_you_will_receive_an_email_confirmation_shortly_at; ?></p>
        </div>
        <div class="line-3">
            <a href="<?= $print_receipt_url; ?>" target="_blank" ><?= $print_receipt; ?></a>
        </div>

        <br><br><br>
        
        <div class="line-4">
            <a href="<?php echo $continue; ?>" class="btn btn-primary margin-auto"><?php echo $button_to_home; ?></a>
        </div>
      </div>
     
    
      <?php //echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>