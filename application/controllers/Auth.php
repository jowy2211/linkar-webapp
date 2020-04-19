<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
        $this->load->model('Model_User');
    }
	
	public function index()
	{
		if ($this->session->userdata('validated_admin') == TRUE) 
		{ 
			redirect(base_url('adminapp/Home'), 'refresh');
		} else {
			$this->load->view('adminapp_views/Login');
		}
	}

	public function Authenticate()
	{
		$res = $this->Model_User->_Get_Authentication();

		if ($res) {
			redirect(base_url('adminapp/Home'), 'refresh');
		}

		redirect('/');
	}

	public function Signout()
	{
		$this->session->unset_userdata('validated_admin');
		session_destroy();
		redirect(base_url(), 'refresh');
	}
}
