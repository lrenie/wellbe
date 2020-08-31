// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]

  connect() {
  
  }

  show(event) {
   const user = window.location.pathname.split("/")[2];
   const date = event.currentTarget.dateObj;
   const dateStyle = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
   const url = `${window.location.origin}/sessions/fetch?user=${user}&date=${dateStyle}`;

   fetch(url)
   .then(response => response.json())
   .then((data) => {
      this.display(data);
   });
  }

  display(data) {
    this.cardTarget.innerHTML = data.html;
  }
}
