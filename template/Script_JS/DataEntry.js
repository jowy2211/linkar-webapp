var handleDataTableDefault = function() {
    var datatable = $('#data-table').DataTable({
        "processing": true, 
        "serverSide": true, 
        "order": [],
        "ajax": {
            "url": base_url + "DataEntry/Get_List",
            "type": "POST",
			"data": function(data){
                var filter_provinsi = $('#filter_provinsi').val();
                var filter_kota = $('#filter_kota').val();
                var filter_kecamatan = $('#filter_kecamatan').val();
                var filter_kelurahan = $('#filter_kelurahan').val();

                data.filter_provinsi = filter_provinsi;
                data.filter_kota = filter_kota;
                data.filter_kecamatan = filter_kecamatan;
                data.filter_kelurahan = filter_kelurahan;
			}
        },
        "columnDefs": [{ 
              "targets": [ 0,5 ], 
              "orderable": false, 
        },],
    });

    $('#filter_provinsi, #filter_kota, #filter_kecamatan, #filter_kelurahan').on('change' , function(e){
        e.preventDefault();
        datatable.draw();
    });

    $('#reset_button').on('click', function(e){
        e.preventDefault();
        $('#filter_provinsi').val(null);
        $('#filter_kota').val(null);
        $('#filter_kecamatan, #filter_kelurahan').val(null);
        datatable.draw();
    })
};
var handleDatepicker = function() {
    $("#DATE_OF_BIRTH").datepicker({
        todayHighlight: !0,
        autoclose: true
    });
    $("#MOTHER_BIRTH").datepicker({
        todayHighlight: !0,
		autoclose: true
    });
    $("#STARTING_FROM").datepicker({
        todayHighlight: !0,
        autoclose: true
    });
};
var handlerForm = () => {
	$(".only-number").bind('keypress', function (e) {
        return !(e.which != 8 && e.which != 0 &&
                (e.which < 48 || e.which > 57) && e.which != 46);
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
	$("#DATE_OF_BIRTH").on("change", function(e) {
		var birthdate = $("input[name=DATE_OF_BIRTH]").val();
		var umur = getAge(birthdate);
		$("#AGE").val(umur);
    });
    
    $("input[data-type='currency']").on({
        keyup: function() {
          formatCurrency($(this));
        },
        blur: function() { 
          formatCurrency($(this), "blur");
        }
    });
    $('#EDUCATION').on('change', function(e) {
        var id = e.target.value;
        if (id === 'SD' || id === 'SMP' || id === 'SMA' || id === '') {
            $('#EDUCATION_MAJOR').prop("disabled", true);
        } else {
            $('#EDUCATION_MAJOR').removeAttr('disabled');
        }
    });
    $('#MARITAL_STATUS').on('change', function(e) {
        var id = e.target.value;
        if (id === 'Lajang' || id === '') {
            $('#SPOUSE_NAME').prop("disabled", true);
            $('#SPOUSE_WORK').prop("disabled", true);
        } else {
            $('#SPOUSE_NAME').removeAttr('disabled');
            $('#SPOUSE_WORK').removeAttr('disabled');
        }
    });
    $('#showModal').on('click', function() {
        swal('Under Development');
    });
	$('#form-data-entry').on('submit', function(e) {
		e.preventDefault();
		var formData = new FormData(this);
		$.ajax({
			method: 'POST',
            url: base_url + 'DataEntry/SaveDataDiri',
            data: formData,
            contentType: false,
            processData: false,
			success: function(data, status, xhr) {
				var result = JSON.parse(xhr.responseText);
				if (result.status === 'success') {
					swal({
					  title: "Berhasil",
					  text: result.message,
					  type: "success",
					  showCancelButton: false,
					  confirmButtonClass: "btn-primary",
					  confirmButtonText: "Ok",
					  closeOnConfirm: false
					},
					function(){
						window.location = base_url + 'DataEntry/Form/' + result.data;
					});
				}
			}
		});
	});
};

var handleUploadKelengkapanDokumen = () => {
    Dropzone.autoDiscover = false;

    var img = new Dropzone('#upload-kelengkapan-dokumen',{
        url: base_url+'DataEntry/Upload',
        maxFilesize: 103,
        maxFiles: 1,
        method: 'post',
        acceptedFiles: ".png,.jpg,.jpeg",
        paramName: 'file',
        dictInvalidFileType: 'Type file ini tidak dizinkan.',
        addRemoveLinks:true,
        accept: (file, done) => {
            var status = handleKelengkapanDokumen();
            if (status === 'SUCCESS') {
                return done();
            } else if (status === 'REQUIRED'){
                swal({
                    title: 'Peringatan!',
                    text: 'Lengkapi Form di atas terlebih dahulu.',
                    type: 'warning',
                },
                function() {
                    img.removeFile(file);
                });
            } else if (status === 'DUPLIKAT') {
                swal({
                    title: "Peringatan",
                    text: "Duplikat Jenis Dokumen",
                    type: "warning",
                },
                function() {
                    img.removeFile(file);
                });
                $('#NAMA_DOKUMEN').attr('disabled', true);
                $('#DETAIL_DOKUMEN').attr('disabled', true);
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
        formData.append('NAMA_DOKUMEN', $('#NAMA_DOKUMEN').val());
        formData.append('JENIS_DOKUMEN', $('#JENIS_DOKUMEN').val());
        formData.append('DETAIL_DOKUMEN', $('#DETAIL_DOKUMEN').val());
        formData.append('TYPE_UPLOAD', $('#KELENGKAPAN_DOKUMEN').val());
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
					handleTableKelengkapanDokumen();
					$('#modal-dialog-kelengkapan').modal('hide');
					clearFormKelengkapanDokumen();
				}
			});
       } else {
            swal(res.message);
            $('#modal-dialog-kelengkapan').modal('hide');
            clearFormKelengkapanDokumen();
       }
    });
    img.on('complete', function(file) {
      img.removeFile(file);
    });
};
var handleUploadPersyaratanBencana = () => {
    Dropzone.autoDiscover = false;

    var img = new Dropzone('#upload-persyaratan-bencana',{
        url: base_url+'DataEntry/Upload',
        maxFilesize: maxFilesizeUpload,
        maxFiles: 1,
        method: 'post',
        acceptedFiles: ".png,.jpg,.jpeg,.pdf",
        paramName: 'file',
        dictInvalidFileType: 'Type file ini tidak dizinkan.',
        addRemoveLinks:true,
        accept: (file, done) => {
            if (handleSuratPersyaratanBencana()) {
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
        formData.append('NOMOR_SURAT', $('#NOMOR_SURAT_BENCANA').val());
        formData.append('TIPE', $('#TIPE_BENCANA').val());
        formData.append('TYPE_UPLOAD', $('#DAMPAK_BENCANA').val());
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
					handleTablePersyaratanBencana();
					$('#modal-dialog-persyaratan-bencana').modal('hide');
					clearFormPersyaratanBencana();
				}
			});
       } else {
            swal(res.message);
            $('#modal-dialog-persyaratan-bencana').modal('hide');
            clearFormPersyaratanBencana();
       }
    });
    img.on('complete', function(file) {
      img.removeFile(file);
    });
};
var handleUploadPersyaratanDisabilitas = () => {
    Dropzone.autoDiscover = false;

    var img = new Dropzone('#upload-persyaratan-disabilitas',{
        url: base_url+'DataEntry/Upload',
        maxFilesize: maxFilesizeUpload,
        maxFiles: 1,
        method: 'post',
        acceptedFiles: ".png,.jpg,.jpeg,.pdf",
        paramName: 'file',
        dictInvalidFileType: 'Type file ini tidak dizinkan.',
        addRemoveLinks:true,
        accept: (file, done) => {
            if (handleSuratPersyaratanDisabilitas()) {
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
        formData.append('NOMOR_SURAT', $('#NOMOR_SURAT_DISABILITAS').val());
        formData.append('TIPE', $('#TIPE_DISABILITAS').val());
        formData.append('TYPE_UPLOAD', $('#PERSYARATAN_DISABILITAS').val());
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
					handleTablePersyaratanDisabilitas();
                    $('#buttonDisabilitas').html('<a class="btn btn-sm btn-success" disabled><i class="fa fa-plus"></i> Tambah Baru</a>');
					$('#modal-dialog-persyaratan-disabilitas').modal('hide');
					clearFormPersyaratanDisabilitas();
				}
			});
       } else {
            swal(res.message);
            $('#modal-dialog-persyaratan-disabilitas').modal('hide');
            clearFormPersyaratanDisabilitas();
       }
    });
    img.on('complete', function(file) {
      img.removeFile(file);
    });
};

