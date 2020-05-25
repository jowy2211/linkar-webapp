<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_admin') == TRUE) { 
			redirect('adminapp/Home', 'refresh');
		} elseif ($this->session->userdata('validated_user') != TRUE) { 
			redirect(base_url(), 'refresh');
		}
		$this->load->model('Model_Interest');
		$this->load->model('Model_user');
    }
	
	public function index()
	{
		$data['interest'] = $this->Model_Interest->_Get_My_Interest();
		$data['detail'] = $this->Model_user->_Get_Detail_User();
		// var_dump($data); exit();
		$data['content'] = 'userapp_views/Home/Account';
		$this->load->view('userapp_views/Template', $data);
	}
}
