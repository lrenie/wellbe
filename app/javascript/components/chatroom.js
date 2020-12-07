const showNewChatRoom = () => {
  const chatroomContainer = document.querySelector('.chat-room-container');
  if (chatroomContainer) {
    const modale = document.querySelector(".bg-gris");
    const btnNewChatroom = document.querySelector(".btn-1");
    const btnCancelNew = document.getElementById("cancel-button");

    const hideElement = (element) => {
      element.classList.add("d-none");
    }
    const showElement = (element) => {
      element.classList.remove("d-none");
    }

    hideElement(modale);

    btnNewChatroom.addEventListener("click", (event) => {
      showElement(modale);
    })
  }
};

const showAddFriends = () => {
  
  const containerChatroom = document.getElementById('messages-container')
  if(containerChatroom) {
    const modale = document.querySelector('.bg-gris-small');
    const buttonAddFriends = document.getElementById('add-friends-to-chatroom');
    
    
    const hideElement = (element) => {
      element.classList.add("d-none");
    }
    const showElement = (element) => {
      element.classList.remove("d-none");
    }
    
    hideElement(modale);

    buttonAddFriends.addEventListener("click", (event) => {
      showElement(modale);
    })
  }
}

export { showNewChatRoom };
export { showAddFriends };

