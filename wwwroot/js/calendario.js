
const calendar = document.getElementById("calendar");
const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
let currentMonth = new Date().getMonth();
let currentYear = new Date().getFullYear();


function generateCalendar(month, year) {
    calendar.innerHTML = ""; 
    const firstDay = new Date(year, month).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();


    let header = `<div class="calendar-header">
                    <button onclick="changeMonth(-1)">&#10094;</button>
                    <span>${monthNames[month]} ${year}</span>
                    <button onclick="changeMonth(1)">&#10095;</button>
                  </div>`;
    calendar.innerHTML = header;

    // 
    let table = "<div class='week'>";
    const daysOfWeek = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    for (let day of daysOfWeek) {
        table += `<div class='day-name'>${day}</div>`;
    }
    table += "</div><div class='week'>";

    for (let i = 0; i < firstDay; i++) {
        table += "<div class='day'></div>";
    }

    
    for (let day = 1; day <= daysInMonth; day++) {
        if ((day + firstDay - 1) % 7 === 0 && day > 1) table += "</div><div class='week'>"; 
        table += `<div class='day' onclick="abrirFormularioEvento('${year}-${month + 1}-${day}')">${day}</div>`;
    }

    table += "</div>";
    calendar.innerHTML += table;
}


function changeMonth(step) {
    currentMonth += step;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    } else if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    generateCalendar(currentMonth, currentYear);
}


function abrirFormularioEvento(fecha) {
    document.getElementById('Fecha').value = fecha;
    document.querySelector(".event-form").style.display = 'block';
}


function consultarEventosDelDia(fecha) {
    fetch(`/Home/ObtenerEventos?fecha=${fecha}`)
        .then(response => response.json())
        .then(eventos => {
            let eventList = document.getElementById('eventList');
            eventList.innerHTML = '';
            eventos.forEach(evento => {
                eventList.innerHTML += `<p><strong>${evento.Titulo}</strong>: ${evento.Descripcion}</p>`;
            });
            document.getElementById('eventModal').style.display = 'block';
        });
}


function cerrarModal() {
    document.getElementById('eventModal').style.display = 'none';
}

document.addEventListener("DOMContentLoaded", () => {
    generateCalendar(currentMonth, currentYear);
});
