<?= $header; ?>
<div>
	<div class="that container">
		<?= $content_top; ?>

		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<div class="row"><?= $column_left; ?>
			<div id="content">			
				<h2><?= $heading_title; ?></h2>
				<div class="contact-container">
					<?php if ($locations) { ?>
						<div class="contact-maps" data-aos="flip-right">
							<?php foreach ($locations as $i => $location) { ?>
								<div class="contact-maps-inner">
									<div class="iframe-wrap">
										<?= $location['gmap_iframe'] ?>
									</div>
									<div class="location-address">
										<p>Location:&nbsp;<?= $location['address']; ?></p>
									</div>
								</div>
							<?php } ?>
						</div>					
					<?php } ?>
					<div class="contact-form-texts">
						<div class="contact-form">
							<form action="<?= $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
								<h3><?= $text_contact; ?></h3>
								<div class="contact-body">
									<div class="form-group required">
										<input type="text" name="name" value="<?= $name; ?>" id="input-name" class="form-control" placeholder="<?= $entry_name; ?>" />
										<?php if ($error_name) { ?>
											<div class="text-danger"><?= $error_name; ?></div>
										<?php } ?>								
									</div>
								
									<div class="form-group required">
										<input type="tel" name="telephone" value="<?= $telephone; ?>" id="input-telephone" class="form-control input-number" placeholder="Phone" />
										<?php if ($error_telephone) { ?>
											<div class="text-danger"><?= $error_telephone; ?></div>
										<?php } ?>
									</div>
								
									<div class="form-group required">
										<input type="text" name="email" value="<?= $email; ?>" id="input-email" class="form-control" placeholder="Email Address" />
										<?php if ($error_email) { ?>
											<div class="text-danger"><?= $error_email; ?></div>
										<?php } ?>
									</div>

									<div class="form-group required">
										<input type="text" name="subject" value="<?= $subject; ?>" id="input-subject" class="form-control" placeholder="<?= $entry_subject; ?>" />
										<?php if ($error_subject) { ?>
											<div class="text-danger"><?= $error_subject; ?></div>
										<?php } ?>
									</div>

									<div class="form-group required">
										<textarea name="enquiry" rows="5" id="input-enquiry" class="form-control" placeholder="<?= $entry_enquiry; ?>"><?= $enquiry; ?></textarea>
										<?php if ($error_enquiry) { ?>
											<div class="text-danger"><?= $error_enquiry; ?></div>
										<?php } ?>
									</div>
								</div>
								<div class="contact-footer">
										<?= $captcha; ?>
									<div>
										<input class="btn this-button" type="submit" value="<?= $button_submit; ?>" />
									</div>
								</div>
							</form>
						</div>
						<div class="store-info">
							<div class="message"><?=$comment;?></div>
							<h3><?= $text_location; ?></h3>
							<div class="store-info-inner">
								<p><?= $text_telephone; ?></p>
								<a href="tel:<?= $store_telephone; ?>" alt="<?= $store_telephone; ?>" title="<?= $store_telephone; ?>" ><?= $store_telephone; ?></a>
							</div>
							<div class="store-info-inner">
								<?php if ($fax) { ?>
									<p><?= $text_fax; ?></p>
									<a href="fax:<?= $fax; ?>" alt="<?= $fax; ?>" title="<?= $fax; ?>" ><?= $fax; ?></a>
								<?php } ?>
							</div>
							<div class="store-info-inner">
								<p>Email:</p>
								<a href="mailto:<?=$store_email;?>"><?=$store_email;?></a>
							</div>
						</div>
					</div>	
				</div>
			</div>
		<?= $column_right; ?></div>
		<?= $content_bottom; ?>
	</div>
</div>	
<?= $footer; ?>
