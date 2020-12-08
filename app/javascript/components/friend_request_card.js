const friendRequestCardUpdate = (content) => {
  const divInsert = document.getElementById('my-friends');
  const noInvit = document.querySelector('#no-invit');

  if (!divInsert) return;

  divInsert.insertAdjacentHTML('beforeend', content);
  if (noInvit) {
    noInvit.style.display = 'none';
  }
}

export { friendRequestCardUpdate }
