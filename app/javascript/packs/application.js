// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { timeOfChrono } from '../components/chrono';
import { updateTextInput } from '../components/range';
import { addFriendsParticipants } from '../components/participations';
import "controllers"
import { innitFlatPicker } from '../plugins/flatpickr';

import { video } from '../components/video';
import { initChatRoomCable } from '../channels/chatroom_channel';
import { askingFriend } from 'components/ask_friend';
import { showNewChatRoom } from "../components/chatroom";




// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  updateTextInput();
  innitFlatPicker();
  video();
  addFriendsParticipants();
  initChatRoomCable();
  
  if (document.querySelector('#go')){
    document.querySelector('#go').addEventListener('click', e => {
      document.querySelector('#init').classList.remove('d-none')
      e.currentTarget.style.opacity = "0";
      timeOfChrono();
    })
  }
  askingFriend();
  showNewChatRoom();
});


