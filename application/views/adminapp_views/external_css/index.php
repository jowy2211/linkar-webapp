<?php
	$module = $this->uri->segment(2);
	switch ($module) {
		case 'Home':
			echo '<link href="'.base_url().'template/assets/plugins/parsley/src/parsley.css" rel="stylesheet" />';
			echo '<link href="'.base_url().'template/assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />';
			echo '<link href="'.base_url().'template/assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />';
		break;
	}
?>