var handleTableKelengkapanDokumen = () => {
    $.ajax({
        url: base_url + 'DataEntry/Get_List_KelengkapanDokumen',
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
        url: base_url + 'DataEntry/Get_List_PersyaratanBencana',
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
        url: base_url + 'DataEntry/Get_List_PersyaratanDisabilitas',
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
var handleFormInformasiBank = () => {
    "use strict";
    $('#form-informasi-bank').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            method: 'POST',
            url: base_url + 'DataEntry/SaveInformasiBank',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data, status, xhr) {
                var result = JSON.parse(xhr.responseText);
                if (result.status) {
					$.gritter.add({
						title: 'Informasi',
						text: result.message,
						sticky: true,
						time: '',
						before_open: function(){
							$('.select2me').val('').trigger('change');
							$("#form-informasi-bank").trigger("reset");
							$('#modal-informasi-bank').modal('hide');
                            $('#buttonBank').html('<a class="btn btn-sm btn-success" disabled><i class="fa fa-plus"></i> Tambah Baru</a>');
							handleTableInformasiBank();
						}
					});
                }
            }
        });
    });
    $("#NPWP_NO").mask("99.999.999.9-999.999");
};
var handleTableInformasiBank = () => {
    $.ajax({
        url: base_url + 'DataEntry/Get_List_InformasiBank',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-informasi-bank').html(data);
        }
    });
};
var handleFormIdentitasDihubungi = () => {
    "use strict";
    $('#form-identitas-dihubungi').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            method: 'POST',
            url: base_url + 'DataEntry/SaveIdentitasDihubungi',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data, status, xhr) {
                var result = JSON.parse(xhr.responseText);
                if (result.status) {
					$.gritter.add({
						title: 'Informasi',
						text: result.message,
						sticky: true,
						time: '',
						before_open: function(){
							$("#form-identitas-dihubungi").trigger("reset");
							$('#modal-identitas-dihubungi').modal('hide');
							handleTableIdentitasDihubungi();
						}
					});
                }
            }
        });
    });
};
var handleTableIdentitasDihubungi = () => {
    $.ajax({
        url: base_url + 'DataEntry/Get_List_IdentitasDihubungi',
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
var handleFormIdentitasUsaha = () => {
    "use strict";
    $('#form-identitas-usaha').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            method: 'POST',
            url: base_url + 'DataEntry/SaveIdentitasUsaha',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data, status, xhr) {
                var result = JSON.parse(xhr.responseText);
                if (result.status) {
					$.gritter.add({
						title: 'Informasi',
						text: result.message,
						sticky: true,
						time: '',
						before_open: function(){
							$('.select2me').val('').trigger('change');
							$("#form-identitas-usaha").trigger("reset");
							$('#modal-identitas-usaha').modal('hide');
                            $('#buttonUsaha').html('<a class="btn btn-sm btn-success" disabled><i class="fa fa-plus"></i> Tambah Baru</a>');
							handleTableIdentitasUsaha();
						}
					});
                }
            }
        });
    });
};
var handleTableIdentitasUsaha = () => {
    $.ajax({
        url: base_url + 'DataEntry/Get_List_IdentitasUsaha',
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

var handleFormLaporanKeuangan = () => {
    "use strict";
    $('#form-laporan-keuangan').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            method: 'POST',
            url: base_url + 'DataEntry/SaveLaporanKeuangan',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data, status, xhr) {
                var result = JSON.parse(xhr.responseText);
                if (result.status) {
                    $.gritter.add({
                        title: 'Informasi',
                        text: result.message,
                        sticky: true,
                        time: '',
                        before_open: function(){
                            $('.select2me').val('').trigger('change');
                            $("#form-laporan-keuangan").trigger("reset");
                            $('#modal-laporan-keuangan').modal('hide');
                            $('#buttonKeuangan').html('<a class="btn btn-sm btn-success" disabled><i class="fa fa-plus"></i> Tambah Baru</a>');
                            handleTableLaporanKeuangan();
                        }
                    });
                }
            }
        });
    });
};
var handleTableLaporanKeuangan = () => {
    $.ajax({
        url: base_url + 'DataEntry/Get_List_LaporanKeuangan',
        method: 'POST',
        dataType: 'html',
        data: {
            REGISTRATION_ID: $('#REGISTRATION_ID').val()
        },
        success: function(data) {
            $('#data-table-laporan-keuangan').html(data);
        }
    });
};

