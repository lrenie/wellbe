const askingFriend = () => {
  const friend = document.querySelector(".user-list-index")
  if (!friend) {
    return
  }
  const weAreFriends = document.querySelectorAll('.we-are-friend');
  if(!weAreFriends) {
  const cardAmi = document.querySelector(".card-amis")
  const boutonAmi = document.querySelector(".ask-friend")
  boutonAmi.addEventListener('click', (event) => {
    console.log(cardAmi);
    console.log(cardAmi.dataset.recipientuser);
    console.log(cardAmi.dataset.senderuser);
  })
  console.log('tadamm')
  }
}

export { askingFriend }
