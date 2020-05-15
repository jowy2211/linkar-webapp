<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Channels extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if (!$this->session->userdata('validated_admin')) 
		{ 
			redirect(base_url(), 'refresh');
		}
		// Load specific model here
		$this->load->model('Content/Model_Channels');
		$this->load->model('Model_Crud');
    }

	public function index()
	{
		// Add specific data here
		$list = $this->Model_Channels->_Get_data();
		$data['content'] = 'adminapp_views/Content/Channels/index';
		$data['list'] = $list;
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Form()
	{
		// Add specific data here
		// Define form is editing or creating here
		$param = $this->input->get();
		if (isset($param['id'])) {
			$data['action'] = 'edit';
			$whereChannel = array('id' => $param['id']);
			$channel = $this->Model_Channels->_Get_data($whereChannel);
			if (!count($channel)) {
				redirect(base_url('adminapp/Content/Videos'));
			} else {
				$data['channel'] = $channel[0];
			}
		} else {
			$data['action'] = 'add';
		}
		$data['content'] = 'adminapp_views/Content/Channels/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
		$data_input['name'] = $this->input->post('name');
		if ($this->input->post('method') == 'add') {
			if($this->Model_Crud->_insert('channels',$data_input) == 1){
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-success fade in m-b-15'>
						<strong>Success!</strong>
						Channel has been added
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			}
		} else if ($this->input->post('method') == 'edit'){
			$id = $this->input->post('id');
			$whereChannel = array('id' => $id);
			$dataChannel = $this->Model_Channels->_Get_data($whereChannel);
			if (!count($dataChannel)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_update('channels',$data_input,$whereChannel) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Channel has been updated
							<span class='close' data-dismiss='alert'>&times;</span>
						</div>"
					);
				} else {
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-danger fade in m-b-15'>
							<strong>Failed!</strong>
							<span class='close' data-dismiss='alert'>&times;</span>
						</div>"
					);
				}
			}
		} else {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-danger fade in m-b-15'>
					<strong>Sorry bro!</strong>
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		}
		redirect(base_url('adminapp/Content/Channels'));
	}

	public function Remove()
	{
		// Add Function Delete
		$param = $this->input->get('id');
		if (!isset($param)) {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-danger fade in m-b-15'>
					<strong>Failed!</strong>
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		} else {
			$whereChannel = array('id' => $param);
			$dataChannel = $this->Model_Channels->_Get_data($whereChannel);
			if (!count($dataChannel)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_delete('channels',$whereChannel) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Channel has been deleted
							<span class='close' data-dismiss='alert'>&times;</span>
						</div>"
					);
				} else {
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-danger fade in m-b-15'>
							<strong>Failed!</strong>
							<span class='close' data-dismiss='alert'>&times;</span>
						</div>"
					);
				}
			}
		}
		redirect(base_url('adminapp/Content/Channels'));
	}

	public function GetChannel()
	{
		$url = 'https://www.googleapis.com/youtube/v3/channels';
		$key = 'AIzaSyCx-mxyqq4TRd6grXGkOkXLa54-YlQdgD8'; // Api key registed with youtube
		$q = 'FreestyleReplay'; // Put username channel want to get
		$part = 'id';
		
		$fullUrl = $url.'?&key='.$key.'&forUsername='.$q.'&part='.$part;
		$res = _Get_Stream($fullUrl);
		$res = json_decode($res);

		var_dump($res);
	}
}
