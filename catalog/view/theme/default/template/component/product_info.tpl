<div class="product-gutter">
	<div class="product-block <?= $out_of_stock; ?>">
		<div class="product-image-block relative image-zoom-hover">

			<?php $currentdate = date('Y-m-d'); if ($date_available > $currentdate): ?>
			  <span 
			  class="sticker absolute" 
			  style="color: white ; background-color: black">
			    Coming Soon!
			  </span>
			<?php endif ?>

			<?php if($show_special_sticker){ ?>
				<a 
				href="<?= $href; ?>" 
				title="<?= $name; ?>" 
				class=" sticker absolute" 
				style="color: #fff; background-color: #E20612; text-transform: uppercase;">
					Sale
				</a>
			<?php } ?>

			<?php if($sticker && $sticker['name']){ ?>
			  <span 
			  class="sticker absolute" 
			  style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>">
			    <?= $sticker['name']; ?>
			  </span>
			<?php } ?>
        
			<a 
				href="<?= $href; ?>" 
				title="<?= $name; ?>" 
				class="product-image image-container relative" >

				<img 
					src="<?= $thumb; ?>" 
					alt="<?= $name; ?>" 
					title="<?= $name; ?>"
					class="img-responsive" />
			</a>

		</div>
		
		<div class="product-name">
			<a href="<?= $href; ?>"><?= mb_strimwidth($name, 0, 35, '...'); ?></a>
		</div>

		<div class="product-details">
			<?php if ($price && !$special || !$special2 || !$special3) { ?>
				<div class="price">
					<div class="not-sale">
						<?= $price; ?>
						<?php if (!empty($isbn)): ?>
							/&nbsp;<?=$isbn; ?>/
						<?php endif ?>
						<?php if (!empty($mpn)): ?>
						    <?=$mpn; ?>
						<?php endif ?>
					</div>
					<?php if ($tax) { ?>
						<span class="price-tax"><?= $text_tax; ?> <?= $tax; ?></span>
					<?php } ?>
				</div>
			<?php } else { ?>
		        <li class="not-sale" style="list-style: none; font-size: 1.1em;color: red; font-weight: bold; margin-bottom: 5px;">
		          <?=$special?>

		          <?php if (!empty($special2)): ?>
		            &nbsp;/&nbsp;<?=$special2?>&nbsp;/&nbsp;
		          <?php endif ?>

		          <?php if (!empty($special3)): ?>
		            <?=$special3?>
		          <?php endif ?>
		        </li>				
			<?php } ?>

			<?php if($enquiry){ ?>
				<i>Price unavailable</i>
			<?php } ?>
		</div>
	</div>
</div>




