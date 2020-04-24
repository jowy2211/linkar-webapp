var handleDataTable = function() {
	"use strict";
    
    if ($('#data-table').length !== 0) {
        $('#data-table').DataTable({
            responsive: true
        });
    }
};

var UnderdevelopedRegions = function () {
	"use strict";
    return {
        init: function () {
            handleDataTable();
        }
    };
}();