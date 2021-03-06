<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Interest extends CI_Controller {
	
	public function __construct()
    {
        parent::__construct();
		if (!$this->session->userdata('validated_admin')) 
		{ 
			redirect(base_url(), 'refresh');
		}
		// Load specific model here
		$this->load->model('Model_Interest');
		$this->load->model('Model_Crud');
    }

	public function index()
	{
		// Add specific data here
		$list = $this->Model_Interest->_Get_data();
		$data['content'] = 'adminapp_views/Content/Interest/index';
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
			$whereInterest = array('id' => $param['id']);
			$interest = $this->Model_Interest->_Get_data($whereInterest);
			if (!count($interest)) {
				redirect(base_url('adminapp/Interest'));
			} else {
				$data['interest'] = $interest[0];
			}
		} else {
			$data['action'] = 'add';
		}
		$data['content'] = 'adminapp_views/Content/Interest/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
		$data_input['name'] = $this->input->post('name');
		if ($this->input->post('method') == 'add') {
			if($this->Model_Crud->_insert('interests',$data_input) == 1){
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-success fade in m-b-15'>
						<strong>Success!</strong>
						Interes Has been added
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
			$whereInterest = array('id' => $id);
			$dataInterest = $this->Model_Interest->_Get_data($whereInterest);
			if (!count($dataInterest)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_update('interests',$data_input,$whereInterest) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Interes Has been updated
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
		redirect(base_url('adminapp/Content/Interest'));
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
			$whereInterest = array('id' => $param);
			$dataInterest = $this->Model_Interest->_Get_data($whereInterest);
			if (!count($dataInterest)) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				if($this->Model_Crud->_delete('interests',$whereInterest) == 1){
					$this->session->set_flashdata(
						"message",
						"<div class='alert alert-success fade in m-b-15'>
							<strong>Success!</strong>
							Interes Has been deleted
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
		redirect(base_url('adminapp/Content/Interest'));
	}
}
