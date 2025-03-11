import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: Array
  }
  connect() {
    this.initializeFlatpickr();
    console.log("Hello from flatpickr");
  }

  initializeFlatpickr() {
    const newBookingForm = document.getElementById("new_pet_booking");
    const dates = this.datesValue.map(date => ({
      from: date[0],
      to: date[1]
    }))
    if (newBookingForm) {
      flatpickr(this.element, {
        minDate: "today",
        altInput: true,
        dateFormat: "Y-m-d",
        disable: dates,
      });
    } else {
        flatpickr(this.element, {
          minDate: "today",
          altInput: true,
          dateFormat: "Y-m-d",
          disable: dates
        });
    }
  }
}
