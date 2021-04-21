<div id="side_filter" class="panel panel-default">
  <?php if(isset($filter_groups)) { ?>
    <?php foreach ($filter_groups as $i => $filter_group) { ?>
      <?php if ($filter_group['filter_group_id'] == 1 || $filter_group['filter_group_id'] == 2): ?>
        <div class="fillers" id="filter-group<?php echo $filter_group['filter_group_id']; ?> <?=$i;?>">

          <div class="multiselect">
            <div class="selectBox" >
              <select>
                <option><?php echo $filter_group['name']; ?></option>
              </select>
              <div class="overSelect"></div>
            </div>
            <div class="checkbox" id="checkboxes">
              <?php foreach ($filter_group['filter'] as $i => $filter) { ?>
                  <label onmouseup="catchFilter();" >
                    <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                    <?php echo $filter['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
                    <?php echo $filter['name']; ?>
                    <?php } ?>
                  </label>
              <?php } ?>         
            </div>
          </div>

        </div>
      <?php endif ?>
    <?php } ?>
  <?php } ?>
</div>

<script type="text/javascript">
  $(document).ready(function(){

    $('.selectBox').click(function(){
      $(this).parent().find('#checkboxes').toggle();
    });
    
  });
</script>