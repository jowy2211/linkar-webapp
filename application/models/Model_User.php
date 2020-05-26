<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Model_User extends CI_Model{
    function __construct(){
        parent::__construct();
    }
	
	public function _Get_Authentication(){
		date_default_timezone_set("Asia/Jakarta");
		$today = date("Y-m-d H:i:s");
        $ip_address = $this->input->ip_address();  //IP_ADDRESS
        $user_agent = $this->input->user_agent();  //USER_AGENT

        $username = $this->security->xss_clean($_POST['username']);
        $password = $this->security->xss_clean($_POST['password']);

        if($username && $password)
        {
            $this->db->where('username', $username);
            $this->db->where('password', md5($password));
            $res = $this->db->get('users')->row();
            if ($res) {
                if ($res->level === 'ADMIN') {
                    $data = array(
                    		'log_time' => $today,
                            'username' => $username,
                            'validated_admin' => TRUE
                            );
                    $this->session->set_userdata($data);

                    // IF LOGIN SUCCESS ---------------------------------------
                    $history = array(
                        'user_id' => $res->user_id,
                        'username'=> $res->username,
                        'ip_address'=> $ip_address,
                        'login_date'=> $today,
                        'login_detail'=> $user_agent,
                        'login_status'=> 0, // SUCCESS
                        'login_note'=> 'Username & Password is matching!'
                    );  
                    $check = $this->db->insert('history_login', $history);
                    //-----------------------------------------------------
                    return (object)array('status' => true, 'message' => 'Success login.');
                }

                if ($res->level === 'USER') {
                    $data = array(
                            'log_time' => $today,
                            'user_id' => $res->user_id,
                            'username' => $username,
                            'fullname' => $res->fullname,
                            'validated_user' => TRUE
                            );   
                    $this->session->set_userdata($data);
                    
                    // IF LOGIN SUCCESS ---------------------------------------
                    $history = array(
                        'user_id' => $res->user_id,
                        'username'=> $res->username,
                        'ip_address'=> $ip_address,
                        'login_date'=> $today,
                        'login_detail'=> $user_agent,
                        'login_status'=> 0, // SUCCESS
                        'login_note'=> 'Username & Password is matching!'
                    );  
                    $check = $this->db->insert('history_login', $history);
                    //-----------------------------------------------------
                    return (object)array('status' => true, 'message' => 'Success login.');
                }
            } else {
                $this->db->where('username', $username);
                $res_2 = $this->db->get('users')->row();
                if ($res_2) {
                    // IF LOGIN FAILED ---------------------------------------
                    $history = array(
                        'user_id' => NULL,
                        'username'=> $username,
                        'ip_address'=> $ip_address,
                        'login_date'=> $today,
                        'login_detail'=> $user_agent,
                        'login_status'=> 1, // FAILED INCORRECT
                        'login_note'=> 'Password is incorrect!'
                    );  
                    $check = $this->db->insert('history_login', $history);
                    //-----------------------------------------------------
                    return (object)array('status' => false, 'message' => 'Password is incorrect.');
                }

                // IF LOGIN FAILED ---------------------------------------
                $history = array(
                    'user_id' => NULL,
                    'username'=> $username,
                    'ip_address'=> $ip_address,
                    'login_date'=> $today,
                    'login_detail'=> $user_agent,
                    'login_status'=> 2, // FAILED NOT FOUND
                    'login_note'=> 'Account is not found!'
                );  
                $check = $this->db->insert('history_login', $history);
                //-----------------------------------------------------
                return (object)array('status' => false, 'message' => 'Account is not found.');
            }
        }
    }

    public function _Signup_Now($data)
    {
        date_default_timezone_set("Asia/Jakarta");
        $today = date("Y-m-d H:i:s");
        
        $encrypt = md5($data['password']);
        unset($data['password']);
        
        $data['level'] = 'USER';
        $data['password'] = $encrypt;

        $res = $this->db->insert('users', $data);

        if ($res) {
            $this->db->where($data);
            $get = $this->db->get('users')->row();

            if ($get) {
                $data = array(
                        'user_id' => $get->user_id,
                        'log_time' => $today,
                        'username' => $get->username,
                        'validated_signup' => TRUE
                        );
                $this->session->set_userdata($data);

                return $get;
            }
            return false;
        }
    }

    public function _Get_Detail_User()
    {
        $user_id = $this->session->userdata('user_id');
        $this->db->where('user_id', $user_id);
        $res = $this->db->get('users')->row();
        return $res;
    }
}
?>
