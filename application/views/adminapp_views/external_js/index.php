<?php
	$module = $this->uri->segment(2);
	switch ($module) {
		case 'Home':
			echo '<script src="'.base_url().'assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>';
			echo '<script src="'.base_url().'assets/js/table-manage-default.demo.min.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/parsley/dist/parsley.js"></script>';
			break;
		case 'Content':
			echo '<script src="'.base_url().'assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>';
			echo '<script src="'.base_url().'assets/js/table-manage-default.demo.min.js"></script>';
			echo '<script src="'.base_url().'assets/plugins/parsley/dist/parsley.js"></script>';
			break;
	}
?>