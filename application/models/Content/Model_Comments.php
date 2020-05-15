<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_Comments extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_Data($where = null){
        $this->db->select('*');
        $this->db->from("comments");
        if ($where != null) {
            $this->db->where($where);
        }
        return $this->db->get()->result();
    }
}
?>