import consumer from "./consumer"


// Client-side subscription
// A consumer becomes a subscriber by creating a subscription to a given channel:
// ici un on prend un abonnement au channel Notification

const initNotificationCable = () => {

  const tabContainer = document.querySelector('#myTabContent');
  if (tabContainer){
  console.log('on essaye hein #2 ?!');
    consumer.subscriptions.create({ channel: "NotificationChannel" },{
      connected(){
        console.log('LE USER EST BIEN CONNECTE ')
      },
      received(data) {
        console.log('on essaye dur #3 ?!');
        console.log(data);
      }

    });
  }
}

export { initNotificationCable };
