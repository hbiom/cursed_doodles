


import flatpickr from 'flatpickr'

import 'flatpickr/dist/themes/dark.css'
import rangePlugin from "flatpickr/dist/components/rangePlugin"

flatpickr("#start_date", {
  minDate: "today",
  altInput: true
});
