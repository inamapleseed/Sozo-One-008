<?php if (count($currencies) > 1) {  ?>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
    <div class="btn-group">
      <button class="dropdown-toggle" data-toggle="dropdown">
        <?php foreach ($currencies as $currency) {?>

          <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>

            <strong>
                <span><?php echo $currency['code']; ?></span>
              </strong>
          <?php } elseif ($currency['code'] && $currency['code'] == $code) { ?>
            <strong><span><?php echo $currency['code']; ?></span></strong>
          <?php } ?>
        <?php } ?>
        <i class="fa fa-chevron-down"></i></button>
        <ul class="dropdown-menu">
          <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['symbol_left']) { ?>
              <li>  <button class="currency-select btn-block" type="button" name="<?php echo $currency['code']; ?>"> 
                    <?php echo $currency['code']; ?>
                      
                    </button></li>
            <?php } else { ?>
              <li> <button class="currency-select btn-block" type="button" name="<?php echo $currency['code']; ?>">
                <?php echo $currency['code']; ?>
                    </button></li>
            <?php } ?>
          <?php } ?>
        </ul>
      </div>
      <input type="hidden" name="code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
  <?php } ?>

<!-- <script type="text/javascript">
  $('.dropdown-toggle').click(function(){
    alert();
  });
</script> -->
