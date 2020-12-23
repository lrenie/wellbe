// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "input", "levelBtn", "bodyBtn", "sessionForm" ]

  connect() {
  }

  inputSelect(event) {
    
    this.inputTarget.selectedIndex = parseInt(event.currentTarget.dataset.id);
    this.levelBtnTargets.forEach((el) => {
      el.classList.remove('level-selected');
    })
    event.currentTarget.classList.add('level-selected')
    console.log(this.inputTarget.selectedIndex);
  }

  inputSelecte(event) {
    this.inputTarget.selectedIndex = parseInt(event.currentTarget.dataset.id);
    this.bodyBtnTargets.forEach((el) => {
      el.classList.remove('body-selected');
    })
    event.currentTarget.classList.add('body-selected')
    console.log(this.inputTarget.value);
  }
}
