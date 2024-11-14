const startButton = document.getElementById("startButton");
const countdownDisplay = document.getElementById("countdownDisplay");

let countdownInterval;

startButton.addEventListener("click", () => {
    const minutes = parseInt(document.getElementById("minutes").value) || 0;
    const seconds = parseInt(document.getElementById("seconds").value) || 0;
    let totalTimeInSeconds = minutes * 60 + seconds;

    if (totalTimeInSeconds > 0) {
        clearInterval(countdownInterval);
        startCountdown(totalTimeInSeconds);
    } else {
        alert("Por favor, ingresa un tiempo válido.");
    }
});

function startCountdown(duration) {
    let timeRemaining = duration;

    countdownInterval = setInterval(() => {
        const minutes = Math.floor(timeRemaining / 60);
        const seconds = timeRemaining % 60;
        countdownDisplay.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;

        if (timeRemaining <= 0) {
            clearInterval(countdownInterval);
            countdownDisplay.textContent = "¡Tiempo terminado!";
        } else {
            timeRemaining--;
        }
    }, 1000);
}
