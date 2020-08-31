const flatpickr_event = () => {
  const dates = document.getElementById("start_date");

  if (dates) {
    console.log("flapicker here");
    var inputVal = document.getElementById("start_date").value;

    flatpickr("#start_date", {
      altInput: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  }
};

const flatpickr_user = () => {
  const dates_user = document.getElementById("start_date_user");

  if (dates_user) {
    console.log("flapicker here for uptimes");
    var inputVal = document.getElementById("start_date_user").value;

    flatpickr("#start_date_user", {
      altInput: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  }
};


export { flatpickr_event };
export { flatpickr_user };


