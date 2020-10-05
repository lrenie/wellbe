import consumer from "./consumer";

const initChatRoomCable = () => {
  const messageContainer = document.getElementById('messages');
  if (messageContainer) {
      const id = messageContainer.dataset.chatroomId;
      console.log(id);

      consumer.subscriptions.create({ channel: "ChatRoomChannel", id: id}, {
        received(data) {
          console.log(data);
          messageContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export {initChatRoomCable};