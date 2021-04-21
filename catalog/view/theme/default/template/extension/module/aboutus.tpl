<div class="about-container" >
	<div class="about-images" data-aos="fade-down">
		<?php foreach ($items as $i => $images): ?>
			<div class="about-image-inner" id="img_<?=$i;?>">
				<img src="image/<?=$images['mimage'];?>" alt="images">
			</div>
		<?php endforeach ?>
	</div>
	<div class="about-texts" data-aos="fade-down">
		<h2><?=$title;?></h2>
		<div class="about-description">
			<?php echo html_entity_decode($desc); ?>
		</div>
	</div>
</div>
