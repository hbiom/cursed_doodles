



const flatpickr_event = () => {
  const dates = document.getElementById("start_date");

  if (dates) {
    console.log("flapicker here");

    flatpickr("#start_date", {
      altInput: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      conjunction: " :: ",
      minDate: "today"
    });
  }
}

export { flatpickr_event };
