<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

    <div id="the-modal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <?php if($mailchimp){ ?>
                        <div class="newsletter-section">
                            <?= $mailchimp; ?>
                        </div>
                    <?php } ?>
                </div>
                <div class="eks">
                    <button data-dismiss="modal">x</button>
                </div>
            </div>
        </div>
    </div>    

</div>
<?php echo $footer; ?>

<script>
    setTimeout(function(){
        $(document).ready(function(){
            $("#the-modal").modal('show');
        });
    }, 10000);
    
</script>