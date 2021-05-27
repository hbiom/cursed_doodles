// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("channels")


import '../components/flatpickr_event_date'
import "@fortawesome/fontawesome-free/js/all";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import { nameInputVal } from '../components/form_validation';
import { nameuserInputVal } from '../components/form_validation';
import { eventInputVal } from '../components/form_validation';

import { flatpickr_event } from '../components/flatpickr_event_date';
import { flatpickr_user } from '../components/flatpickr_event_date';

import { scrollAnimation } from '../components/scrollAnimation';

import { scrollAnimateValue } from '../components/animateKpi';


document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  nameInputVal();
  nameuserInputVal();
  eventInputVal();
  flatpickr_event();
  flatpickr_user();
  scrollAnimation();
  scrollAnimateValue();
});
