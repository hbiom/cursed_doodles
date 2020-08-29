


const nameuserInputVal = () => {
  const username = document.getElementById("user_name");
  const button = document.getElementById("buttonvalformuser");

  if (username) {

    if (username.value.length != 0) {
        button.className = "button";
        button.disabled = false;
    }

    username.addEventListener('input', () => {
      if (username.value.length == 0) {
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

export { nameuserInputVal };
