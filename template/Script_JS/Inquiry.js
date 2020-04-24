var handleDataTable = function() {
    var datatable = $('#data-table').DataTable({
        "processing": true, 
        "serverSide": true, 
        "order": [],
        "ajax": {
            "url": base_url + "Inquiry/Get_List",
            "type": "POST",
			"data": function(data){
                var provinces = $('#provinces_set').val();
                var cities = $('#cities_set').val();
                var districts = $('#districts_set').val();
                var villages = $('#villages_set').val();

                data.provinces = provinces;
                data.cities = cities;
                data.districts = districts;
                data.villages = villages;
			}
        },
        "columnDefs": [{ 
              "targets": [ 0,5 ], 
              "orderable": false, 
        },],
    });

    $('#provinces, #cities, #districts, #villages').on('change' , function(e){
        e.preventDefault();
		setTimeout(function(){ datatable.draw(); }, 100);
    });

    $('#reset_button').on('click', function(e){
        e.preventDefault();
		var isDisabledProvinces = $('#provinces').prop('disabled');
		if(isDisabledProvinces == false){ $('#provinces').val(null).trigger('change'); };
		
		var isDisabledCities = $('#cities').prop('disabled');
		if(isDisabledCities == false){ $('#cities').val(null).trigger('change'); };
		
		var isDisabledDistricts = $('#districts').prop('disabled');
		if(isDisabledDistricts == false){ $('#districts').val(null).trigger('change'); };
		
		var isDisabledVillages = $('#villages').prop('disabled');
		if(isDisabledVillages == false){ $('#villages').val(null).trigger('change'); };

        datatable.draw();
    })
};

var handleForm = function() {
	$(".readonly").keydown(function(e){
	  var key = e.charCode || e.keyCode;
	  if (key == 13) { 
		// enter key do nothing
	  } else {
		e.preventDefault();
	  }	
	});
	
	$(".select2me").select2();
	
	$('.masked-currency').inputmask('currency', {
        prefix: "",
        allowPlus: false,
        allowMinus: false,
        min: 0,
        radixPoint: ',',
        groupSeparator: ".",
        placeholder: "",
        autoGroup: !0,
        digits: 0,
        rightAlign: false,
        unmaskAsDecimal: true,
        removeMaskOnSubmit: true,
        autoUnmask: true
    });
};

var handleTableIdentitasUsaha = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_IdentitasUsaha',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-identitas-usaha').html(data);
        }
    });
};

var handleTableIdentitasKeuangan = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_IdentitasKeuangan',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-identitas-keuangan').html(data);
        }
    });
};

var handleTableIdentitasDihubungi = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_IdentitasDihubungi',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-identitas-dihubungi').html(data);
        }
    });
};

var handleTableKelengkapanDokumen = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_KelengkapanDokumen',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-kelengkapan-dokumen').html(data);
        }
    });
};

var handleTablePersyaratanBencana = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_PersyaratanBencana',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-persyaratan-bencana').html(data);
        }
    });
};

var handleTablePersyaratanDisabilitas = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_PersyaratanDisabilitas',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-persyaratan-disabilitas').html(data);
        }
    });
};

var handleTableSuratKeterangan = () => {
    $.ajax({
        url: base_url + 'Inquiry/Get_List_SuratKeterangan',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-surat-keterangan').html(data);
        }
    });
};

var handleUploadSuratKeterangan = () => {
    Dropzone.autoDiscover = false;

    var img = new Dropzone('#upload-surat-keterangan',{
        url: base_url+'Inquiry/Upload',
        maxFilesize: 5,
        maxFiles: 1,
        method: 'post',
		acceptedFiles: ".png,.jpg,.jpeg,.pdf",
        paramName: 'file',
        dictInvalidFileType: 'Type file ini tidak dizinkan.',
        addRemoveLinks:true,
        accept: (file, done) => {
            if (handleSuratKeterangan()) {
                return done();
            } else {
                swal({
                    title: 'Peringatan!',
                    text: 'Lengkapi Form di atas terlebih dahulu.',
                    type: 'warning',
                },
                function() {
                    img.removeFile(file);
                });
            }
        }
    });
    img.on('maxfilesexceeded', function(file){
        swal({
            title: 'Peringatan!',
            text: 'Tidak di izinkan mengupload lebih dari satu.',
            type: 'warning',
        });
    });
    img.on('sending',function(file, xhr, formData){
        formData.append('NOMOR_SURAT', $('#NOMOR_SURAT').val());
        formData.append('TIPE', $('#TIPE').val());
        formData.append('TYPE_UPLOAD', $('#SURAT_KETERANGAN').val());
        formData.append('REGISTRATION_ID', $('#REGISTRATION_ID').val());
		formData.append('REGISTRATION_NO', $('#REGISTRATION_NO').val());
    });
    img.on('success',function(file, data){
        var res = JSON.parse(data);
       if (file.status === 'success' && res.status === 'success') {
			$.gritter.add({
				title: file.status,
				text: res.message,
				sticky: true,
				time: '',
				before_open: function(){
					handleTableSuratKeterangan();
					$('#modal-dialog-surat-keterangan').modal('hide');
					clearFormSuratKeterangan();
				}
			});
       } else {
            swal(res.message);
            $('#modal-dialog-surat-keterangan').modal('hide');
            clearFormSuratKeterangan();
       }
    });
    img.on('complete', function(file) {
      img.removeFile(file);
    });
};


