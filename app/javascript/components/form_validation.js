

const nameInputVal = () => {
  const nameInput = document.getElementById("event_name");
  const button = document.getElementById("buttonvalform");

  if (nameInput) {

    if (nameInput.value.length != 0) {
        button.className = "button";
        button.disabled = false;
    }

    nameInput.addEventListener('input', () => {
      if (nameInput.value.length == 0) {
        console.log("0 and disable")
        button.className = "button";
        button.disabled = true;
      } else {
        console.log("+ 0 and disabled = true")
        button.className = "buttonval";
        button.disabled = false;
      }
    });
  }
}

export { nameInputVal };
