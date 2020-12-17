import Rails from "@rails/ujs";

const chargeImageCover = () => {
  const btnToChargeCoverFile = document.querySelector('#charge-cover-file');
  btnToChargeCoverFile.click();
}

const changeCover = () => {
  const btnChangeCover = document.querySelector('#change-cover');
  const form = document.querySelector('#form');

  if (!btnChangeCover) return;

  btnChangeCover.addEventListener('click', chargeImageCover);
  btnChangeCover.addEventListener('change', () => {
    Rails.fire(form, "submit");
  })
}



export { changeCover }
