var getMonthName = function(number) {
    var month = [];
    month[0] = "January";
    month[1] = "February";
    month[2] = "March";
    month[3] = "April";
    month[4] = "May";
    month[5] = "Jun";
    month[6] = "July";
    month[7] = "August";
    month[8] = "September";
    month[9] = "October";
    month[10] = "November";
    month[11] = "December";
    
    return month[number];
};

var getDate = function(date) {
    var currentDate = new Date(date);
    var dd = currentDate.getDate();
    var mm = currentDate.getMonth() + 1;
    var yyyy = currentDate.getFullYear();
    
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    currentDate = yyyy+'-'+mm+'-'+dd;
    
    return currentDate;
};

var handleVisitorsLineChart = function() {
    var aqua = '#5AC8FA';
    var aquaLight = '#63a4c1';
    var blue = '#007aff';
    var blueLight = '#3086e4';
    var blackTransparent = 'rgba(0,0,0,0.6)';
    var whiteTransparent = 'rgba(255,255,255,0.4)';
    
    Morris.Line({
        element: 'visitors-line-chart',
        data: [
            {x: '2020-02-01', y: 60, z: 30},
            {x: '2020-03-01', y: 70, z: 40},
            {x: '2020-04-01', y: 40, z: 10},
            {x: '2020-05-01', y: 100, z: 70},
            {x: '2020-06-01', y: 40, z: 10},
            {x: '2020-07-01', y: 80, z: 50},
            {x: '2020-08-01', y: 70, z: 40}
        ],
        xkey: 'x',
        ykeys: ['y', 'z'],
        xLabelFormat: function(x) {
            x = getMonthName(x.getMonth());
            return x.toString();
        },
        labels: ['Diterima', 'Ditolak'],
        lineColors: [aqua, blue],
        pointFillColors: [aquaLight, blueLight],
        lineWidth: '2px',
        pointStrokeColors: [blackTransparent, blackTransparent],
        resize: true,
        gridTextFamily: 'inherit',
        gridTextColor: whiteTransparent,
        gridTextWeight: 'normal',
        gridTextSize: '12px',
        gridLineColor: 'rgba(255,255,255,0.15)',
        hideHover: 'auto',
    });
};

var handleVisitorsDonutChart = function() {
    var aqua = '#5AC8FA';
    var blue = '#007aff';
    Morris.Donut({
        element: 'visitors-donut-chart',
        data: [
            {label: "Diterima", value: 50},
            {label: "Ditolak", value: 60}
        ],
        colors: [aqua, blue],
        labelFamily: 'inherit',
        labelColor: 'rgba(255,255,255,0.4)',
        labelTextSize: '12px',
        backgroundColor: '#111'
    });
};

var handleVisitorsVectorMap = function() {
    if ($('#visitors-map').length !== 0) {
        $('#visitors-map').vectorMap({
            map: 'indonesia-adm1_merc',
            scaleColors: ['#eee', '#000'],
            container: $('#visitors-map'),
            normalizeFunction: 'linear',
            hoverOpacity: 0.5,
            hoverColor: false,
            markerStyle: {
                initial: {
                    fill: '#333',
                    stroke: 'transparent',
                    r: 3
                }
            },
            regions: [{
                attribute: 'fill'
            }],
            regionStyle: {
                initial: {
                    fill: '#777',
                    "fill-opacity": 1,
                    stroke: 'none',
                    "stroke-width": 0.4,
                    "stroke-opacity": 1
                },
                hover: {
                    "fill-opacity": 0.8
                },
                selected: {
                    fill: 'yellow'
                },
                selectedHover: {
                }
            },
            series: {
                regions: [{
                values: {
                    10:'#007aff',
                    12:'#007aff',
                    19:'#007aff'
                }
                }]
            },
            focusOn: {
                x: 0.5,
                y: 0.5,
                scale: 1
            },
            backgroundColor: '#222'
        });
    }
};

var handleScheduleCalendar = function() {
    var monthNames = ["January", "February", "March", "April", "May", "June",  "July", "August", "September", "October", "November", "December"];
    var dayNames = ["S", "M", "T", "W", "T", "F", "S"];

    var now = new Date(),
        month = now.getMonth() + 1,
        year = now.getFullYear();

    var events = [
        [
            '2/' + month + '/' + year,
            'Popover Title',
            '#',
            '#007aff',
            'Some contents here'
        ],
        [
            '5/' + month + '/' + year,
            'Tooltip with link',
            'http://www.seantheme.com/color-admin-v1.3',
            '#222'
        ],
        [
            '18/' + month + '/' + year,
            'Popover with HTML Content',
            '#',
            '#222',
            'Some contents here <div class="text-right"><a href="http://www.google.com">view more >>></a></div>'
        ],
        [
            '28/' + month + '/' + year,
            'Color Admin V1.3 Launched',
            'http://www.seantheme.com/color-admin-v1.3',
            '#222',
        ]
    ];
    var calendarTarget = $('#schedule-calendar');
    $(calendarTarget).calendar({
        months: monthNames,
        days: dayNames,
        events: events,
        popover_options:{
            placement: 'top',
            html: true
        }
    });
    $(calendarTarget).find('td.event').each(function() {
        var backgroundColor = $(this).css('background-color');
        $(this).removeAttr('style');
        $(this).find('a').css('background-color', backgroundColor);
    });
    $(calendarTarget).find('.icon-arrow-left, .icon-arrow-right').parent().on('click', function() {
        $(calendarTarget).find('td.event').each(function() {
            var backgroundColor = $(this).css('background-color');
            $(this).removeAttr('style');
            $(this).find('a').css('background-color', backgroundColor);
        });
    });
};

var handleDashboardGritterNotification = function() {
    $(window).load(function() {
        setTimeout(function() {
            $.gritter.add({
                title: 'Selamat Siang!',
                text: 'Selamat Bekerja Untuk Hari Ini',
                image: base_url + 'files/assets/img/user-12.jpg',
                sticky: true,
                time: '',
                class_name: 'my-sticky-class'
            });
        }, 1000);
    });
};

var Dashboard = function () {
	"use strict";
    return {
        //main function
        init: function () {
            handleVisitorsLineChart();
            handleVisitorsDonutChart();
            handleVisitorsVectorMap();
            handleScheduleCalendar();
            handleDashboardGritterNotification();
        }
    };
}();