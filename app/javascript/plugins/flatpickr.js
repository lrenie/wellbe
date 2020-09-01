import flatpickr from "flatpickr"

const checkSession = (dObj, dStr, fp, dayElem) => {
    const sessionForm = document.getElementById('session-form-div');
    const sessions = JSON.parse(sessionForm.dataset.sessions).map( (date) => {
        const dateWithTime = new Date(date);
        return dateWithTime.setHours(0, 0, 0, 0);
    });

    if (sessions.includes(dayElem.dateObj.setHours(0, 0, 0, 0))) {
        dayElem.classList.add("choucroute");
        dayElem.setAttribute("data-action", "click->show-sessions#show");
    }
    
}

const innitFlatPicker = () => {
    const sessionForm = document.getElementById('session-form-div');

    if (!sessionForm) return


    flatpickr("#date", {
        onDayCreate: checkSession,
        inline: true,
    })
    
}

export { innitFlatPicker };
