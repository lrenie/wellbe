const listNotifUpdate = (content) => {
  const listNotif = document.querySelector('.dropdown-belt');

  listNotif.insertAdjacentHTML('beforeend', content);
}

export { listNotifUpdate }
