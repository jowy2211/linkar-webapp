<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_User extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_Authentication(){
		date_default_timezone_set("Asia/Jakarta");
		$today = date("Y-m-d H:i:s");

        $username = $this->security->xss_clean($this->input->post('username'));
        $password = $this->security->xss_clean($this->input->post('password'));

        if($username && $password)
        {
            $data = array(
            		'log_time' => $today,
                    'username' => $username,
                    'validated_admin' => TRUE
                    );
            $this->session->set_userdata($data);
            return true; // NOTED - Fixing soon
        }

        return false;
    }
}
?>