<div id="footer-area">
	<footer>
		<div class="contain">
			<div class="footer-upper-contet">

				<?php if ($menu) { ?>
					<?php foreach($menu as $links){ ?>
					<div class="footer-contact-links">
						<h5>
							<?php if($links['href'] != '#'){ ?>
							<?= $links['name']; ?>
							<?php }else{ ?>
							<a href="<?= $links['href']; ?>" 
								<?php if($links['new_tab']){ ?>
									target="_blank"
								<?php } ?>
								>
								<?= $links['name']; ?></a>
							<?php } ?>
						</h5>
						<?php if($links['child']){ ?>
						<ul class="list-unstyled">
							<?php foreach ($links['child'] as $each) { ?>
							<li><a href="<?= $each['href']; ?>"
								<?php if($each['new_tab']){ ?>
									target="_blank"
								<?php } ?>
								
								>
									<?= $each['name']; ?></a></li>
							<?php } ?>
						</ul>
						<?php } ?>
					</div>
					<?php } ?>
				<?php } ?>

				<div class="footer-contact-info">
					<h5>Stay Connected</h5>
						<?php if($social_icons){ ?>
							<div class="footer-social-icons">
								<?php foreach($social_icons as $icon){ ?>
									<?php if ($icon['title'] != 'WhatsApp'): ?>
										<a href="<?= $icon['link']; ?>" title="<?= $icon['title']; ?>" alt="
													<?= $icon['title']; ?>" target="_blank">
											<img src="<?= $icon['icon']; ?>" title="<?= $icon['title']; ?>" class="img-responsive" alt="<?= $icon['title']; ?>" />
										</a>
									<?php endif ?>
								<?php } ?>
							</div>
						<?php } ?>					
<!-- 						<ul class="list-unstyled">
							<li>
								<?= $text_telephone; ?>: 
								<a href="tel:<?= $telephone; ?>" ><?= $telephone; ?></a>			
							</li>
							<?php if($fax){ ?>
								<li>
									<?= $text_fax; ?>: <a href="fax:<?= $fax; ?>" ><?= $fax; ?></a>
								</li>
							<?php } ?>				
							<li class="length-control">
								<?= $text_email; ?>: <a href="mailto:<?= $email; ?>" title="<?= $email;?>"><?= $email; ?></a>		
							</li>
							<li>
								Location: <?= $address; ?>				
							</li>
						</ul>
 -->						
				</div>
				<div class="">
					<?php if($mailchimp){ ?>
						<div class="newsletter-section">
							<?= $mailchimp; ?>
						</div>
					<?php } ?>				
				</div>
			</div>
			<div class="lower-footer-container">
				<div class="copyright-container">
					<p><?= $powered; ?>. All Rights Reserved</p>
				</div>
				<div class="fcs-container">
					
				</div>
			</div>
		</div>
	</footer>
</div>
<div id="ToTopHover" ></div>
<script>AOS.init({
	once: true
});</script>
<?php 
/* extension bganycombi - Buy Any Get Any Product Combination Pack */
echo $bganycombi_module; 
?>
</body></html>