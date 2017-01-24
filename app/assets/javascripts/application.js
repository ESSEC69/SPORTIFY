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


$(".event-search").submit(function(e) {
    $.ajax({
           type: "GET",
           url: "/search/index",
           data: $(".event-search").serialize(), // serializes the form's elements.
           success: function(data)
           {
              calendar.fullCalendar('removeEvents');
              calendar.fullCalendar('renderEvents', data)
           }
         });

    e.preventDefault(); // avoid to execute the actual submit of the form.
});


$(".index-search").submit(function(e) {
  if($('#q').val().length != 0) {
    $.ajax({
       type: "GET",
       url: "/search/index",
       data: $(".index-search").serialize(), // serializes the form's elements.
       success: function(data)
       {
          $('.results-container').html("");
          if(data.count > 0) {
            $('.results-container').append(data.html);
            $('body').addClass("result-found");
          } else {
            $('body').removeClass("result-found");
          }
       }
     });
  }

    e.preventDefault(); // avoid to execute the actual submit of the form.
});

