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
    const { createLocalVideoTrack } = require('twilio-video');
    createLocalVideoTrack().then(track => {
      const localMediaContainer = document.getElementById('local-media');
      localMediaContainer.appendChild(track.attach());
    });

    // const localParticipant = room.localParticipant;

    room.on('participantConnected', participant => {
      participant.tracks.forEach(publication => {
        if (publication.track) {
          document.getElementById('remote-media-div').appendChild(publication.track.attach());
        }
      });
      participant.on('trackSubscribed', track => {
        document.getElementById('remote-media-div').appendChild(track.attach());
      });
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
    room.on('disconnected', room => {
      // Detach the local media elements
      room.localParticipant.tracks.forEach(publication => {
        const attachedElements = publication.track.detach();
        attachedElements.forEach(element => element.remove());
      });
    });
  },
    error => {
    console.error(`Unable to connect to Room: ${error.message}`);
  });

}

export { video }
