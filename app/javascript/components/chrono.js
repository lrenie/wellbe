const timeOfChrono = () => {

//////////////////////////////////////////////////
// Constant definitions
//////////////////////////////////////////////////

const one_second = 1_000,
      one_minute = one_second * 60,
      one_hour = one_minute * 60;

const periodRightHalfCircle = document.getElementById("period-right"),
      periodLeftHalfCircle  = document.getElementById("period-left"),
      totalRightHalfCircle  = document.getElementById("total-right"),
      totalLeftHalfCircle   = document.getElementById("total-left"),
      periodBar = document.querySelector(".progress-value.period"),
      totalBar =  document.querySelector(".progress-value.total");
if (!periodRightHalfCircle) {
  return
}
const periodElements = [periodRightHalfCircle, periodLeftHalfCircle, periodBar],
      totalElements  = [totalRightHalfCircle, totalLeftHalfCircle, totalBar];

const clockText = document.getElementById('clock-text'),
      clockSubtitle = document.getElementById("subtitle"),
      times = JSON.parse(clockText.dataset.times),
      names = JSON.parse(clockText.dataset.names);


const totalTime = times.reduce((sum, time) => time + sum, 0);

let startDate, periodFinishDate;


// ---------contante pour le picto---------------

const pictos = document.querySelectorAll(".picto-area > img");

// ---------constante pour la modale------------

const modale = document.querySelector(".bg-gris");

//////////////////////////////////////////////////
// CSS Animation Methods
//////////////////////////////////////////////////

const stopCSSAnimation = (element) => {
  console.log("stopCSSAnimation ok")
  if (element) {
    element.classList.remove("animated");
    void element.offsetWidth;
  }
}

const startCSSAnimation = (element) => {
  console.log("startCSSAnimation ok")
  if (element) {
    element.classList.add("animated");
  }
}

const setAnimationDuration = (element, duration) =>{
  console.log("setAnimationDuration ok")
  if (element) {
    element.style.animationDuration = `${duration}s`;
  }
}
// -------------------------------------------------
//   cache-cache Animation
// -------------------------------------------------
const hideElement = (element) => {
  element.classList.add("d-none");
}
const showElement = (element) => {
  element.classList.remove("d-none");
}


//////////////////////////////////////////////////
// Timer Methods
//////////////////////////////////////////////////

const newPeriodTimer = () => {

  // -------apparté picto---------
  pictos.forEach((element) => {
    console.log("bla")
    hideElement(element);
    if (element.dataset.exerciseName === names[0]) {
      showElement(element);
      if (element.dataset.exerciseName === "Repos") {
        element.classList.add('grisage');
        const gif = document.getElementById('gif');
        console.log(gif)
        gif.insertAdjacentHTML('afterbegin', '<h2 id="next">Prochain exercice</h2>' );
      } else if (element.dataset.exerciseName !== "Repos" ){
        const next = document.getElementById('next');
        if(next){
          next.remove();
        }
      }
    }

  });
  // -----------------------------------

  hideElement(modale);

  periodElements.forEach((element) => setAnimationDuration(element, times[0]));
  clockSubtitle.innerText = names.shift();

  periodElements.forEach(stopCSSAnimation);
  periodElements.forEach(startCSSAnimation);

  startDate = new Date();
  periodFinishDate = newDateSeveralSecondsLater(startDate, times.shift());
  requestAnimationFrame(tick);
}

const endGlobalTimer = () => {
  pictos.forEach((picto) => { hideElement(picto)});

  periodElements.forEach(stopCSSAnimation);
  totalElements.forEach(stopCSSAnimation);

  clockText.innerText = "Session terminée";
  clockSubtitle.style.display = "none";

  cancelAnimationFrame(tick);
  setTimeout(showElement(modale), 4000);
  console.log("ok le js est en cours");
  showModal();
}


const tick = () => {
  const now = new Date(),
        remainingTime = periodFinishDate - now;

  let remainingMinutes = `${Math.floor((remainingTime % one_hour) / one_minute )}`;
  let remainingSeconds = `${Math.floor(((remainingTime % one_hour) % one_minute ) / one_second )}`;

  if (remainingMinutes.length == 1) remainingMinutes = `0${remainingMinutes}`
  if (remainingSeconds.length == 1) remainingSeconds = `0${remainingSeconds}`
  clockText.innerText = `${remainingMinutes}:${remainingSeconds}`;

  if (now < periodFinishDate) {
    requestAnimationFrame(tick);
    return;
  }

  (times.length > 0) ? newPeriodTimer() : endGlobalTimer();
}

//////////////////////////////////////////////////
// Miscellaneaous
//////////////////////////////////////////////////

const newDateSeveralSecondsLater = (date, seconds) => {
  return new Date(date.getTime() + seconds * 1_000)
}

const showModal = () => {
  console.log("Modal Shown!");

}

//////////////////////////////////////////////////
// Main Logic
//////////////////////////////////////////////////
console.log(totalElements)
totalElements.forEach((element) => setAnimationDuration(element, totalTime));
newPeriodTimer();

const button  = document.querySelector(".cross");
console.log(button);
button.addEventListener('click', () => {
  hideElement(modale);
})


};

export { timeOfChrono };


