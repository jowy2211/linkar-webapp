<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signup extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_user') == TRUE) 
		{ 
			redirect(base_url(), 'refresh');
		} elseif ($this->session->userdata('validated_admin') == TRUE) { 
			redirect('adminapp/Home', 'refresh');
		}
		$this->load->model('Model_User');
    }
	
	public function index()
	{
		$data['content'] = 'userapp_views/Home/Signup';
		$this->load->view('userapp_views/Template', $data);
	}

	public function Now()
	{
		$res = $this->Model_User->_Signup_Now($_POST);
		if ($res) {
			$data = array('res' => (object)array('message' => 'Successfully create account.'), 'status' => true);
		} else {
			$data = array('res' => (object)array('message' => 'Your request has an error, try again later.'), 'status' => false);
		}
		echo json_encode($data);
	}
}
