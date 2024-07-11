import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import listPlugin from "@fullcalendar/list";

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, listPlugin],
    initialView: 'dayGridMonth',
    locale: "jp",

  events: eventData.map(project => ({
    title: project.project_name,
    start: project.start_date_time,
    end: project.end_date_time,
    url: "/public/projects/" + project.id
  })),
    eventColor: '#6B86B9',
        color: 'yellow',   // an option!
    textColor: 'black' ,// an option!


      //レスポンシブ処理
    windowResize: function () {
        if (window.innerWidth < 991.98) {
            calendar.changeView('listMonth');
        } else {
            calendar.changeView('dayGridMonth');
        }
    },
  });

  calendar.render();
});

