<div class="sorts">
    <div class="form-group">
        <select id="input-sort" class="form-control no-custom" onchange="select_handler();">
        <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
                <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
        <?php } ?>
        </select>
    </div>

    <div class="form-group">
        <select id="input-limit" class="form-control no-custom" onchange="select_handler();">
        <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['value']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
                <option value="<?php echo $limits['value']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
        <?php } ?>
        </select>
    </div>
</div>
<div class="row sortstwo">
    <div class="fix_filter">
        <div class="col-xs-4">
            <button id="filter_group_tigger_open" class="visible-xs btn btn-primary" onclick="$('#filter-groups').addClass('open');" ><?= $button_filter; ?></button>
        </div>
        <div class="col-md-2 col-md-offset-8 col-xs-4">
            <div class="form-group input-group-b4">
            <select id="input-limit" class="form-control no-custom select_sort" onchange="select_handler();">
                <option disabled="" selected="selected" value="12"><?php echo $text_limit; ?></option>
                <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['value']; ?>" ><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $limits['value']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>

    <div class="col-md-2 col-xs-4">
        <div class="form-group input-group-b4">
            <select id="input-sort" class="form-control no-custom select_sort" onchange="select_handler();">
                <option disabled="" selected="selected" value="sort_order-ASC"><?php echo $text_sort; ?></option>
                <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                <?php } ?>
                </select>
            </div>
        </div>
    </div>
</div>
