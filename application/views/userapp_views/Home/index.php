<!-- Begin Content -->
<?php $session = $this->session->userdata('validated_user'); ?>
<?php if (!empty($list_verified)) { ?>
<div class="featured-image" style="background: url('<?php echo $list_featured->cover;?>');">
</div>
<div>
	<div class="flex featured-movie-card">
		<div class="featured-poster-container">
			<div class="featured-poster" style="background: url('<?php echo $list_featured->thumbnails ?>');">
			</div>
		</div>
		<div class="description-container">
			<p class="featured-title"><?php echo $list_featured->title ?></p>
			<div class="featured-information flex dim">
				<p><?php $date = $list_featured->publish_at; $newDate = date('Y', strtotime($date)); echo $newDate;?></p>
				<div class="rating-container">
					<p><?php echo $list_featured->ratings;?> / 10</p>
				</div>
				<p>2m</p>
			</div>
			<p class="dim"><?php echo $list_featured->description;?></p>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect featured-play-button" onClick="selectTrailer(<?php echo $list_featured->id;?>);" id="<?php echo $list_featured->id;?>">
				<i class="material-icons">play_arrow</i>Play
			</button>
		</div>
	</div>
</div>
<div class="category-container">
	<div id="listTrailers_verified">
	<p class="category-title">
		<?php if ($session) { ?>
			Your interest official trailers
		<?php } else { ?>
			Recommend Official trailers
		<?php } ?>
	</p>
	<?php foreach ($list_verified as $key => $value) { ?>
		<div class="poster-container" onClick="selectTrailer(<?php echo $value->id;?>);" id="<?php echo $value->id;?>">
			<div class="movie-poster" style="background: url(<?php echo $value->thumbnails;?>);">
				<div class="flex rating-container">
					<span class="material-icons">
						grade
					</span>
					<p><?php echo $value->rating;?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	</div>
</div>
<br>
<div class="category-container">
	<div id="listTrailers_verified">
	<p class="category-title">
		<?php if ($session) { ?>
			Other trailers based on your interest from unofficial published
		<?php } else { ?>
			Other trailers from unofficial published
		<?php } ?>
	</p>
	<?php foreach ($list_unverified as $key => $value) { ?>
		<div class="poster-container" onClick="selectTrailer(<?php echo $value->id;?>);" id="<?php echo $value->id;?>">
			<div class="movie-poster" style="background: url(<?php echo $value->thumbnails;?>);">
				<div class="flex rating-container">
					<span class="material-icons">
						grade
					</span>
					<p><?php echo $value->rating;?></p>
				</div>
			</div>
		</div>
	<?php } ?>
	</div>
</div>
<?php } else { ?>
<br><br><br><br><br>
<div class="category-container">
	<div id="listTrailers_verified">
		<p class="category-title">Sorry :(</p>
		<div style="text-align: left; align-content: left; color: #fff"><h4>We can't find what are you looking for. <br></h4></div>
	</div>
</div>
<?php } ?>
<!-- End Content -->