var handleDuplicateDocument = (e) => {
    if (e) {
        $.ajax({
            url: base_url + 'DataEntry/HandleDocument',
            type: "post",
            dataType: "json",
            data: {
                TYPE: e,
                REGISTRATION_ID: $('#REGISTRATION_ID').val()
            },
            success: function (data) {
                if (data.res) {
                    swal({
                        title: "Peringatan",
                        text: "Duplikat Jenis Dokumen",
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonClass: "btn-default",
                        confirmButtonText: "Ok",
                        closeOnConfirm: true
                    });
                    $('#NAMA_DOKUMEN').attr('disabled', true);
                    $('#DETAIL_DOKUMEN').attr('disabled', true);
                } else {
                    $('#NAMA_DOKUMEN').removeAttr('disabled');
                    $('#DETAIL_DOKUMEN').removeAttr('disabled');
                }
            }
        });
    }
};
DataEntry = function() {
    "use strict";
    return {
        init: function() {
        	handlerForm();
        	handleDatepicker();
            handleDataTableDefault();
            handleUploadKelengkapanDokumen();
            handleUploadPersyaratanBencana();
            handleUploadPersyaratanDisabilitas();
            handleTableKelengkapanDokumen();
            handleTablePersyaratanBencana();
            handleTablePersyaratanDisabilitas();
            handleTableInformasiBank();
            handleFormInformasiBank();
            handleTableIdentitasDihubungi();
            handleFormIdentitasDihubungi();
            handleTableIdentitasUsaha();
            handleFormIdentitasUsaha();
            handleTableLaporanKeuangan();
            handleFormLaporanKeuangan();
            handleDuplicateDocument();
        }
    }
}();

