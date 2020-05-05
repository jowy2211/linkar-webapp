<?php
	$module = $this->uri->segment(2);
	switch ($module) {
		case 'Home':
			echo 'TableManageDefault.init();';
			break;
		case 'Content':
			echo 'TableManageDefault.init();';
			break;
	}
?>