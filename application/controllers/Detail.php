<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Detail extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
		if ($this->session->userdata('validated_admin') == TRUE) { 
			redirect('adminapp/Home', 'refresh');
		}
		$this->load->model('Content/Model_Videos');
    }
	
	public function index()
	{
		$res = null;
		$id = $this->input->get('id');
		if ($id) {
			$this->Model_Videos->_Views_Trailer($id);
			$res = $this->Model_Videos->_Get_Detail($id);
		}

		if ($res) {
			$dataComment = $this->Model_Videos->_Get_Data_Comment($id);
			$data['detail'] = $res;
			$data['comment'] = $dataComment;
			$data['content'] = 'userapp_views/Home/Detail';
			$this->load->view('userapp_views/Template', $data);
		} else {
			redirect(base_url(), 'refresh');
		}
	}

	public function Ratings()
	{
		$val = $this->input->post('star');
		if ((int)$val <= 5) {
			if ($val === 1) {
				$data['ratings'] = 0.2;
			} elseif ($val === 2) {
				$data['ratings'] = 0.4;
			} elseif ($val === 3) {
				$data['ratings'] = 0.6;
			} elseif ($val === 4) {
				$data['ratings'] = 0.8;
			} elseif ($val === 5) {
				$data['ratings'] = 1;
			}
		}
	}

	public function Comments()
	{
		$res = $this->Model_Videos->_Store_Comment($_POST);

		if ($res) {
			$data = array('res' => (object)array('message' => 'Successfully!'), 'status' => true);
		} else {
			$data = array('res' => (object)array('message' => 'We can not process your request at this time.'), 'status' => fale);
		}
		echo json_encode($data);
	}
}
