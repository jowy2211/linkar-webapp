<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Videos extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_List()
    {
        $this->db->select('a.*, b.name as channel, c.name as interest');
        $this->db->from('videos a');
        $this->db->join('channels b','a.channel_id = b.id');
        $this->db->join('interests c','a.interest_id = c.id');
        $res = $this->db->get();
        return $res->result();
    }

    public function _Get_Detail($id)
    {
        $this->db->select('a.*, b.name as channel, c.name as interest');
        $this->db->from('videos a');
        $this->db->join('channels b','a.channel_id = b.id');
        $this->db->join('interests c','a.interest_id = c.id');
        $this->db->where('a.id', $id);
        $res = $this->db->get();
        return $res->row();
    }

    public function _Get_List_Trailer($flag)
    {
        $this->db->select('a.*, b.name as channel, c.name as interest');
        $this->db->from('videos a');
        $this->db->join('channels b','a.channel_id = b.id');
        $this->db->join('interests c','a.interest_id = c.id');
        $this->db->where('a.flag', $flag);
        // $this->db->group_by('b.name');
        // $this->db->group_by('a.publish_at');
        $res = $this->db->get();
        return $res->result();
    }

    public function _Get_Data_Filter($value)
    {
        $this->db->select('a.*, b.name as channel, c.name as interest');
        $this->db->from('videos a');
        $this->db->join('channels b','a.channel_id = b.id');
        $this->db->join('interests c','a.interest_id = c.id');
        $this->db->where('a.flag', 'VERIFIED');
        $this->db->like('a.title', $value);
        $filter = $this->db->get()->result();
        return $filter;
    }

    public function _Get_Channels()
    {
        $res = $this->db->get('channels')->result();
        return $res;
    }

    public function _Get_Detail_Channel($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->get('channels')->row();
        return $res;
    }

    public function _Get_Interests()
    {
        $res = $this->db->get('interests')->result();
        return $res;
    }

    public function _Get_Detail_Interest($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->get('interests')->row();
        return $res;
    }

    public function _Store_Videos($data)
    {
        $res = $this->db->insert('videos', $data);
        return $res;
    }
}
?>