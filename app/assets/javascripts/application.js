//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require bootstrap-slider
//= require_tree .


$('.calendar').fullCalendar({
    events: '/search/events',
    eventLimit: 3,
    eventRender: function(event, element, calEvent) {
        element.find("span").before($("<span class=\"fc-event-icons\"></span>").html(event.logo));
    }
});

$("#slider1").slider({
    ticks: [0,25, 50, 100, 200],
    ticks_labels: ['0', '25', '50', '100', '200 km'],
    ticks_snap_bounds: 30
});

$("#slider2").slider({});



