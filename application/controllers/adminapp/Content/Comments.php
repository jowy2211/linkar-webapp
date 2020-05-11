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
			$comment = $this->Model_Comments->_Get_Detail($param['id']);
			if ($comment) {
				$data['comment'] = $comment;
			} else {
				redirect(base_url('adminapp/Content/Comments'), 'refresh');
			}
			$data['content'] = 'adminapp_views/Content/Comments/Form';
			$this->load->view('adminapp_views/Template', $data);
		} else {
			redirect(base_url('adminapp/Content/Comments'), 'refresh');
		}
	}

	public function Store()
	{
		// Add Function Create & Update 
		# code...
		$data_input['status'] = $this->input->post('status');
		$id = $this->input->post('id');
		if ($this->input->post('method') == 'edit' && $id){
			$dataComment = $this->Model_Comments->_Get_Detail($id);
			if (!$dataComment) {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-danger fade in m-b-15'>
						<strong>Failed!</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
			} else {
				$whereComment = array('comment_id' => $id);
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
}
