<?php $session = $this->session->userdata('validated_user'); $module = $this->uri->segment(1); ?>
<?php $checker = $module != 'Signin' && $module != 'Signup' && $session == null; ?>
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
		var checker = <?php echo $checker ? 0 : 1;?>;
		var temp = [];
	</script>
</head>

<body id="main" onscroll="scrollHandler()">
	<div class="navbar flex" id="navbar">
		<a class="logo" href="<?php echo base_url();?>">linkar.com</a>
		<?php if ($checker) { ?>
		<div class="searchbar-container">
			<div class="flex box dim">
				<span class="material-icons search-icon">search</span>
				<input class="search-input" type="text" name="k" id="searchValue" autocomplete="off" placeholder="Search in Linkar">
			</div>
		</div>
		<?php } ?>
		<div class="menu">
			<?php if ($module != 'Signin' && $module != 'Signup' && $session == null) { ?>
				<a href="<?php echo base_url('Signin');?>">
					<span class="material-icons profile-icon">
						account_circle
					</span>
				</a>
			<?php } elseif ($session != null) { ?>
				<a class="logout-text" href="<?php echo base_url('Signout');?>"><b>Logout</b></a>
				<a class="name-text" href="#"><?php echo $this->session->userdata('username');?></a>
				<a href="#">
					<span class="material-icons profile-icon">
						account_circle
					</span>
				</a>
			<?php } ?>
		</div>
	</div> 
	<?php $this->load->view($content); ?>
</body>
	<?php include('external_js/index.php'); ?>
</html>

<script>
	function scrollHandler() {
		var _currentScroll = window.pageYOffset;
		var _navbar = document.getElementById('navbar');
		if(_currentScroll > 30){
			_navbar.style.background = "#131313"
			_navbar.style.boxShadow = "0 1px 12px rgba(0, 0, 0, 0.1)";
		} else {
			_navbar.style.background = "transparent"
			_navbar.style.boxShadow = "none";
		}
	}
</script>