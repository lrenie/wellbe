const updateTextInput = () => {
  const input = document.querySelector(".custom-range");
  const text = document.getElementById('textInput');
  input.addEventListener("change", (event) => {
    text.value = input.value;
  })
}

export { updateTextInput };
