// Variables de configuración del calendario
const calendar = document.getElementById("calendar");
const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
let currentMonth = new Date().getMonth();
let currentYear = new Date().getFullYear();

// Función para generar el calendario
function generateCalendar(month, year) {
    calendar.innerHTML = ""; // Limpiar el calendario
    const firstDay = new Date(year, month).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    // Agregar el encabezado del mes y año
    let header = `<div class="calendar-header">
                    <button onclick="changeMonth(-1)">&#10094;</button>
                    <span>${monthNames[month]} ${year}</span>
                    <button onclick="changeMonth(1)">&#10095;</button>
                  </div>`;
    calendar.innerHTML = header;

    // Días de la semana
    let table = "<div class='week'>";
    const daysOfWeek = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    for (let day of daysOfWeek) {
        table += `<div class='day-name'>${day}</div>`;
    }
    table += "</div><div class='week'>";

    // Espacios en blanco antes del primer día
    for (let i = 0; i < firstDay; i++) {
        table += "<div class='day'></div>";
    }

    // Días del mes
    for (let day = 1; day <= daysInMonth; day++) {
        if ((day + firstDay - 1) % 7 === 0 && day > 1) table += "</div><div class='week'>"; // Nueva fila para cada semana
        table += `<div class='day' onclick="abrirFormularioEvento('${year}-${month + 1}-${day}')">${day}</div>`;
    }

    table += "</div>";
    calendar.innerHTML += table;
}

// Función para cambiar el mes
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

// Función para abrir el formulario de evento
function abrirFormularioEvento(fecha) {
    document.getElementById('Fecha').value = fecha;
    document.querySelector(".event-form").style.display = 'block';
}

// Función para consultar eventos del día
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

// Función para cerrar el modal
function cerrarModal() {
    document.getElementById('eventModal').style.display = 'none';
}

// Generar el calendario al cargar la página
document.addEventListener("DOMContentLoaded", () => {
    generateCalendar(currentMonth, currentYear);
});
