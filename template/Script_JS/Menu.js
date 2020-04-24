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
          text: "Hapus Menu!",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "Ya, Hapus!",
          closeOnConfirm: false
        },
        function(){
            $.ajax({
                type: "post",
                url: base_url + 'Menu/Delete',
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

var hideAlert = function() {
    window.setTimeout(function() {
        $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
            $(this).remove(); 
        });
    }, 5000);
}

var Menu = function () {
    "use strict";
    return {
        //main function
        init: function () {
            handleDataTableDefault();
            handleSelect2();
            btnConfirmation();
            hideAlert();
        }
    };
}();