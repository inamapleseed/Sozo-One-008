<h3><?= $product_name; ?></h3>
<?php if ($price && !$enquiry) { ?>
  <ul class="list-unstyled the-ul">

<?php if (!$special || !$special2 || !$special3): ?>
      <li class="not-sale">
        <div class="product-price price-3" value="<?= $price; ?>" id="price-3"><?= $price; ?></div>

        <?php if (!empty($isbn)): ?>
          &nbsp;/&nbsp;<div class="product-price price-2" value="<?= $isbn; ?>"id="price-2"><?= $isbn; ?></div>&nbsp;/&nbsp;
        <?php endif ?>     

        <?php if (!empty($mpn)): ?>
          <div class="product-price price-1" value="<?= $mpn; ?>" id="price-1"><?= $mpn; ?></div>
        <?php endif ?>
      </li>
      <?php else: ?>
        <li class="not-sale" style="font-size: 1.2em;color: red; font-weight: bold; margin-bottom: 5px;">
          <?=$special?>

          <?php if (!empty($special2)): ?>
            &nbsp;/&nbsp;<?=$special2?>&nbsp;/&nbsp;
          <?php endif ?>

          <?php if (!empty($special3)): ?>
            <?=$special3?>
          <?php endif ?>
        </li>
        <li class="not-sale" style="opacity: .7; text-decoration: line-through;">
          <div class="product-price price-3" value="<?= $price; ?>" id="price-3"><?= $price; ?></div>

          <?php if (!empty($isbn)): ?>
            &nbsp;/&nbsp;<div class="product-price price-2" value="<?= $isbn; ?>"id="price-2"><?= $isbn; ?></div>&nbsp;/&nbsp;
          <?php endif ?>     

          <?php if (!empty($mpn)): ?>
            <div class="product-price price-1" value="<?= $mpn; ?>" id="price-1"><?= $mpn; ?></div>
          <?php endif ?>
        </li>
<?php endif ?>

      <?php if ($tax) { ?>
        <li class="product-tax-price product-tax" ><?= $text_tax; ?> <?= $tax; ?></li>
      <?php } ?>

      <?php if ($discounts) { ?>
      <li>
        <hr>
      </li>
      <?php foreach ($discounts as $discount) { ?>
      <li><?= $discount['quantity']; ?><?= $text_discount; ?><?= $discount['price']; ?></li>
      <?php } ?>
      <?php } ?>
  </ul>
<?php } ?>


<?php if ($waiting_module): ?>
  <?= $waiting_module; ?>
  <?php else: ?>
  <?php include_once('product_options.tpl'); ?>
<?php endif ?>
