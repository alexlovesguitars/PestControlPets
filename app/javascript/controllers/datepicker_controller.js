import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    this.initializeFlatpickr();
    console.log("Hello from flatpickr");
  }

  initializeFlatpickr() {
    const newBookingForm = document.getElementById("new_booking");
    if (newBookingForm) {
      flatpickr(this.element, {
        minDate: "today",
        altInput: true,
        dateFormat: "Y-m-d",
        disable: JSON.parse(newBookingForm.dataset.unavailableDates),
      });
    } else {
        flatpickr(this.element, {
          minDate: "today",
          altInput: true,
          dateFormat: "Y-m-d",
        });
    }
  }
}
