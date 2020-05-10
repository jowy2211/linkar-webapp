<!-- Begin Content -->

<?php if (!empty($list_verified)) { ?>
<div class="category-container">
	<div id="listTrailers_verified">
	<p class="category-title">Recommend Official Trailers</p>
	<?php foreach ($list_verified as $key => $value) { ?>
		<div class="poster-container" onClick="selectTrailer(<?php echo $value->id;?>);" id="<?php echo $value->id;?>">
			<div class="movie-poster" style="background: url(<?php echo $value->thumbnails;?>);">
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
