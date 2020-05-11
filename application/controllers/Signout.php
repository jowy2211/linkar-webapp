<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Signout extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
    }
	
	public function index()
	{
		$this->session->unset_userdata('validated_user');
		$this->session->unset_userdata('validated_admin');
		session_destroy();
		redirect(base_url(), 'refresh');
	}
}
