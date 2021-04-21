<?php if (".common-home"): ?>
	<h2><?php echo  ($heading_title) ? $heading_title : ''; ?></h2>
<?php endif ?>
<div class="fcategory-inner" data-aos="flip-right">
  <?php foreach ($categories as $category) { ?>
  <div class="product-layout">
	<div class="image">
		<a href="<?=$category['href'];?>">
	  		<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" />
	  	</a>
  		<div class="category-title">
		    <h4><?php echo $category['name']; ?></h4>
		</div>
		<div class="category-button">
		    <a class="this-button" href="<?php echo $category['href']; ?>">Shop Now</a>
		</div>
  	</div>
  </div>
  <?php } ?>
</div>
