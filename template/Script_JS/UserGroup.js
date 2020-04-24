var handleDataTableDefault = function() {
    "use strict";
    0 !== $("#data-table").length && $("#data-table").DataTable({
        responsive: !0,
        "ordering": false
    })
}

var handleSelect2 = function() {
    $(".default-select2").select2();
    $(".multiple-select2").select2({ placeholder: "Select a state" });
}

var btnConfirmation = function() {
    $(".confirmation").on("click", function(){
        var tr_tag = $(this).parent().parent();
        var id = $(this).attr('data-id');
        swal({
          title: "Konfirmasi?",
          text: "Hapus User Group!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "Ya, Hapus!",
          closeOnConfirm: false
        },
        function(){
            $.ajax({
                type: "post",
                url: base_url + 'UserGroup/Delete',
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
    })
}

var tableUserModulePrevilege = function () {
    $("#module_list").DataTable({
        "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

        "lengthMenu": [
            [-1, 10, 20, 50, 100, 150],
            ["All", 10, 20, 50, 100, 150] // change per page values here
        ],
        "pageLength": -1, // default record count per page
        "ajax": {
            "url": base_url + "UserGroup/Get_List_Previlege", // ajax source
        },
        "ordering": false// set first column as a default sort by asc
    });

    $("#select_all").change(function() {
        if(this.checked) {
            $('input:checkbox').attr('checked','checked');
        }else{
            $('input:checkbox').removeAttr('checked');
        }
    });
}

var hideAlert = function() {
    window.setTimeout(function() {
        $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
            $(this).remove(); 
        });
    }, 5000);
}

var UserGroup = function () {
    "use strict";
    return {
        //main function
        init: function () {
            btnConfirmation();
            handleDataTableDefault();
            tableUserModulePrevilege();
            hideAlert();
        }
    };
}();