const friendsInvitation = () => {
  const invitChatroom = document.querySelectorAll('.card_invite_chatroom');
  
  invitChatroom.forEach( (invit) => {
    const invitButton = invit.querySelector('.btn-2');
    // console.log(invitButton);
  

    invitButton.addEventListener('click', (event) => {
      invitButton.value = 'invité !';
      invitButton.classList.add('btn-1');
    })
  } )
 

  


  

  // invitButtons.forEach( (button) => {
  //   button.addEventListener('click', console.log(button));
  // })
}
export { friendsInvitation }
