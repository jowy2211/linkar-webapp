<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_admin') !== TRUE) 
		{ 
			redirect(base_url(), 'refresh');
		}
    }

	public function index()
	{
		$data['content'] = 'adminapp_views/Home/index';
		$this->load->view('adminapp_views/Template', $data);
	}
}
