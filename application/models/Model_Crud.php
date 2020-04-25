<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * 
 */
class Model_Crud extends CI_model {
	public function _Insert($table,$data){
		$this->db->insert($table,$data);
		if ($this->db->affected_rows() > 0)
		{
		  return true;
		}
		else
		{
		  return false;
		}
	}

	public function _Update($table,$data,$where){
		$this->db->where($where);
		$this->db->update($table,$data);
		if ($this->db->affected_rows() > 0)
		{
		  return true;
		}
		else
		{
		  return false;
		}
	}

	public function _Delete($table,$where){
		$this->db->where($where);
		$this->db->delete($table);
		if ($this->db->affected_rows() > 0)
		{
		  return true;
		}
		else
		{
		  return false;
		}
	}
}