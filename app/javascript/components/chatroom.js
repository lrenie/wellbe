const showNewChatRoom = () => {
  const chatroomContainer = document.querySelector('.chat-room-container');
  if (chatroomContainer) {
    const modale = document.querySelector(".bg-gris");
    const btn_new_chatroom = document.querySelector(".btn-1");
    const btn_cancel_new = document.getElementById("cancel-button");

    const hideElement = (element) => {
      element.classList.add("d-none");
    }
    const showElement = (element) => {
      element.classList.remove("d-none");
    }
    hideElement(modale);
    btn_new_chatroom.addEventListener("click", (event) => {
      showElement(modale);
    })
    btn_cancel_new.addEventListener("click", (event) => {
      hideElement(modale);
    })

  }
};

const sendMessage = () => {
  const submit = document.getElementById("send");

submit.addEventListener("keydown", )
}

export { showNewChatRoom };

