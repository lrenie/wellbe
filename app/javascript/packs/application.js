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



import { connect } from 'twilio-video';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  timeOfChrono();
  updateTextInput();
  innitFlatPicker();
  addFriendsParticipants();


  if (document.querySelector(".chrono-area")) {
    const twilioToken = document.getElementById('local-media').dataset.twilioToken
    const roomName = document.getElementById('local-media').dataset.roomName
    connect(twilioToken, { name: roomName }).then(room => {

      console.log(`Successfully joined a Room: ${room}`);
      console.log(roomName)
      const { createLocalVideoTrack } = require('twilio-video');

        createLocalVideoTrack().then(track => {
          const localMediaContainer = document.getElementById('local-media');
          localMediaContainer.appendChild(track.attach());
        });

      const localParticipant = room.localParticipant;

      console.log(`Connected to the Room as LocalParticipant "${localParticipant.identity}"`);

      room.on('participantConnected', participant => {
        console.log(`A remote Participant connected: ${participant}`);
      });

      room.participants.forEach(participant => {
        participant.tracks.forEach(publication => {
          if (publication.track) {
            document.getElementById('remote-media-div').appendChild(publication.track.attach());
          }
        });

       participant.on('trackSubscribed', track => {
          document.getElementById('remote-media-div').appendChild(track.attach());
        });
      });

    },
      error => {
      console.error(`Unable to connect to Room: ${error.message}`);
    });
  }
});


