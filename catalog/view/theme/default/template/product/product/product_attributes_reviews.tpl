<?php if ($attribute_groups || $review_status) { ?>
<div class="attr-content">
  <?php if ($attribute_groups) { ?>
    <?php foreach ($attribute_groups as $index_1 => $attribute_group) { ?>
      <?php foreach ($attribute_group['attribute'] as $index_2 => $attribute) { ?>

        <div class="attr-inner">
          <div class="attr-title">
            <a data-toggle="collapse" data-target="#tab-attribute-<?= $index_1; ?>-<?= $index_2; ?>">
              <?= $attribute['name']; ?>
              <div>+</div>
            </a>
          </div>
          
          <div id="tab-attribute-<?= $index_1; ?>-<?= $index_2; ?>" class="collapse">
            <div class="tab-content">
              <div class="tab-pane <?= !$index_2?'active':''; ?>" id="tab-attribute-<?= $index_1; ?>-<?= $index_2; ?>">
                <?php if ($attribute['text']): ?>
                  <?= html($attribute['text']); ?>
                  <?php else: ?>
                  <div class="no-content-here">
                    <i>
                      <?=$text_content;?>
                    </i>
                  </div>
                <?php endif ?>
              </div>              
            </div>
          </div>
        </div>
      <?php } ?>
    <?php } ?>
  <?php } ?>
</div>

    <?php if ($review_status) { ?>
      <div class="attr-title">
        <a data-toggle="collapse" data-target="#tab-review"><?= $tab_review; ?><div>+</div></a>
      </div>

      <?php if ($review_status) { ?>
        <div class="tab-pan collapse" id="tab-review">
          <form class="form-horizontal" id="form-review">
            <div id="review"></div>
            <?php if ($review_guest) { ?>
            <div class="form-group required hidden">
              <div class="col-sm-12">
                <label class="control-label" for="input-name"><?= $entry_name; ?></label>
                <input type="text" name="name" value="Anonymous" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <div class="col-sm-12">
                <textarea placeholder="Submit your review here..." name="text" rows="5" id="input-review" class="form-control"></textarea>
              </div>
            </div>
            <div class="form-group required">

              <fieldset>
                <span class="star-cb-group">
                  <input type="radio" id="rating-5" name="rating" value="5" /><label for="rating-5">5</label>
                  <input type="radio" id="rating-4" name="rating" value="4" checked="checked" /><label for="rating-4">4</label>
                  <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                  <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                  <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                </span>
              </fieldset>

            </div>
            <?php // below "col-sm-12" is fix for offset negative margin left right in the recaptcha markup ?>
                <div class="buttons clearfix">
                  <?= $captcha; ?>
                  <div class="cute-as-a-button" style="z-index: 1;">
                    <button type="button" id="button-review" data-loading-text="<?= $text_loading; ?>" class="btn this-button"><?= $button_post; ?></button>
                  </div>
                </div>
            <?php } else { ?>
            <?= $text_login; ?>
            <?php } ?>
          </form>
        </div>
      <?php } ?>

  <?php } ?>
<?php } ?>

<script type="text/javascript">
    let logID = 'log',
    log = $('<div id="'+logID+'"></div>');
    $('body').append(log);
      $('[type*="radio"]').change(function () {
        let me = $(this);
        log.html(me.attr('value'));
      });
</script>

<style type="text/css">
  @charset "UTF-8";
    .star-cb-group {
      /* remove inline-block whitespace */
      font-size: 0;
      /* flip the order so we can use the + and ~ combinators */
      unicode-bidi: bidi-override;
      direction: rtl;
      /* the hidden clearer */
    }
    .star-cb-group * {
      font-size: 1.5rem;
    }
    .star-cb-group > input {
      display: none;
    }
    .star-cb-group > input + label {
      /* only enough room for the star */
      display: inline-block;
      overflow: hidden;
      text-indent: 9999px;
      width: 1em;
      white-space: nowrap;
      cursor: pointer;
    }
    .star-cb-group > input + label:before {
      display: inline-block;
      text-indent: -9999px;
      content: "☆";
      color: #ccc;
    }
    .star-cb-group > input:checked ~ label:before, .star-cb-group > input + label:hover ~ label:before, .star-cb-group > input + label:hover:before {
      content: "★";
      color: #9E1201;
      text-shadow: 0 0 1px #333;
    }
    .star-cb-group > .star-cb-clear + label {
      text-indent: -9999px;
      width: .5em;
      margin-left: -.5em;
    }
    .star-cb-group > .star-cb-clear + label:before {
      width: .5em;
    }
    .star-cb-group:hover > input + label:before {
      content: "☆";
      color: #888;
      text-shadow: none;
    }
    .star-cb-group:hover > input + label:hover ~ label:before, .star-cb-group:hover > input + label:hover:before {
      content: "★";
      color: #9E1201;
      text-shadow: 0 0 1px #333;
    }
</style>
