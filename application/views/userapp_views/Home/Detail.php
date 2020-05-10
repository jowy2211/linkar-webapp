<?php
  $session = $this->session->userdata('validated_user');
  if ($session === null) {
?>
<?php } ?>
<div class="media-player" id="layerBackground" style="display: none;">
  <div id="layerSignup" style="display: none;">
    <?php $this->load->view('userapp_views/Home/Signup'); ?>
  </div>
  <div id="layerSignin" style="display: none;">
    <?php $this->load->view('userapp_views/Home/Signin'); ?>
  </div>
</div>

<div class="cover-image"></div>

<iframe class="youtube-video" src="https://www.youtube.com/embed/<?php echo $detail ? $detail->url : '';?>" frameborder="0" allow="encrypted-media"
  allowfullscreen></iframe>

<div class="detail-movie-container">
  <div class="detail-wrapper">
    <p class="movie-title"><?php echo $detail ? $detail->title : '';?></p>
    <p class="dim">
      <?php echo $detail ? $detail->description : '';?>
    </p>
  </div>
</div>

<div class="movie-expand-container">
  <div class="wrapper">
    <div class="flex movie-achievement-container">
      <div class="grid-container">
        <div class="flex">
          <span class="material-icons dim"
            style="align-self: center; margin-right: 16px; font-size: 40px; margin-bottom: 10px;">
            new_releases
          </span>
          <div>
            <p class="title"><?php echo $detail ? $detail->ratings : 0;?> / 5</p>
            <div class="flex rating">
              <?php if ($detail) { ?>
                <div id="ratingTrailer"></div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <div class="grid-container">
        <div class="flex">
          <span class="material-icons dim"
            style="align-self: center; margin-right: 16px; font-size: 40px; margin-bottom: 10px;">
            visibility
          </span>
          <div>
            <p class="title"><?php echo $detail ? $detail->views : 0;?></p>
            <p class="dim sub-title">Total views</p>
          </div>
        </div>
      </div>
      <div class="grid-container">
        <div class="flex">
          <span class="material-icons dim"
            style="align-self: center; margin-right: 16px; font-size: 40px; margin-bottom: 10px;">
            notes
          </span>
          <div>
            <p class="title"><?php echo count($comment);?></p>
            <p class="dim sub-title">Comments</p>
          </div>
        </div>
      </div>
    </div>

    <div class="section-container" style="margin-top: 5%;">
      <p class="title">Trailer Info</p>
      <div class="flex">
        <p class="dim content-name">Genre :</p>
        <p><?php echo $detail ? $detail->interest : '';?></p>
      </div>      <div class="flex">
        <p class="dim content-name">Source :</p>
        <p><?php echo $detail ? $detail->channel : '';?></p>
      </div>
      <div class="flex">
        <p class="dim content-name">Publish At :</p>
        <p><?php echo $detail ? $detail->publish_at : '';?></p>
      </div>
    </div>

    <div class="section-container">
      <p class="title">Comments</p>
      <div class="flex comment-container">
        <div class="avatar"
          style="background-image: url('<?php echo base_url('assets/img/user-12.jpg');?>');">
        </div>
        <div class="content-container">
          <form id="formComment" data-parsley-validate="true" enctype="multipart/form-data">
            <div class="mdl-textfield mdl-js-textfield custom-input">
              <textarea class="mdl-textfield__input" type="text" id="comment_section" autocomplete="off" data-parsley-required="true" required=""></textarea>
              <label class="mdl-textfield__label" for="comment_section">Add public comment...</label>
            </div>
            <button type="submit" id="commentBtn" class="mdl-button mdl-js-button mdl-button--raised style-bg submit-button">
              Post
            </button>
          </form>
        </div>
      </div>
      <?php if ($comment) { ?>
        <?php foreach ($comment as $key => $value) { ?>
          <div class="flex comment-container">
            <div class="avatar"
              style="background-image: url('<?php echo base_url('assets/img/user-12.jpg');?>');">
            </div>
            <div class="content-container">
              <div class="profile">
                <p class="name"><?php echo $value->name;?></p>
                <p class="time">at <?php echo $value->created_at;?></p>
              </div>
              <p><?php echo $value->text;?></p>
            </div>
          </div>
        <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>

<script type="text/javascript">
  var rating = <?php echo $detail ? $detail->ratings : 0;?>;
  var user = '<?php echo $this->session->userdata('user');?>';
  var calculateRating = (num) => {
    let val = parseFloat(num);
    const size = Math.max(0, (Math.min(5, val))) * 20;
    return size;
  };
  var starActive = '<span class="selected-rating" style="width:'+calculateRating(rating)+'px;"></span>';
  document.getElementById('ratingTrailer').innerHTML = starActive;
</script>
