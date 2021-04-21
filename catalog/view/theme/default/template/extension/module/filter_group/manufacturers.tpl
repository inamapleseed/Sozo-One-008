<?php if($manufacturers){ ?>

<div id="side-manufacturer">
	<div class="multiselect">
        <div class="selectBox" onclick="showCheckbox()">
          <select>
            <option><?= $heading_title; ?></option>
          </select>
          <div class="overSelect"></div>
        </div>	
        <div  id="brand-checkbox">	
			<?php foreach($manufacturers as $manufacturer){ ?>
					<label>
						<?php if($manufacturer['checked']){ ?>
						<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>" checked />
						<?php }else{ ?>
						<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>" />
						<?php } ?>
						<?= $manufacturer['name']; ?>
					</label>
			<?php } ?>
		</div>
	</div>
</div>

<?php } ?>

<script type="text/javascript">
  var expanded = false;

    function showCheckbox() {
      let checkboxes = document.getElementById("brand-checkbox");
      if (!expanded) {
        checkboxes.style.display = "block";
        expanded = true;
      } else {
        checkboxes.style.display = "none";
        expanded = false;
      }
    }
</script>