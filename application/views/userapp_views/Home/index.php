<!-- Begin Content -->

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
				<p>2012</p>
				<div class="rating-container">
					<p>16+</p>
				</div>
				<p>2h 8m</p>
			</div>
			<p class="dim">
				La La Land adalah film drama komedi musikal romansa Amerika Serikat tahun 2016. Film ini berkisah
				tentang seorang musisi dan calon aktris yang bertemu dan jatuh cinta di Los Angeles.</p>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect featured-play-button" onClick="selectTrailer(<?php echo $list_featured->id;?>);" id="<?php echo $list_featured->id;?>">
				<i class="material-icons">play_arrow</i>Play
			</button>
		</div>
	</div>
</div>
<div class="category-container">
	<div id="listTrailers_verified">
	<p class="category-title">Recommend Official Trailers</p>
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
<?php } else { ?>
<div class="category-container">
	<div id="listTrailers_verified">
		<p class="category-title">Search Result</p>
		<div style="text-align: left; align-content: left; color: #fff"><h4>Sorry :( <br>We can't find what are you looking for. <br></h4></div>
	</div>
</div>
<?php } ?>
<!-- End Content -->
