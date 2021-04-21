<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?=$direction; ?>" lang="<?=$lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?=$direction; ?>" lang="<?=$lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?=$direction; ?>" lang="<?=$lang; ?>">
<!--<![endif]-->

<?= $head_tags ?>

<body class="<?=$class; ?> <?= $seo_enabled?'short_hand':''; ?> <?= $isMobile; ?>">

	<div id="loading_wrapper">
		<div class="spinner">
		  <div class="dot1"></div>
		  <div class="dot2"></div>
		</div>
	</div>

	<?php /*** loading page ***/ ?>
	<style>
		.loader {
			position: fixed;
			left: 0px;
			top: 0px;
			width: 100%;
			height: 100%;
			z-index: 9999; 
		}
	</style>
	<div class="loader" style="background: url('<?=$logo; ?>') 50% 50% / auto 50px no-repeat rgb(255, 255, 255);"></div>
	<script tyle="text/javascript">
		$(window).load(function() {
			// hide loading gif when page done loading
			$(".loader").fadeOut("slow");
		});
		// document.addEventListener('contextmenu', event => event.preventDefault());

	</script>
	<?php /*** loading page ***/ ?>

	<?= $fb_messanger; ?>
	<div class="x213"><h1 id="page_heading_title" ><?= $title; ?></h1></div>
	<header class="fixed-header" >
			
			<div class="header-container">
				<div class="header-top">
					<div class="header-mobile-links visible-xs visible-sm">
						<div class="header-links">
							<a id="mobileNav" href="#sidr" class="pointer esc">
								<i class="fa fa-bars"></i>
							</a>
							<span class="hidden-xs hidden-sm">
								<?= $pop_up_search; ?>
							</span>
						</div>
					</div>
					<div class="search_container">
						<span class="hidden-xs hidden-sm"><?= $search; ?></span>
					</div>

					<div class="header-logo">
						<?php if ($logo) { ?>
							<a class="header-logo-image" href="<?=$home; ?>">
								<img src="<?=$logo; ?>" title="<?=$name; ?>" alt="<?=$name; ?>" class="img-responsive" />
							</a>
						<?php } else { ?>
							<a class="header-logo-text" href="<?=$home; ?>"><?=$name; ?></a>
						<?php } ?>
					</div>
					<div class="header-icons">
						<div class="header-user">
							<span class="hidden-xs hidden-sm">
								<?= $login_part; ?>
							</span>
						</div>
						<?=$currency; ?>
						<?= $cart; ?>
					</div>

					<span class="hidden" >
						<?=$language; ?>
						<?=$wishlist; ?>
					</span>
				</div>
				<div class="header-menu hidden-xs hidden-sm">

					<?= $menu; ?>
				</div>
			</div>
			
	</header>

	<!--<?php if($social_icons){ ?>
		<div class="floating-social-icons">
			<?php foreach($social_icons as $i => $icon){ ?>
				<?php if ($icon['title'] == 'WhatsApp'): ?>
					<a href="<?= $icon['link']; ?>" title="<?= $icon['title']; ?>" alt="
								<?= $icon['title']; ?>" target="_blank">
						<img src="<?= $icon['icon']; ?>" title="<?= $icon['title']; ?>" class="img-responsive" alt="<?= $icon['title']; ?>" />
					</a>
				<?php endif ?>
			<?php } ?>
		</div>
	<?php } ?>	-->

	<div id="sidr">
		<div class="header-mobile">
			<div class="mobile-account relative">
				<?php if($logged){ ?> 
				<a href="<?= $account; ?>">
					<i class="fa fa-user-circle-o" aria-hidden="true"></i>
					<?= $text_account; ?></a>
				<a href="<?= $logout; ?>">
					<i class="fa fa-sign-out" aria-hidden="true"></i>
					<?= $text_logout; ?></a>
				<?php }else{ ?> 
				<a href="<?= $login; ?>">
					<i class="fa fa-user-circle-o" aria-hidden="true"></i>
					<?= $text_login; ?></a>
				<a href="<?= $register; ?>">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<?= $text_register; ?></a>
				<?php } ?>
			</div>
			<div class="mobile-search">
				<?= $search; ?>
			</div>
		</div>
			
		<?= $mobile_menu; ?>
	</div>


	<?= $page_banner; ?>

<script type="text/javascript">
  $(window).scroll(function () {
    if ($(this).scrollTop() > 150) {
      $('.fixed-header').addClass('nav_scroll');
    } else {
      $('.fixed-header').removeClass('nav_scroll');
    }
  });
</script>	
<!-- Load Facebook SDK for JavaScript -->
      <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v7.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <!-- Your Chat Plugin code -->
      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="412616552623429">
      </div>
      
<style>
    .floating-social-icons {
        width: 60px !important;
        bottom: 7em !important;
        right: 1.7em !important;
    }
</style>