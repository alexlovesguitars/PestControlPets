import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = ["scrollElement"]  // Target the element you want to scroll to

  connect() {
    console.log("ScrollTo controller connected");
  }

  // This method will be called when the action is triggered
  scroll(event) {
    event.preventDefault();  // Prevent default action (such as link navigation)

    // Scroll to the element smoothly
    if (element) {
      element.scrollIntoView({ behavior: "smooth" });
    }
  }
}
