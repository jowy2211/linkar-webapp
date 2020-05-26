<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Interest extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_Data($where = null){
        $this->db->select('*');
        $this->db->from("interests");
        if ($where != null) {
            $this->db->where($where);
        }
        return $this->db->get()->result();
    }

    public function _Get_DataList()
    {
        $res = $this->db->get('interests')->result();
        return $res;
    }

    public function _Get_My_Interest()
    {
        $user_id = $this->session->userdata('user_id');
        $this->db->select('b.name, b.image');
        $this->db->from('user_interests a');
        $this->db->join('interests b','a.interest_id = b.id');
        $this->db->where('a.user_id', $user_id);
        $res = $this->db->get();
        return $res->result();
    }

    public function _Store_DataInterest($payload)
    {
        date_default_timezone_set("Asia/Jakarta");
        $today = date("Y-m-d H:i:s");
        $user_id = $this->session->userdata('user_id');
        for ($i=0; $i < count($payload); $i++) { 
            $data['interest_id'] = $payload[$i]['value'];
            $data['user_id'] = $user_id;
            $res = $this->db->insert('user_interests', $data);
        }

        $this->session->unset_userdata('validated_signup');

        if ($res) {
            $this->db->where('user_id', $user_id);
            $get = $this->db->get('users')->row();
            if ($get) {
                $sess = array(
                        'user_id' => $get->user_id,
                        'log_time' => $today,
                        'username' => $get->username,
                        'fullname' => $get->fullname,
                        'validated_user' => TRUE
                        );
                $this->session->set_userdata($sess);
            }
        }
        return $res;
    }
}
?>