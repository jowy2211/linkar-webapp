<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signin extends CI_Controller {

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
		$data['content'] = 'userapp_views/Home/Signin';
		$this->load->view('userapp_views/Template', $data);
	}

	public function Now()
	{
		$res = $this->Model_User->_Get_Authentication();

		if ($res->status === TRUE) {
			$data = array('res' => (object)array('message' => $res->message), 'status' => true);
		} elseif ($res->status === FALSE) {
			$data = array('res' => (object)array('message' => $res->message), 'status' => false);
		} else {
			$data = array('res' => (object)array('message' => 'Request time out, try again later.'), 'status' => false);
		}
		echo json_encode($data);
	}
}
