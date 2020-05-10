<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('validated_admin') == TRUE) 
		{ 
			redirect(base_url('adminapp/Home'), 'refresh');
		} elseif ($this->session->userdata('validated_user') == TRUE) {
			redirect(base_url(), 'refresh');
		}
        $this->load->model('Model_User');
    }
	
	public function index()
	{
		$this->load->view('adminapp_views/Login');
	}

	public function Authenticate()
	{
		$res = $this->Model_User->_Get_Authentication();
		if ($res->status === TRUE) {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-success fade in m-b-15'>
					<strong>Success!</strong>
					".$res->message."
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
			redirect(base_url('adminapp/Home'), 'refresh');
		} elseif ($res->status === FALSE) {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-warning fade in m-b-15'>
					<strong>Warning!</strong>
					".$res->message."
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		} else {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-error fade in m-b-15'>
					<strong>Error :(</strong>
					Request time out, try again later.
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		}

		redirect(base_url('Auth'), 'refresh');
	}
}
