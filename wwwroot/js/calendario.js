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

    // Cabecera del calendario
    let header = `<h3>${monthNames[month]} ${year}</h3>`;
    calendar.innerHTML += header;

    // Tabla de calendario
    let table = "<table border='1' style='width: 100%; text-align: center;'><tr>";
    // Días de la semana
    const daysOfWeek = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    for (let day of daysOfWeek) {
        table += `<th>${day}</th>`;
    }
    table += "</tr><tr>";

    // Espacios en blanco antes del primer día
    for (let i = 0; i < firstDay; i++) {
        table += "<td></td>";
    }

    // Días del mes
    for (let day = 1; day <= daysInMonth; day++) {
        if ((day + firstDay - 1) % 7 === 0) table += "</tr><tr>"; // Nueva fila para cada semana
        table += `<td>${day}</td>`;
    }

    table += "</tr></table>";
    calendar.innerHTML += table;
}

// Generar calendario del mes actual
document.addEventListener("DOMContentLoaded", () => {
    generateCalendar(currentMonth, currentYear);
});
