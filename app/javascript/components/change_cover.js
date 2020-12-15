const btnChangeCover = document.querySelector('#change-cover');
const coverForm = document.querySelector('#cover-form');
const cover = document.querySelector('#cover')
const form = document.querySelector('#form')

const updateCover = () => {
  console.log('toto')
  coverForm.classList.remove('hide-form');
}


const changeCover = () => {

  if (!btnChangeCover) return;

  btnChangeCover.addEventListener('click', updateCover);
  btnChangeCover.addEventListener('change', (e) => {
    console.log(form);
    console.log(cover.value);
    form.submit();
    coverForm.classList.add('hide-form');
  })
}



export { changeCover }
