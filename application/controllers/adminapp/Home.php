<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if (!$this->session->userdata('validated_admin')) 
		{ 
			redirect(base_url(), 'refresh');
		}
		// Load specific model here
		// example: $this->load->model('Model_Users');
    }

	public function index()
	{
		// Add specific data here
		$data['content'] = 'adminapp_views/Home/index';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Form()
	{
		// Add specific data here
		// Define form is editing or creating here
		$data['content'] = 'adminapp_views/Home/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
	}

	public function Remove()
	{
		// Add Function Delete
		# code...
	}
}