$(document).on('click', '#btn-del', function () {
	var tr_tag = $(this).parent().parent();
	var id = $(this).attr('data-id');
	swal({
	  title: "Konfirmasi?",
	  text: "Hapus Data User!",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonClass: "btn-danger",
	  confirmButtonText: "Ya, Hapus!",
	  closeOnConfirm: false
	},
	function(){
		$.ajax({
			type: "post",
			url: base_url + 'Users/Delete',
			data: {id: id},
			dataType: "json",
			success: function (data) {
				if (data.status) {
					swal('Data berhasil dihapus');
					$(tr_tag).remove();
				} else {
					swal('Maaf, data gagal dihapus');
				}
			}
		});
	});
});

function handleSuratPersyaratanDisabilitas() {
    const NOMOR_SURAT = $('#NOMOR_SURAT_DISABILITAS').val();
    const TIPE_DOKUMEN = $('#TIPE_DISABILITAS').val();
    var STATUS;
    if (NOMOR_SURAT !== '' && TIPE_DOKUMEN !== '') {
        STATUS = true;
    } else {
        STATUS = false;
    }
    return STATUS;
}

function handleSuratPersyaratanBencana() {
    const NOMOR_SURAT = $('#NOMOR_SURAT_BENCANA').val();
    const TIPE_DOKUMEN = $('#TIPE_BENCANA').val();
    var STATUS;
    if (NOMOR_SURAT !== '' && TIPE_DOKUMEN !== '') {
        STATUS = true;
    } else {
        STATUS = false;
    }
    return STATUS;
}

function handleKelengkapanDokumen() {
    const JENIS_DOKUMEN = $('#JENIS_DOKUMEN').val();
    const NAMA_DOKUMEN = $('#NAMA_DOKUMEN').val();
    const DETAIL_DOKUMEN = $('#DETAIL_DOKUMEN').val();
    var STATUS = '';
    if (NAMA_DOKUMEN !== '' && JENIS_DOKUMEN !== '' && DETAIL_DOKUMEN !== '') {
        $.ajax({
            async: false,
            url: base_url + 'DataEntry/HandleDocument',
            type: "post",
            dataType: "json",
            data: {
                TYPE: JENIS_DOKUMEN,
                REGISTRATION_ID: $('#REGISTRATION_ID').val()
            },
            success: function (data) {
                if (data.res) {
                    STATUS = 'DUPLIKAT';
                } else {
                    STATUS = 'SUCCESS';
                }
            }
        });
    } else {
        STATUS = 'REQUIRED';
    }
    return STATUS;
}


