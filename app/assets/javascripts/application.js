//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment 
//= require fullcalendar
//= require_tree .

var calendar = $('.calendar').fullCalendar({
    events: [],
    eventLimit: 3,
    eventRender: function(event, element, calEvent) {
        element.find("span").before($("<span class=\"fc-event-icons\"></span>").html(event.logo));
    }
});


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
          if(Object.keys(data).length > 0) {
            $('body').addClass("result-found");
            $.each(data, function( key, month ) {
              $('.results-container').append("<h3 class='results-month'>" + key + "</h3>");
              table = $("<table class='table table-striped results-table'>");
              table.append("<thead><th>Date</th><th>Épreuve</th><th>Évènement</th><th>Distance</th><th>Lieu</th></thead>");
              $.each(month, function( index, event ) {
                var row = "<tr><td>" + event.date + "</td><td>" + event.name + "</td><td><a href='" + event.link + "'>" + event.master_event_name + "</a></td><td>" + event.distance + "</td><td>" + event.location + "</td></tr>";
                table.append(row);
              });
              $('.results-container').append(table);
            });
          } else {
            $('body').removeClass("result-found");
          }
       }
     });
  }

    e.preventDefault(); // avoid to execute the actual submit of the form.
});