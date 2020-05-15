<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signout extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_admin') == TRUE) { 
			redirect('adminapp/Home', 'refresh');
		}
		$this->load->model('Model_User');
    }
	
	public function index()
	{
		$this->session->unset_userdata('validated_user');
		$this->session->unset_userdata('validated_admin');
		session_destroy();
		redirect(base_url(), 'refresh');
	}
}
