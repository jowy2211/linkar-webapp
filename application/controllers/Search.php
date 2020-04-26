<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Search extends CI_Controller {

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
		echo json_encode(array('data' => true));
	}

	public function Search_()
	{
		echo "string";
		// $url = 'https://www.googleapis.com/youtube/v3/search';
		// $part = 'snippet';
		// $maxResults = 5; // Max result item
		// $key = 'AIzaSyCx-mxyqq4TRd6grXGkOkXLa54-YlQdgD8'; // Api key registed with youtube
		// $q = 'Vice'; // Query search for the videos
		// $type = 'video';

		// $fullUrl = $url.'?part='.$part.'&maxResults='.$maxResults.'&key='.$key.'&q='.$q.'&type='.$type;
		
		// $result = _Get_Stream($fullUrl);

		
	}
}
