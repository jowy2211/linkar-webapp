$( document ).ready(function() {
	$(".select2").select2();
    GetProvinces('#provinces');
	GetCities('#cities');
	GetDistricts('#districts');
	GetVillages('#villages');

	GetProvinces_('#provinces_');
	GetCities_('#cities_');
	GetDistricts_('#districts_');
	GetVillages_('#villages_');

	$('#NIK').keyup((e) => {
        const v = e.target.value;
        if (v.length === 0) {
        	$("#provinces_set").val('');
			$('#cities_set').val('');
			$('#districts_set').val('');
			$('#villages_set').val('');
        } else if (v.length === 2) {
    		$("#provinces_set").val(v);
		} else if (v.length === 4) {
			$('#cities_set').val(v);
			$('#districts_set').val('');
		} else if (v.length === 7) {
			$('#districts_set').val(v);
		}
        $.ajax({
            type: "post",
            url: base_url + 'DataEntry/handleRegionals',
            data: { code: v },
            dataType: "json",
            success: function (data) {
                if (data.code !== null) {
                    $(data.one).html(data.first);
                    $(data.two).html(data.second);
                	$(data.three).html(data.third);
                } else {
                    $(data.one).html(data.first);
                	$(data.two).html(data.second);
                	$(data.three).html(data.third);
            		if (v.length <= 2) {
                		GetProvinces('#provinces');
            		} else if (v.length > 2 && v.length <= 4) {
						GetCities('#cities');
            		} else if (v.length > 4 && v.length <= 7) {
						GetDistricts('#districts');
						GetVillages('#villages');
            		}
                }
            }
        });
    });
});

$(document).on("change", "#provinces", function(){
	$("#provinces_set").val(this.value);
	GetCities('#cities');
	GetDistricts('#districts');
	GetVillages('#villages');
});

$(document).on("change", "#cities", function(){
	$("#cities_set").val(this.value);
	GetDistricts('#districts');
	GetVillages('#villages');
});

$(document).on("change", "#districts", function(){
	$("#districts_set").val(this.value);
	GetVillages('#villages');
});

$(document).on("change", "#villages", function(){
	$("#villages_set").val(this.value);
});

function GetProvinces(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Provinces',
			method : "POST",
			data : {
				set_id : $("#provinces_set").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetCities(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Regency',
			method : "POST",
			data : {
				province : $("#provinces_set").val(),
				set_id : $("#cities_set").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetDistricts(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_District',
			method : "POST",
			data : {
				cities : $("#cities_set").val(),
				set_id : $("#districts_set").val()
			},
			async : false,
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetVillages(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Village',
			method : "POST",
			data : {
				district : $("#districts_set").val(),
				set_id : $("#villages_set").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

$(document).on("change", "#provinces_", function(){
	$("#provinces_set_").val(this.value);
	GetCities_('#cities_');
	GetDistricts_('#districts_');
	GetVillages_('#villages_');
});

$(document).on("change", "#cities_", function(){
	$("#cities_set").val(this.value);
	GetDistricts_('#districts_');
	GetVillages_('#villages_');
});

$(document).on("change", "#districts_", function(){
	$("#districts_set_").val(this.value);
	GetVillages_('#villages_');
});

$(document).on("change", "#villages_", function(){
	$("#villages_set_").val(this.value);
});

function GetProvinces_(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Provinces',
			method : "POST",
			data : {
				set_id : $("#provinces_set_").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetCities_(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Regency',
			method : "POST",
			data : {
				province : $("#provinces_set_").val(),
				set_id : $("#cities_set_").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetDistricts_(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_District',
			method : "POST",
			data : {
				cities : $("#cities_set_").val(),
				set_id : $("#districts_set_").val()
			},
			async : false,
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}

function GetVillages_(e){
	if($(e).length){
		$.ajax({
			url: base_url + 'Auth/Get_Village',
			method : "POST",
			data : {
				district : $("#districts_set_").val(),
				set_id : $("#villages_set_").val()
			},
			dataType : 'html',
			success: function(data){
				$(e).html(data);
			}
		});
	}
}