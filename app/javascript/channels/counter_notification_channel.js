import consumer from "./consumer"

const redCounterNotification = () => {
  // consumer.subscriptions.create({ channel: 'CounterNotificationChannel'}, {
  //   connected(){
  //     console.log('LE USER EST BIEN CONNECTE AU CHANNEL COUNTERnOTIFICATION ')
  //   },
  //   received(data) {
  //     console.log(data);
  //     const counter = document.querySelector('#counter');
  //     counter.textContent = `${data}`
  //   }
  // });
}

export { redCounterNotification };
