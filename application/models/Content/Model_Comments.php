<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Comments extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_Data()
    {
        $this->db->select('a.*, b.title as video, c.fullname as user');
        $this->db->from('comments a');
        $this->db->join('videos b','a.video_id = b.id');
        $this->db->join('users c','a.user_id = c.user_id');
        $res = $this->db->get();
        return $res->result();
    }

    public function _Get_Detail($id)
    {
        $this->db->select('a.*, b.title as video, c.fullname as user');
        $this->db->from('comments a');
        $this->db->join('videos b','a.video_id = b.id');
        $this->db->join('users c','a.user_id = c.user_id');
        $this->db->where('a.comment_id', $id);
        $res = $this->db->get();
        return $res->row();
    }
}
?>