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
    }
	
	public function index()
	{
		$url = 'https://www.googleapis.com/youtube/v3/search';
		$part = 'snippet';
		$maxResults = 18; // Max result item
		$key = 'AIzaSyCx-mxyqq4TRd6grXGkOkXLa54-YlQdgD8'; // Api key registed with youtube
		$q = 'netflix+official+trailer'; // Query search for the videos
		$type = 'video';
		$videoDuration = 'short';
		
		$fullUrl = $url.'?part='.$part.'&maxResults='.$maxResults.'&key='.$key.'&q='.$q.'&type='.$type.'&videoDuration='.$videoDuration;
		$res = _Get_Stream($fullUrl);
		$res = json_decode($res);


		$data['list'] = $res;
		$data['content'] = 'userapp_views/Home/index';
		$this->load->view('userapp_views/Template', $data);
	}

	public function Search()
	{
		$k = $this->input->get('k');
		$query = implode("+", preg_split("/[\s]+/", $k));
		$url = 'https://www.googleapis.com/youtube/v3/search';
		$part = 'snippet';
		$maxResults = 5; // Max result item
		$key = 'AIzaSyCx-mxyqq4TRd6grXGkOkXLa54-YlQdgD8'; // Api key registed with youtube
		$q = $query.'+netflix+official+trailer'; // Query search for the videos
		$type = 'video';
		$videoDuration = 'short';
		
		$fullUrl = $url.'?part='.$part.'&maxResults='.$maxResults.'&key='.$key.'&q='.$q.'&type='.$type.'&videoDuration='.$videoDuration;
		$res = _Get_Stream($fullUrl);
		$res = json_decode($res);
		
		echo json_encode(array('res' => $res));
	}
}
