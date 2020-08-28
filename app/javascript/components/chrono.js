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

const periodElements = [periodRightHalfCircle, periodLeftHalfCircle, periodBar],
      totalElements  = [totalRightHalfCircle, totalLeftHalfCircle, totalBar];

const clockText = document.getElementById('clock-text'),
      clockSubtitle = document.getElementById("subtitle"),
      times = JSON.parse(clockText.dataset.times),
      names = JSON.parse(clockText.dataset.names);

const totalTime = times.reduce((sum, time) => time + sum, 0);

let startDate, periodFinishDate;

//////////////////////////////////////////////////
// CSS Animation Methods
//////////////////////////////////////////////////

const stopCSSAnimation = (element) => {
  element.classList.remove("animated");
  void element.offsetWidth;
}

const startCSSAnimation = (element) => {
  element.classList.add("animated");
}

const setAnimationDuration = (element, duration) =>{
  element.style.animationDuration = `${duration}s`;
}

//////////////////////////////////////////////////
// Timer Methods
//////////////////////////////////////////////////

const newPeriodTimer = () => {
  periodElements.forEach((element) => setAnimationDuration(element, times[0]));
  clockSubtitle.innerText = names.shift();

  periodElements.forEach(stopCSSAnimation);
  periodElements.forEach(startCSSAnimation);

  startDate = new Date();
  periodFinishDate = newDateSeveralSecondsLater(startDate, times.shift());
  requestAnimationFrame(tick);
}

const endGlobalTimer = () => {
  periodElements.forEach(stopCSSAnimation);
  totalElements.forEach(stopCSSAnimation);

  clockText.innerText = "Exercice terminé !";
  clockSubtitle.style.display = "none";

  cancelAnimationFrame(tick);
  setTimeout(showModal, 4000);
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

totalElements.forEach((element) => setAnimationDuration(element, totalTime));
newPeriodTimer();

};

export { timeOfChrono };