function clearFormKelengkapanDokumen() {
    $('#NAMA_DOKUMEN').val('');
    $('#DETAIL_DOKUMEN').val('');
    $('#JENIS_DOKUMEN').val('');
}

function clearFormPersyaratanBencana() {
    $('#NOMOR_SURAT_BENCANA').val('');
    $('#TIPE_BENCANA').val('');
}

function clearFormPersyaratanDisabilitas() {
    $('#NOMOR_SURAT_DISABILITAS').val('');
    $('#TIPE_DISABILITAS').val('');
}

function formatNumber(n) {
  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}


function formatCurrency(input, blur) {
  var input_val = input.val();
  if (input_val === "") { return; }
  var original_len = input_val.length;
  var caret_pos = input.prop("selectionStart");
  if (input_val.indexOf(".") >= 0) {
    var decimal_pos = input_val.indexOf(".");
    var left_side = input_val.substring(0, decimal_pos);
    var right_side = input_val.substring(decimal_pos);
    left_side = formatNumber(left_side);
    right_side = formatNumber(right_side);
    if (blur === "blur") {
      right_side += "00";
    }
    right_side = right_side.substring(0, 2);
    input_val = "Rp" + left_side;

  } else {
    input_val = formatNumber(input_val);
    input_val = "Rp" + input_val;
  }
  input.val(input_val);
  var updated_len = input_val.length;
  caret_pos = updated_len - original_len + caret_pos;
  input[0].setSelectionRange(caret_pos, caret_pos);
}

function showImageSuratKeterangan(e) {
    var img = $('#image_'+e).data('image');
    var url = $('#image_'+e).data('url');
    $("#img-surat-keterangan").attr('src',base_url+url+img);
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

function showForm_LaporanKeuangan() {
    $('#create_LaporanKeuangan').show();
    $('#submit_LaporanKeuangan').show();
    $('#view_LaporanKeuangan').html('');
}

function showDetailDocument_LaporanKeuangan(e) {
    $('#submit_LaporanKeuangan').hide();
    $.ajax({
        url: base_url + 'DataEntry/View_Document_LaporanKeuangan',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#create_LaporanKeuangan').hide();
            $('#modal-laporan-keuangan').modal('show');
        },
        success: function(data) {
            $('#view_LaporanKeuangan').show();
            $('#view_LaporanKeuangan').html(data);
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

function showForm_InformasiBank() {
    $('#create_InformasiBank').show();
    $('#submit_InformasiBank').show();
    $('#view_InformasiBank').html('');
}

function showDetailDocument_InformasiBank(e) {
    $('#submit_InformasiBank').hide();
    $.ajax({
        url: base_url + 'DataEntry/View_Document_InformasiBank',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#create_InformasiBank').hide();
            $('#modal-informasi-bank').modal('show');
        },
        success: function(data) {
            $('#view_InformasiBank').show();
            $('#view_InformasiBank').html(data);
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

function showForm_IdentitasUsaha() {
    $('#create_IdentitasUsaha').show();
    $('#submit_IdentitasUsaha').show();
    $('#view_IdentitasUsaha').html('');
}

function showDetailDocument_IdentitasUsaha(e) {
    $('#submit_IdentitasUsaha').hide();
    $.ajax({
        url: base_url + 'DataEntry/View_Document_IdentitasUsaha',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#create_IdentitasUsaha').hide();
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

function showForm_IdentitasDihubungi() {
    $('#create_IdentitasDihubungi').show();
    $('#submit_IdentitasDihubungi').show();
    $('#view_IdentitasDihubungi').html('');
}

function showDetailDocument_IdentitasDihubungi(e) {
    $('#submit_IdentitasDihubungi').hide();
    $.ajax({
        url: base_url + 'DataEntry/View_Document_IdentitasDihubungi',
        method: 'POST',
        dataType: 'html',
        data: {
            ID: e
        },
        beforeSend: function() {
            $('#create_IdentitasDihubungi').hide();
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

function remove_IdentitasDihubungi(e) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Identitas Yang Bisa Dihubungi!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				TITLE: 'IDENTITAS_DIHUBUNGI',
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
							handleTableIdentitasDihubungi();
						}
					});
				}
			}
		})
    });
}

function remove_IdentitasUsaha(e) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Identitas Usaha!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				TITLE: 'IDENTITAS_USAHA',
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
                            $('#buttonUsaha').html('<a href="#modal-identitas-usaha" onClick="showForm_IdentitasUsaha()" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus"></i> Tambah Baru</a>');
							handleTableIdentitasUsaha();
						}
					});
				}
			}
		})
    });
		
    
}

