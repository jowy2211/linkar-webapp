<?php
	$module = $this->uri->segment(1);
	switch ($module) {
		case 'Detail':
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/detail/detail.css">';
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/login/login.css">';
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/register/register.css">';
			break;
		case 'Signin':
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/login/login.css">';
			break;
		case 'Signup':
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/register/register.css">';
			break;
		case 'Interest':
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/profile/profile.css">';
			break;
		case 'Account':
			echo '<link rel="stylesheet" type="text/css" href="'.base_url().'assets/page/profile/profile.css">';
			break;
		default:
			echo '';
			break;
	}
?>