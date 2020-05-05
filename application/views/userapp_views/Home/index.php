<!-- Begin Content -->
<div class="searchbar-container">
	<div class="flex box dim">
		<span class="material-icons search-icon">search</span>
		<input class="search-input" type="text" name="k" id="searchValue" autocomplete="off" placeholder="Search in Linkar">
	</div>
</div>
<?php if (!empty($list)) { ?>
<div id="selectedTrailer">
	<div class="flex featured-movie-card">
		<div class="featured-poster-container">
			<div class="featured-poster"
				style="background: url(<?php echo $list[0]->thumbnails;?>);">
			</div>
		</div>
		<div class="description-container">
			<p class="featured-title"><?php echo $list[0]->title;?></p>
			<p class="dim">
				<?php echo $list[0]->description;?>
			</p>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect featured-play-button">
				<i class="material-icons">play_arrow</i>Play
			</button>
		</div>
	</div>
</div>
<div class="category-container">
	<p class="category-title">Trending Now</p>
	<div id="listTrailers">
	<?php foreach ($list as $key => $value) { ?>
		<div class="poster-container" onClick="selectedTrailer($value);" id="<?php echo $value->id;?>">
			<div class="movie-poster" style="background: url(<?php echo $value->thumbnails;?>);">
			</div>
		</div>
	<?php } ?>
	</div>
</div>
<?php } else { ?>
<div style="text-align: center; align-content: center; color: #fff">
	<h3>
		Sorry :( <br>
		Under Development <br>
	</h3>
</div>
<?php } ?>
<!-- End Content -->
