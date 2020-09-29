const addFriendsParticipants = () => {
  const invitation_cards = document.querySelectorAll(".card_invite_session");
  // console.log(invitation_cards)
  invitation_cards.forEach((invitation_card) => {
    const btn_partcip = invitation_card.querySelector(".invitation-btn")
    const user_avatar = invitation_card.querySelector(".invitation-avatar")
    // console.log(user_avatar)
    const user_avatar_url = user_avatar.getAttribute("src")
    // console.log(user_avatar_url)

    btn_partcip.addEventListener("click", (event) => {
      console.log(event)
      if (btn_partcip.classList.contains('btn-invite')) {
        console.log("hohoho c'est le if part")
        btn_partcip.innerHTML = "Inviter";
        btn_partcip.classList.remove('btn-invite')

        const firstAvaiableSlot = document.querySelector(".participations .photo-invite");

        firstAvaiableSlot.classList.add("slot-available")
        firstAvaiableSlot.classList.remove('photo-invite')
        // invitation_cards.classList.add('card-invite')
        firstAvaiableSlot.style = ""
        firstAvaiableSlot.classList.add('border-bleu');
        firstAvaiableSlot.innerHTML = "<div class='aboslute'><i class='fas fa-user-plus'></i></div>";

      } else {
        console.log('hahahah')
        console.log(btn_partcip.dataset.id)
        btn_partcip.innerHTML = "Invité";
        btn_partcip.classList.add('btn-invite')


        const firstAvaiableSlot = document.querySelector(".participations .slot-available");

        firstAvaiableSlot.classList.remove("slot-available")
        firstAvaiableSlot.classList.add('photo-invite')
        // invitation_cards.classList.add('card-invite')
        firstAvaiableSlot.style = `background-image: url('${user_avatar_url}')`
        firstAvaiableSlot.classList.remove('border-bleu');
        firstAvaiableSlot.innerHTML = "";
      }
    });
  });
}

export { addFriendsParticipants };
