<!DOCTYPE html>
<html>

<head>
	<title>Linkar - Trailer Movies</title>

	<!-- linkar custom css -->
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/color-sheme.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/style.css">

	<!-- mdl -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</head>

<body>
	<div class="featured-image" style="background: url('<?php echo base_url();?>assets/img/featured_image4.jpg');">
	</div>

	<div class="searchbar-container">
		<div class="flex box dim">
			<span class="material-icons search-icon">search</span>
			<input class="search-input" type="text" placeholder="Search in Linkar">
		</div>
	</div>

	<div>
		<?php $this->load->view($content); ?>
	</div>

</body>

</html>