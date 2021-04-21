<div id="account" class="dropdown">
<?php if ($logged) { ?>
        <a class="this-a" href="<?=$account; ?>">
            <?=$text_account; ?>
        </a>
        /&nbsp;        
        <a href="<?=$logout; ?>">
            <?=$text_logout; ?>
        </a>
    <a href="#" title="<?=$text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-user"></i>
    </a>
<?php }else { ?>
    <div class="login-text">
        <a href="<?= $login; ?>" >
            <?=$text_login; ?>
        </a>
        &nbsp;/&nbsp;        
        <a href="<?= $register; ?>" >
            <?=$text_register; ?>
        </a>
    </div>
    <a class="i" href="#" data-toggle="dropdown">
        <i class="fa fa-user"></i>
    </a>
<?php } ?>
</div>