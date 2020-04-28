<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Videos extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if (!$this->session->userdata('validated_admin')) 
		{ 
			redirect(base_url(), 'refresh');
		}
		// Load specific model here
		$this->load->model('Content/Model_Videos');
		$this->load->model('Model_Crud');
    }

	public function index()
	{
		// Add specific data here
		$list = $this->Model_Videos->_Get_data();
		$data['content'] = 'adminapp_views/Content/Videos/index';
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
			$whereVideo = array('id' => $param['id']);
			$video = $this->Model_Videos->_Get_data($whereVideo);
			if (!count($video)) {
				redirect(base_url('adminapp/Content/Videos'));
			} else {
				$data['video'] = $video[0];
			}
		} else {
			$data['action'] = 'add';
		}
		$data['content'] = 'adminapp_views/Content/Videos/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
		$data_input['name'] = $this->input->post('name');
		if ($this->input->post('method') == 'add') {
			if($this->Model_Crud->_insert('videos',$data_input) == 1){
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-success fade in m-b-15'>
						<strong>Success!</strong>
						Video has been added
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
			$whereVideo = array('id' => $id);
			$dataVideo = $this->Model_Videos->_Get_data($whereVideo);
			if (!count($dataVideo)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_update('videos',$data_input,$whereVideo) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Videos Has been updated
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
		redirect(base_url('adminapp/Content/Videos'));
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
			$whereVideo = array('id' => $param);
			$dataVideo = $this->Model_Videos->_Get_data($whereVideo);
			if (!count($dataVideo)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_delete('videos',$whereVideo) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Video has been deleted
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
		redirect(base_url('adminapp/Content/Videos'));
	}
}
