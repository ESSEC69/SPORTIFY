//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment 
//= require fullcalendar
//= require_tree .

$('.calendar').fullCalendar({
    events: '/search/events',
    eventLimit: 3,
    eventRender: function(event, element, calEvent) {
        element.find("span").before($("<span class=\"fc-event-icons\"></span>").html(event.logo));
    }
});
