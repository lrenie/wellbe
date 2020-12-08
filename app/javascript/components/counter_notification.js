const redCounterNotification = (count) => {
  const pastilleRed = document.querySelector('.red-notif');
  if (count >= 1) {
    pastilleRed.classList.remove('d-none');
    pastilleRed.innerText = count;
  }

}

export { redCounterNotification };
