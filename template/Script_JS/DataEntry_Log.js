$( document ).ready(function() {
    GetLog_('#entry_log');
});

function GetLog_(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_DataEntry_Log',
			method : "POST",
			data : {
				reg_id : $("#REGISTRATION_ID").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}
