<?php if($categories) { ?>
	<div id="side-categories">
		<div class="">
			<select onchange="location = this.value;">
				<option>
					<label><?= $heading_title; ?></label>
				</option>
				<?php foreach($categories as $category){ ?>
					<?php foreach($category['child'] as $child_1){ ?>
						<option value="<?= $child_1['href']; ?>">
							<?= $child_1['name']; ?>
						</option>
					<?php } ?>
				<?php }  ?>
			</select>
		</div>
	</div>
<?php } ?>