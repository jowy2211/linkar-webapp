<?php $session = $this->session->userdata('validated_user'); $module = $this->uri->segment(1); ?>
<!DOCTYPE html>
<html>

<head>
	<title>Linkar - Trailer Movies</title>

	<!-- linkar custom css -->
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/custom/color-sheme.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/custom/style.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/page/detail/detail.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/page/register/register.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/page/login/login.css">

	<!-- mdl -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<script type="text/javascript">
		var base_url = '<?php echo base_url();?>';
		var sess = '<?php echo $session ? $session : null;?>';
		var temp = [];
	</script>
</head>

<body
	style="background: <?php if ($module == '') { echo 'rgb(105, 189, 210)'; } elseif ($module == 'Detail') { echo 'rgb(4, 47, 102)'; } elseif ($module == 'Signin') { echo 'rgb(223, 73, 98)'; } elseif ($module == 'Signup') { echo 'rgb(224, 123, 57)'; };?> !important"
>
	<div class="topnav" id="myTopnav">
		<div class="searchbar-container">
			<div class="flex box dim">
				<span class="material-icons search-icon">search</span>
				<input class="search-input" type="text" name="k" id="searchValue" autocomplete="off" placeholder="Search in Linkar">
			</div>
		</div>
		<?php if ($module != 'Signin' && $module != 'Signup' && $session == null) { ?>
			<a href="<?php echo base_url('Signin');?>">Login</a>
		<?php } elseif ($session != null) { ?>
			<a href="<?php echo base_url('Signout');?>">Logout</a>
			<a href="#">Hi, <b><?php echo $this->session->userdata('username');?></b></a>
		<?php } ?>
		<a href="<?php echo base_url();?>" class="<?php echo $module == '' ? 'active' : '';?>">Home</a>
	</div>
	<?php $this->load->view($content); ?>
</body>
	<?php include('external_js/index.php'); ?>
</html>
