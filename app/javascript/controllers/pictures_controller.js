import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "avatarImg", "avatarChargeBtn", "avatarForm", "avatarUser", "bobo" ]

  connect() {
  }

  choosePicture() {
    this.avatarChargeBtnTarget.click();
  }

  submitForm() {
    Rails.fire(this.avatarFormTarget, "submit");
    // commande servant à submit un form en js
    // plus de doc sur https://discuss.rubyonrails.org/t/rails-ujs-documentation/74518/2
    // https://guides.rubyonrails.org/working_with_javascript_in_rails.html#rails-ujs-event-handlers
  }

  majAvatar(e){
    const navAvatar = document.querySelector('#nav-avatar');
    console.log(navAvatar);
    // l'envent en question est ajax:succes cf users/show ligne 35
    console.log(e)
    this.avatarUserTarget.src = e.detail[0].urlImg;
  }

}
