

const nameInputVal = () => {
  const nameInput = document.getElementById("event_name");
  const button = document.getElementById("buttonvalform");

  if (nameInput) {
    nameInput.addEventListener('input', () => {
      if (nameInput.value.length == 0) {
        button.className = "button";
        button.disabled = true;
      } else {
        button.className = "buttonval";
        button.disabled = false;
      }
    });
  }
}


const nameuserInputVal = () => {
  const username = document.getElementById("user_name");
  const button = document.getElementById("buttonvalformuser");
  if (username) {
    username.addEventListener('input', () => {
      if (username.value.length == 0) {
        button.className = "button";
        button.disabled = true;
      } else {
        button.className = "buttonval";
        button.disabled = false;
      }
    });
  }
}


const eventInputVal = () => {
  const dateEvent = document.getElementById("start_date");
  const button = document.getElementById("buttonvalform");

  if (dateEvent) {
    dateEvent.addEventListener('input', () => {
      if (dateEvent.value.length == 0) {
        button.className = "button";
        button.disabled = true;
      } else {
        button.className = "buttonval";
        button.disabled = false;
      }
    });
  }
}

export { nameInputVal, nameuserInputVal, eventInputVal };
