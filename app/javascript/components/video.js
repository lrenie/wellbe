import { connect } from 'twilio-video';

const video = () => {
  const zoom_area = document.querySelector('.zoom-area');
  console.log(zoom_area);
  if (!zoom_area){
    return;
  }

  const twilioToken = document.getElementById('local-media').dataset.twilioToken;
  const roomName = document.getElementById('local-media').dataset.roomName;
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

export { video }
