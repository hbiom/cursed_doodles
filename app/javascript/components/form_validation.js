

const nameInputVal = () => {
  const nameInput = document.getElementById("event_name");
  const button = document.getElementById("buttonvalform");

  if (nameInput) {

    if (nameInput.value.length == 0) {
        button.className = "button";
        button.disabled = true;
    } else {
        button.className = "buttonval";
        button.disabled = false;
    }

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
        button.className = "button";
        button.disabled = true;
      } else {
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

    if (dateEvent.value == "") {
        button.className = "button";
        button.disabled = true;
     } else {
        button.className = "buttonval";
        button.disabled = false;
    }


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

export { eventInputVal };



// if($('#text_field').val() ==  "")
//    $('#submitButtonId').attr('disabled', true);

// $('#text_field').keyup(function(){
//     if($('#text_field').val() !=  "")
//          $('#submitButtonId').attr('disabled', false);
//     else
//          $('#submitButtonId').attr('disabled', true);
// });
