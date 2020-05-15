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
    }

	public function index()
	{
		// Add specific data here
		$list = $this->Model_Videos->_Get_List();
		$data['content'] = 'adminapp_views/Content/Videos/index';
		$data['list'] = $list;
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Form()
	{
		// Add specific data here
		// Define form is editing or creating here
		$param = $this->input->get();
		$data['channels'] = $this->Model_Videos->_Get_Channels();
		$data['interests'] = $this->Model_Videos->_Get_Interests();
		if (isset($param['id'])) {
			$data['action'] = 'edit';
			$whereVideo = $param['id'];
			$video = $this->Model_Videos->_Get_Detail($whereVideo);
			if ($video) {
				$data['video'] = $video;
			} else {
				$this->session->set_flashdata(
					"message",
					"<div class='alert alert-warning fade in m-b-15'>
						<strong>Data not found !</strong>
						<span class='close' data-dismiss='alert'>&times;</span>
					</div>"
				);
				redirect(base_url('adminapp/Content/Videos'));
			}
		} else {
			$data['action'] = 'add';
		}
		$data['content'] = 'adminapp_views/Content/Videos/Form';
		$this->load->view('adminapp_views/Template', $data);
	}

	public function Store()
	{
		$interestId = $this->input->post('interest');
		$getInterest = $this->Model_Videos->_Get_Detail_Interest($interestId);
		
		$channelId = $this->input->post('channel');
		$getChannel = $this->Model_Videos->_Get_Detail_Channel($channelId);
		
		$result = $this->Search($getChannel, $getInterest);
		if ($result && !empty($result->items)) {
			foreach ($result->items as $key => $value) {
				if ($value->snippet->channelId === $getChannel->channel_id) {
					$data['title'] = $value->snippet->title;
					$data['description'] = $value->snippet->description;
					$data['url'] = $value->id->videoId;
					$data['thumbnails'] = $value->snippet->thumbnails->high->url;
					$data['publish_at'] = $value->snippet->publishedAt;
					$data['channel_id'] = $channelId;
					$data['interest_id'] = $interestId;
					$res = $this->Model_Videos->_Store_Videos($data);

					if (!$res) {
						$this->session->set_flashdata(
							"message",
							"<div class='alert alert-warning fade in m-b-15'>
								<strong>Sorry :( request has an error, try again later.</strong>
								<span class='close' data-dismiss='alert'>&times;</span>
							</div>"
						);
						break;
					}
				} else {
					$data['title'] = $value->snippet->title;
					$data['description'] = $value->snippet->description;
					$data['url'] = $value->id->videoId;
					$data['thumbnails'] = $value->snippet->thumbnails->high->url;
					$data['publish_at'] = $value->snippet->publishedAt;
					$data['channel_id'] = $channelId;
					$data['interest_id'] = $interestId;
					$data['flag'] = 'UNVERIFIED';
					$res = $this->Model_Videos->_Store_Videos($data);

					if (!$res) {
						$this->session->set_flashdata(
							"message",
							"<div class='alert alert-warning fade in m-b-15'>
								<strong>Sorry :( request has an error, try again later.</strong>
								<span class='close' data-dismiss='alert'>&times;</span>
							</div>"
						);
						break;
					}
				}
			}
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-success fade in m-b-15'>
					<strong>Success!</strong>
					Videos Has been stored
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		} elseif ($result && !empty($result->error)) {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-danger fade in m-b-15'>
					<strong>Sorry :( ".$result->error->message."</strong>
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		} else {
			$this->session->set_flashdata(
				"message",
				"<div class='alert alert-danger fade in m-b-15'>
					<strong>Sorry :( Trailer you looking for are not found, please try again with other parameter.</strong>
					<span class='close' data-dismiss='alert'>&times;</span>
				</div>"
			);
		}
		redirect(base_url('adminapp/Content/Videos'), 'refresh');
	}

	public function Search($channel, $interest)
	{
		$query = $interest->name.'+movie+'.$channel->name.'+official+trailer';
		$url = 'https://www.googleapis.com/youtube/v3/search';
		$part = 'snippet';
		$key = 'AIzaSyCx-mxyqq4TRd6grXGkOkXLa54-YlQdgD8'; // Api key registed with youtube
		$q = $query; // Query search for the videos
		$type = 'video';
		$videoDuration = 'short';
		
		$fullUrl = $url.'?part='.$part.'&maxResults=50'.'&key='.$key.'&q='.$q.'&type='.$type.'&videoDuration='.$videoDuration;
		$res = _Get_Stream($fullUrl);
		$res = json_decode($res);
		
		return $res;
	}
}
