<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index_ extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_admin') == TRUE) 
		{ 
			redirect('adminapp/Home', 'refresh');
		}
    }
	
	public function index()
	{
		$data['content'] = 'userapp_views/Home'; 
		$this->load->view('userapp_views/Template', $data);
	}
}
