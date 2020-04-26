<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function _Get_Stream($url, $method = NULL, $post_data = NULL, $header = NULL, $ssl = NULL)
{
    $data = curl_init();
    curl_setopt($data, CURLOPT_URL, $url);

	if ($method == 'POST'){
		curl_setopt($data, CURLOPT_POST, true);
		curl_setopt($data, CURLOPT_POSTFIELDS, $post_data);
	}
	
    if($header != NULL){
        curl_setopt($data, CURLOPT_HTTPHEADER, $header);
    }

	curl_setopt($data, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($data, CURLOPT_HEADER, 0);
    if($ssl != NULL){
        curl_setopt($data, CURLOPT_SSL_VERIFYPEER, $ssl);
    }

    $output = curl_exec($data);

    curl_close($data);

    return $output;
}
