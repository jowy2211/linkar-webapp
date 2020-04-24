var handleDataTable = function() {
	"use strict";
    
    if ($('#data-table-provinces').length !== 0) {
        $('#data-table-provinces').DataTable({
            responsive: true
        });
    }
};

var Regional = function () {
	"use strict";
    return {
        init: function () {
            handleDataTable();
        }
    };
}();