<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Interest extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_user') == TRUE) 
		{ 
			redirect(base_url(), 'refresh');
		} elseif ($this->session->userdata('validated_admin') == TRUE) { 
			redirect('adminapp/Home', 'refresh');
		} elseif ($this->session->userdata('validated_signup') != TRUE) {
			redirect(base_url(), 'refresh');
		}
		$this->load->model('Model_Interest');
    }
	
	public function index()
	{
		$data['list'] = $this->Model_Interest->_Get_DataList();
		$data['content'] = 'userapp_views/Home/Interest';
		$this->load->view('userapp_views/Template', $data);
	}

	public function Store()
	{
		$payload = json_decode(file_get_contents('php://input'),true);
		$res = $this->Model_Interest->_Store_DataInterest($payload);
		if ($res) {
			$data = array('res' => (object)array('message' => 'Successfully save your interest.'), 'status' => true);
		} else {
			$data = array('res' => (object)array('message' => 'Your request has an error, try again later.'), 'status' => false);
		}
		echo json_encode($data);
	}
}
