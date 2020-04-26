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
	<script type="text/javascript">
		var base_url = '<?php echo base_url();?>';
	</script>
</head>

<body>
	<div id="selectedBackgroundTrailer">
		<?php if (!empty($list->items)) { ?>
			<div class="featured-image" style="background: url(<?php echo $list[0]->snippet->thumbnails->high->url;?>);"></div>
		<?php } else { ?>
			<div class="featured-image" style="background: url('<?php echo base_url();?>assets/img/404.jpg'); filter: blur(0);-webkit-filter: blur(0);"></div>
		<?php } ?>
	</div>
	<div>
		<?php $this->load->view($content); ?>
	</div>
</body>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/Search.js"></script>
</html>
