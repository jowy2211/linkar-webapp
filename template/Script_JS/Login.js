$("#login_form").submit(function(e) {
	$.ajax({
		type: "POST",
		url:  base_url + 'Auth/Validate_Login',
		dataType: 'json',
		data: $("#login_form").serialize(),
		beforeSend: function(){
			$( "#button_login" ).prop( "disabled", true );
		},
		success: function(data){
			if(data.status == 'error'){
				swal("Oooops!", data.msg, "error");
			}else{
				swal({
				  title: "Information",
				  text: data.msg,
				  type: "success",
				  closeOnConfirm: false
				},
				function(){
					window.location.href = base_url + "Dashboard";
				});

			}
		},
		complete: function() {
			$( "#button_login" ).prop( "disabled", false );
		}	        
	});
	   e.preventDefault();
	});