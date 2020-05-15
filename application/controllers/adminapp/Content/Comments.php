<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Comments extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if (!$this->session->userdata('validated_admin')) 
		{ 
			redirect(base_url(), 'refresh');
		}
		// Load specific model here
		$this->load->model('Content/Model_Comments');
		$this->load->model('Model_Crud');
    }

	public function index()
	{
		// Add specific data here
		$list = $this->Model_Comments->_Get_data();
		$data['content'] = 'adminapp_views/Content/Comments/index';
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
			$whereComment = array('id' => $param['id']);
			$comment = $this->Model_Comments->_Get_data($whereComment);
			if (!count($comment)) {
				redirect(base_url('adminapp/Content/Comments'));
			} else {
				$data['comment'] = $comment[0];
			}
		} else {
			$data['action'] = 'add';
		}
		$data['content'] = 'adminapp_views/Content/Comments/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
		$data_input['name'] = $this->input->post('name');
		if ($this->input->post('method') == 'add') {
			if($this->Model_Crud->_insert('comments',$data_input) == 1){
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-success fade in m-b-15'>
						<strong>Success!</strong>
						Comment has been added
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
			$whereComment = array('id' => $id);
			$dataComment = $this->Model_Comments->_Get_data($whereComment);
			if (!count($dataComment)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_update('comments',$data_input,$whereComment) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Comment has been updated
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
		redirect(base_url('adminapp/Content/Comments'));
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
			$whereComment = array('id' => $param);
			$dataComment = $this->Model_Comments->_Get_data($whereComment);
			if (!count($dataComment)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_delete('comments',$whereComment) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Comment has been deleted
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
		redirect(base_url('adminapp/Content/Comments'));
	}
}
