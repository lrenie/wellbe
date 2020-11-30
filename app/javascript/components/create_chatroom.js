const friendsInvitation = () => {

  const invitButtons = document.querySelectorAll(".btn-2");
  // console.log(invitButtons);

  // for ( var index = 0 ; index < invitButtons.length ; index++) {
  //   invitButtons[index].addEventListener("click", () => {
  //     console.log(invitButtons[index]);
  //   })
  // }

  invitButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
      console.log(event.currentTarget.dataset.id);
    })

  })


}

export { friendsInvitation };
