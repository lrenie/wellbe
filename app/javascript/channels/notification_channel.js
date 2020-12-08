import consumer from "./consumer"
import { redCounterNotification } from "../components/counter_notification"
import { friendRequestCardUpdate } from "../components/friend_request_card"
import { listNotifUpdate } from "../components/list_notif"

// Client-side subscription
// A consumer becomes a subscriber by creating a subscription to a given channel:
// ici un on prend un abonnement au channel Notification

const initNotificationCable = () => {
  consumer.subscriptions.create({ channel: "NotificationChannel"},{
    connected() {
    },

    received(data) {
      if (data.friendRequestCard) {
        friendRequestCardUpdate(data.friendRequestCard);
      }

      if (data.notifications) {
        if (data.notifications.friendship) {
          listNotifUpdate(data.notifications.friendship);
        }
        redCounterNotification(data.notifications.count);
      }
    }
  });

}

export { initNotificationCable };
