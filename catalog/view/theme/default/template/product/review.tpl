<?php if ($reviews) { ?>
  <?php foreach ($reviews as $review) { ?>
    <div class="review">
      <strong><p><?php echo $review['author']; ?></p></strong>
      <div class="shining-shimmering-stars">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($review['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } ?>
          <?php } ?>
      </div>
      <div class="subject">
        <div class="subject-title">
        <p><?= mb_strimwidth($review['text'], 0, 25, ''); ?></p>
        </div>
        <div class="date">
          <?php echo $review['date_added']; ?>
        </div>
      </div>
      <div class="the-review-itself">
        <p><?php echo $review['text']; ?></p>
      </div>
    </div>
  <?php } ?>

  <div id="pagination-container"></div>

  <?php } else { ?>
    <p><?php echo $text_no_reviews; ?></p>
<?php } ?>

<script type="text/javascript">
  let items = $(".review");
    let numItems = items.length;
    let perPage = 1;

    items.slice(perPage).hide();

    $('#pagination-container').pagination({
    items: numItems,
    itemsOnPage: perPage,
    hrefTextPrefix: '',
    prevText: "&lt;",
    nextText: "&gt;",
    onPageClick: function (pageNumber) {
        var showFrom = perPage * (pageNumber - 1);
        var showTo = showFrom + perPage;

      $(".simple-pagination a").each(function(e){
        $(this).removeAttr('href');
      });

        items.hide().slice(showFrom, showTo).show();
    }
    });

    $(".simple-pagination a").removeAttr("href");

    $(document).ready(function(){
      $("#pagination-container span").each(function(){
        let prev = $(this).text();
        $(this).text(prev.replace("prev", ""));
      });

      $("#pagination-container a").each(function(){
        let next = $(this).text();
        $(this).text(next.replace("next", ""));
      });
    })
</script>
