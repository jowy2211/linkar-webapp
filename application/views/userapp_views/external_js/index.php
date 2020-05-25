<?php
	$module = $this->uri->segment(1);
	switch ($module) {
		case 'Detail':
			echo '<script type="text/javascript" src="'.base_url().'assets/js/custom/Detail.js"></script>';
			break;
		case 'Signin':
			echo '<script type="text/javascript" src="'.base_url().'assets/js/custom/Signin.js"></script>';
			break;
		case 'Signup':
			echo '<script type="text/javascript" src="'.base_url().'assets/js/custom/Signup.js"></script>';
			break;
		case 'Interest':
			echo '<script type="text/javascript" src="'.base_url().'assets/js/custom/Interest.js"></script>';
			break;
		default:
			echo '<script type="text/javascript" src="'.base_url().'assets/js/custom/Search.js"></script>';
			break;
	}
?>