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
		$this->load->model('Content/Model_Videos');
    }
	
	public function index()
	{
		$res = array();
		$k = $this->input->get('k');
		$query = preg_split("/[\s]+/", $k);

		if (count($query) > 0) {
			foreach ($query as $key => $value) {
				$filter = $this->Model_Videos->_Get_Data_Filter($value);

				if ($filter) {
					foreach ($filter as $index => $item) {
						array_push($res, $item);
					}
				}
			}
			$getUnique = count($res) > 0 ? $this->unique_($res) : $res;
			$data['list_verified'] = $getUnique;
			$data['list_unverified'] = array();
		} else {
			$official = $this->Model_Videos->_Get_List_Trailer('VERIFIED');
			$unofficial = $this->Model_Videos->_Get_List_Trailer('UNVERIFIED');
			$data['list_verified'] = $official;
			$data['list_unverified'] = $unofficial;
		}

		$featured = $this->Model_Videos->_Get_List_Featured();
		$data['list_featured'] = $featured[0];

		$data['content'] = 'userapp_views/Home/index';
		$this->load->view('userapp_views/Template', $data);
	}

	public function Search()
	{
		$res = array();
		$k = $this->input->get('k');
		$query = preg_split("/[\s]+/", $k);

		if (count($query)) {
			foreach ($query as $key => $value) {
				$filter = $this->Model_Videos->_Get_Data_Filter($value);

				if ($filter) {
					foreach ($filter as $index => $item) {
						array_push($res, $item);
					}
				}
			}
		}
		$getUnique = count($res) > 0 ? $this->unique_($res) : $res;
		echo json_encode(array('res' => $getUnique));
	}

	public function unique_($array) {
	    $temp_array = array();
	    $key_array = array();
	    for ($i=0; $i < count($array); $i++) { 
	    	if (!in_array($array[$i], $key_array)) {
	    		$key_array[$i] = $array[$i];
            	$temp_array[$i] = $array[$i];
	    	}
	    }
	    return $temp_array;
	}

	public function Detail()
	{
		$res = null;
		$id = $this->input->get('id');
		if ($id) {
			$res = $this->Model_Videos->_Get_Detail($id);
			if ($res) {

			}
		}
		echo json_encode(array('res' => $res));
	}
}
