import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "hidableElement"]

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.hidableElementTarget.classList.toggle("d-none");
  }
}
