const addFriendsParticipants = () => {
  const invitation_cards = document.querySelectorAll(".card_invite_session");
  
  invitation_cards.forEach((invitation_card) => {
    const btn_partcip = invitation_card.querySelector(".invitation-btn")
    const user_avatar = invitation_card.querySelector(".invitation-avatar")
    const user_avatar_url = user_avatar.getAttribute("src")
    

    btn_partcip.addEventListener("click", (event) => {
      
      if (btn_partcip.classList.contains('btn-invite')) {
        
        btn_partcip.innerHTML = "Inviter";
        btn_partcip.classList.remove('btn-invite')

        const firstAvaiableSlot = document.querySelector(".participations .photo-invite");

        firstAvaiableSlot.classList.add("slot-available")
        firstAvaiableSlot.classList.remove('photo-invite')
        firstAvaiableSlot.style = ""
        firstAvaiableSlot.classList.add('border-bleu');
        firstAvaiableSlot.innerHTML = "<div class='aboslute'><i class='fas fa-user-plus'></i></div>";

      } else {
        
        
        btn_partcip.innerHTML = "Invité";
        btn_partcip.classList.add('btn-invite')


        const firstAvaiableSlot = document.querySelector(".participations .slot-available");

        firstAvaiableSlot.classList.remove("slot-available")
        firstAvaiableSlot.classList.add('photo-invite')
        firstAvaiableSlot.style = `background-image: url('${user_avatar_url}')`
        firstAvaiableSlot.classList.remove('border-bleu');
        firstAvaiableSlot.innerHTML = "";
      }
    });
  });
}

export { addFriendsParticipants };
