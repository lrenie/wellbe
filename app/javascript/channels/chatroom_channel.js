import consumer from "./consumer";
const initChatRoomCable = () => {
  const messageContainer = document.getElementById('messages');
  if (messageContainer) {
      const id = messageContainer.dataset.chatroomId;

      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id}, {
        received(data) {
          console.log(data);
          messageContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export {initChatRoomCable};
