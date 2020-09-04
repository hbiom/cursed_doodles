

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



const eventInputVal = () => {
  const dateEvent = document.getElementById("start_date");
  const button = document.getElementById("buttonvalform");

  if (dateEvent) {
    console.log("rekngerngpengomenrgengonrtpn");

    if (dateEvent.value.length == 0) {
        button.className = "button";
        button.disabled = true;
    }

    dateEvent.addEventListener('input', () => {
      if (dateEvent.value.length == 0) {
        console.log(dateEvent.value.length);
        console.log("0 and disable");
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

export { eventInputVal };


// const empty = () => {
//     var x;
//     x = document.getElementById("start_date").value;
//     if (x == "") {
//         alert("Enter a Valid Roll Number");
//         return false;
//     };
//   }

// export { empty };
