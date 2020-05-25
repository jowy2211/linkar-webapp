<div class="flex">
  <div class="left-box-card">
    <div class="avatar">
      <span class="material-icons profile-icon">
        account_circle
      </span>
    </div>
    <div class="user-information-wrapper">
      <p class="name"><?php echo $detail->fullname;?></p>
      <p class="dim email"><?php echo $detail->email;?></p>
      <p class="description">...</p>
    </div>
  </div>
  <div class="right-box-card">
    <p class="title">My Interest</p>

    <div>
      <?php if (!empty($interest)) { ?>
        <?php foreach ($interest as $key => $value) { ?>
          <div class="genre-wrapper">
            <div class="name-container">
              <p><?php echo $value->name;?></p>
            </div>
            <div class="genre-image" style="background: url(<?php echo $value->image;?>);">
            </div>
          </div>
        <?php } ?>
      <?php } ?>
    </div>

  </div>
</div>