Inquiry = function() {
    "use strict";
    return {
        init: function() {
        	handleDataTable();
			handleForm();
			handleTableIdentitasUsaha();
			handleTableIdentitasKeuangan();
			handleTableIdentitasDihubungi();
			handleTableKelengkapanDokumen();
			handleTablePersyaratanBencana();
			handleTablePersyaratanDisabilitas();
			handleTableSuratKeterangan();
			handleUploadSuratKeterangan();
        }
    }
}();

function showDetailDocument_IdentitasUsaha(e) {
    $.ajax({
        url: base_url + 'Inquiry/View_Document_IdentitasUsaha',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
		beforeSend: function() {
            $('#modal-identitas-usaha').modal('show');
        },
        success: function(data) {
            $('#view_IdentitasUsaha').show();
            $('#view_IdentitasUsaha').html(data);
			$(".readonly").keydown(function(e){
			  var key = e.charCode || e.keyCode;
			  if (key == 13) {
			  } else {
				e.preventDefault();
			  }	
			});
        }
    });
}

function showDetailDocument_IdentitasKeuangan(e) {
    $.ajax({
        url: base_url + 'Inquiry/View_Document_IdentitasKeuangan',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#modal-identitas-keuangan').modal('show');
        },
        success: function(data) {
            $('#view_IdentitasKeuangan').show();
            $('#view_IdentitasKeuangan').html(data);
			$(".readonly").keydown(function(e){
			  var key = e.charCode || e.keyCode;
			  if (key == 13) {
			  } else {
				e.preventDefault();
			  }	
			});
        }
    });
}

function showDetailDocument_IdentitasDihubungi(e) {
    $.ajax({
        url: base_url + 'Inquiry/View_Document_IdentitasDihubungi',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#modal-identitas-dihubungi').modal('show');
        },
        success: function(data) {
            $('#view_IdentitasDihubungi').show();
            $('#view_IdentitasDihubungi').html(data);
			$(".readonly").keydown(function(e){
			  var key = e.charCode || e.keyCode;
			  if (key == 13) {
			  } else {
				e.preventDefault();
			  }	
			});
        }
    });
}

function showDetailFile(e) {
	var file = $('#file_'+e).data('file');
    var ext = $('#file_'+e).data('ext');
	var type = ext.toLowerCase();
	
	if(type == 'pdf'){
		$("#img-file").hide();
		$("#pdf-file").show();
		$("#pdf-file").attr('src',file);
	}else{
		$("#img-file").show();
		$("#pdf-file").hide();
		$("#img-file").attr('src',file);
	}
	
	$('#modal-detail-file').modal('show');

    
}

function handleSuratKeterangan() {
    const NOMOR_SURAT = $('#NOMOR_SURAT').val();
    const TIPE_DOKUMEN = $('#TIPE').val();
    var STATUS;
    if (NOMOR_SURAT !== '' && TIPE_DOKUMEN !== '') {
        STATUS = true;
    } else {
        STATUS = false;
    }
    return STATUS;
}

function clearFormSuratKeterangan() {
    $('#NOMOR_SURAT').val('');
    $('#TIPE').val('');
}

function RejectDocument(){
	$('#reject_note').wysihtml5();
	$('#modal-reject').modal('show');
}

function SubmitReject(){
	var note = $("#reject_note").val();
	var id = $("#REGISTRATION_ID").val();
	
	if(note === ""){
		$.gritter.add({
			title: 'Informasi',
			text: "Masukan Catatan",
			sticky: true,
			time: ''
		});
	}else{
		$.ajax({
			url: base_url + 'Inquiry/RejectDocument',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: id,
				NOTE: note
			},
			success: function (data) {
				if (data.status) {
					swal({
					  title: "Berhasil",
					  text: data.message,
					  type: "success",
					  showCancelButton: false,
					  confirmButtonClass: "btn-primary",
					  confirmButtonText: "Ok"
					},
					function(){
						window.location.href = base_url + "Inquiry";
					});
				}
			}
		})
	}
}

function continueDocument(e) {
    swal({
        title: 'Lanjutkan Pengajuan',
        text: 'Klik Ok untuk melanjutkan pengajuan',
        type: 'info',
        showCancelButton: true,
        confirmButtonClass: 'btn-info',
        confirmButtonText: 'Ok',
        closeOnConfirm: false,
    }, function() {
        $.ajax({
            url: base_url + 'Inquiry/Update_Status',
            method: 'POST',
            dataType: 'json',
            data: {
                REGISTRATION_ID: e
            },
            success: function (data) {
                if (data.status === true) {
                    window.location = base_url + 'Inquiry';
                }
            }
        })
    });
}

function approveDocument(e){
	swal({
        title: 'Setujui Pengajuan',
        text: 'Klik OK Untuk Menyetujui Pengajuan',
        type: 'info',
        showCancelButton: true,
        confirmButtonClass: 'btn-info',
        confirmButtonText: 'Ok',
        closeOnConfirm: false,
    }, function() {
        $.ajax({
            url: base_url + 'Inquiry/Approve_Status',
            method: 'POST',
            dataType: 'json',
            data: {
                REGISTRATION_ID: e
            },
            success: function (data) {
                if (data.status === true) {
                    location.reload(); 
                }
            }
        })
    });
}

function remove_DocumentKeterangan(e,url) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Dokumen!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'Inquiry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				URL: url,
				TITLE: 'DOCUMENT_KETERANGAN',
				REGISTRATION_ID: $('#REGISTRATION_ID').val()
			},
			success: function (data) {
				if (data.status) {
					$.gritter.add({
						title: 'Informasi',
						text: data.message,
						sticky: true,
						time: '',
						before_open: function(){
							handleTableSuratKeterangan();
						}
					});
				}
			}
		})
    });
}