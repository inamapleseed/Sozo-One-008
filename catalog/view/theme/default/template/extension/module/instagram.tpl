<div class="row max-offset">
	<div class="module-instagram">
		<?php if(!empty($instagrams)) {?>
		<?php if($entry_instagram) { ?>
		<div class="section-title text-center pd-t30 pd-md-t60">
			<?php echo $entry_instagram; ?>
		</div>
		<?php } ?>
		<div class="instagramslide">

			<?php foreach ($instagrams as $instagram){ ?>
			<div class="item <?php echo $hover_effect;?>">
				<a href="<?php echo $instagram['href'];?>" target="_blank" data-like="<?php echo $instagram['likes'];?>" title="<?php echo $instagram['text'];?>">
					<i class="fa fa-heart" aria-hidden="true"></i>
					<img src="<?php echo $instagram['img'];?>" alt="<?php echo $instagram['text'];?>">
				</a>
			</div>
			<?php } ?>

		</div>
		<?php } ?>
	</div>
</div>

<?php if($use_plugin): ?>
	<script>
		$('.instagramslide').slick({
			slidesToShow: <?php echo $slidesToShow;?>,
			slidesToScroll: <?php echo $slidesToScroll ?>,
			autoplay: <?php echo $autoplay; ?>,
			autoplaySpeed: <?php echo $autoplaySpeed; ?>,
			dots: <?php echo $dots; ?>,
			arrows: <?php echo $arrows; ?>,
			<?php echo ($center_mode) ? "centerMode : $center_mode," : ''; ?>
			responsive: [{
					breakpoint: 1201,
					settings: {
						slidesToShow: <?php echo $slidesToShow; ?>,
						slidesToScroll: <?php echo $slidesToScroll ?>,
						infinite: true,
						arrows: false
					}
				},
				{
					breakpoint: 1200,
					settings: {
						slidesToShow: <?php echo $slidesToShowTablet; ?>,
						slidesToScroll: <?php echo $slidesToScrollTablet; ?>,
						arrows: false
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: <?php echo $slidesToShowCelphone; ?>,
						slidesToScroll: <?php echo $slidesToScrollCelphone; ?>,
						arrows: false
					}
				}
			]
		});
	</script>
<?php endif; ?>