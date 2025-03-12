import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    dates: Array,
  };

  connect() {
    console.log("Dates Value:", this.datesValue); // Add this line
    flatpickr(this.element, {
      minDate: "today",
      altInput: true,
      dateFormat: "Y-m-d",
      disable: this.datesValue,
    });
  }
}
