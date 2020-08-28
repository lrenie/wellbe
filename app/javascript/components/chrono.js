const timeOfChrono = () => {
const one_second = 1_000,
      one_minute = one_second * 60,
      one_hour = one_minute * 60;

const spans1 = document.querySelectorAll(".timer .hand:first-child span");
const spans2 = document.querySelectorAll(".timer .hand:last-child span");

const barPeriod = document.querySelector(".progress-value.period");
const barTotal = document.querySelector(".progress-value.total");



const clockText = document.getElementById('clock-text'),
      times = JSON.parse(clockText.dataset.times),
      names = JSON.parse(clockText.dataset.names);

const totalDiv = document.querySelectorAll(".timer.total .hand span");
const currentDiv = document.querySelectorAll(".timer.minute .hand span");
const print = document.getElementById("print");

print.innerHTML = "ok";

totalDiv.forEach((div) => {
  div.style.animationDuration = `${times.reduce((sum, time) => time + sum, 0)}s`
});
barTotal.style.animationDuration = `${times.reduce((sum, time) => time + sum, 0)}s`;

currentDiv.forEach((div) => {
  div.style.animationDuration = `${times[0]}s`
});
barPeriod.style.animationDuration = `${times[0]}s`



const h2 = document.querySelector("h2");
h2.innerText = names.shift();


// CSS Animation Methods

const stopCSSAnimation = (element) => {
  element.classList.remove("animated");
  void element.offsetWidth;
}

const startCSSAnimation = (element) => {
  element.classList.add("animated");
}

// Date Methods

const newDateSeveralSecondsLater = (date, seconds) => {
  return new Date(date.getTime() + seconds * 1_000)
}

// Other Functions

const showModal = () => {
  print.innerText = "Modal Shown!";
}

const endPeriodTimer = () => {
  currentDiv.forEach((div) => {
    div.style.animationDuration = `${times[0]}s`
  });

  h2.innerText = names.shift();

  stopCSSAnimation(spans1[1]);
  stopCSSAnimation(spans2[1]);
  stopCSSAnimation(barPeriod);
  startCSSAnimation(spans1[1]);
  startCSSAnimation(spans2[1]);
  startCSSAnimation(barTotal);

  startDate = new Date();
  finishCurrentDate = newDateSeveralSecondsLater(startDate, times.shift());
}

const endGlobalTimer = () => {
  spans1.forEach((div) => {
    stopCSSAnimation(div);
  });
  spans2.forEach((div) => {
    stopCSSAnimation(div);
  });
  stopCSSAnimation(barPeriod);
  stopCSSAnimation(barTotal);

  cancelAnimationFrame(tick);
  clockText.innerText = "Exercice terminé !";
  h2.style.display = "none";
  setTimeout(showModal, 4000);
}

let startDate = new Date(),
    finishCurrentDate = newDateSeveralSecondsLater(startDate, times.shift());

const tick = () => {

  const now = new Date(),
        currentElapsed = finishCurrentDate - now;

  let minutes = `${Math.floor( (currentElapsed % one_hour) / one_minute )}`;
  let seconds = `${Math.floor( ((currentElapsed % one_hour) % one_minute ) / one_second )}`;

  minutes = (minutes.length == 1) ? `0${minutes}` : minutes
  seconds = (seconds.length == 1) ? `0${seconds}` : seconds
  clockText.innerText = `${minutes}:${seconds}`;

  if (now >= finishCurrentDate) {

    if (times.length > 0) {
      endPeriodTimer();
    } else {
      endGlobalTimer();
      return;
    }
  }
  requestAnimationFrame(tick);
}

tick();
};

export { timeOfChrono };


