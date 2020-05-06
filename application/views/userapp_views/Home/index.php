<!-- Begin Content -->
<div class="media-player" id="bgMedia" style="display: none;">
	<div class="frame-trailer">
		<div id="mediaPlayer"></div>
	</div>
</div>
<div class="searchbar-container">
	<div class="flex box dim">
		<span class="material-icons search-icon">search</span>
		<input class="search-input" type="text" name="k" id="searchValue" autocomplete="off" placeholder="Search in Linkar">
	</div>
</div>
<?php if (!empty($list_verified)) { ?>
<div id="selectedTrailer">
</div>
<div class="category-container">
	<p class="category-title">Recommend Official Trailers</p>
	<div id="listTrailers">
	<?php foreach ($list_verified as $key => $value) { ?>
		<div class="poster-container" onClick="selectTrailer(<?php echo $value->id;?>);" id="<?php echo $value->id;?>">
			<div class="movie-poster" style="background: url(<?php echo $value->thumbnails;?>);">
			</div>
		</div>
	<?php } ?>
	</div>
</div>
<div class="category-container">
	<p class="category-title">Other Trailers</p>
	<div id="listTrailers">
	<?php foreach ($list_unverified as $key => $value) { ?>
		<div class="poster-container" onClick="selectTrailer(<?php echo $value->id;?>);" id="<?php echo $value->id;?>">
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