function remove_InformasiBank(e) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Data Informasi Bank!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				TITLE: 'INFORMASI_BANK',
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
                            $('#buttonBank').html('<a href="#modal-informasi-bank" onClick="showForm_InformasiBank()" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus"></i> Tambah Baru</a>');
							handleTableInformasiBank();
						}
					});
				}
			}
		})
    });
}

function remove_LaporanKeuangan(e) {
    swal({
      title: "Konfirmasi?",
      text: "Hapus Laporan Keuangan!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
            url: base_url + 'DataEntry/DeleteList',
            method: 'POST',
            dataType: 'json',
            data: {
                ID: e,
                TITLE: 'LAPORAN_KEUANGAN',
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
                            $('#buttonKeuangan').html('<a href="#modal-laporan-keuangan" onClick="showForm_LaporanKeuangan()" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus"></i> Tambah Baru</a>');
                            handleTableLaporanKeuangan();
                        }
                    });
                }
            }
        })
    });
}

function remove_DocumentKelengkapan(e,url) {
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
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				URL: url,
				TITLE: 'DOCUMENT_KELENGKAPAN',
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
							handleTableKelengkapanDokumen();
						}
					});
				}
			}
		})
    });
}

function remove_DocumentBencana(e,url) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Dokumen Persyaratan!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				URL: url,
				TITLE: 'DOCUMENT_BENCANA',
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
							handleTablePersyaratanBencana();
						}
					});
				}
			}
		})
    });
}

function remove_DocumentDisabilitas(e,url) {
	swal({
      title: "Konfirmasi?",
      text: "Hapus Dokumen Persyaratan!",
      type: "warning",
      showCancelButton: true,
      confirmButtonClass: "btn-danger",
      closeOnConfirm: true
    },
    function(){
        $.ajax({
			url: base_url + 'DataEntry/DeleteList',
			method: 'POST',
			dataType: 'json',
			data: {
				ID: e,
				URL: url,
				TITLE: 'DOCUMENT_DISABILITAS',
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
                            $('#buttonDisabilitas').html('<a href="#modal-dialog-persyaratan-disabilitas" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa fa-plus"></i> Tambah Baru</a>');
							handleTablePersyaratanDisabilitas();
						}
					});
				}
			}
		})
    });
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
            url: base_url + 'DataEntry/Update_Status',
            method: 'POST',
            dataType: 'json',
            data: {
                REGISTRATION_ID: e
            },
            success: function (data) {
                if (data.status === true) {
                    window.location = base_url + 'Inquiry';
                }else{
					swal({
						title: "Informasi!",
						text: data.message,
						type: "warning",
						showCancelButton: false,
						confirmButtonClass: 'btn-warning',
						confirmButtonText: 'Upload!',
						closeOnConfirm: true,
					}, function(){
						$("#modal-dialog-kelengkapan").modal('show');
						$("#JENIS_DOKUMEN").val(data.type).trigger('change');
					});
				}
            }
        })
    });
}

function startDate(e) {
    var startFrom = getAge(e);
    $("#LONG_TIME").val(startFrom);
}

function getAge(date) {
	var today = new Date();
	var birthday = new Date(date);
	var year = 0;
	if (today.getMonth() < birthday.getMonth()) {
		year = 1;
	} else if ((today.getMonth() == birthday.getMonth()) && today.getDate() < birthday.getDate()) {
		year = 1;
	}
	var age = today.getFullYear() - birthday.getFullYear() - year;
 
	if(age < 0){
		age = 0;
	}
	return age;
}

function GetJenisUsaha(){
	$.ajax({
		url: base_url + 'DataEntry/Get_Jenis_Usaha',
		method : "POST",
		data : {
			bidang_usaha : $("#FIELD").val(),
			jenis_usaha : $("#TYPE").val()
		},
		async : false,
		dataType : 'html',
		success: function(data){
			$("#TYPE").html(data);
		}
	});
}
