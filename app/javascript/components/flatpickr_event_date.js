



const flatpickr_event = () => {
  const dates = document.getElementById("start_date");

  if (dates) {
    console.log("flapicker here");
    var inputVal = document.getElementById("start_date").value;

    const fp = flatpickr("#start_date", {
      altInput: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      minDate: "today",

      // onChange: function(dates_event) {
      //   var event_dates = []
      //   if (dates_event) {
      //     event_dates.push(dates);
      //   }
      //   event_dates
      // }

      // onChange: function (selectedDates, dateStr, instance) {
      //   dates.submit();
      // }

    });
    fp.selectedDates
  }
}

















export { flatpickr_event };


