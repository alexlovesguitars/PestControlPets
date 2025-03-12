import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "results", "input"]

  search() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    fetch(url, {
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then(html => {
        const parser = new DOMParser()
        const doc = parser.parseFromString(html, "text/html")
        const results = doc.querySelector("#results")
        this.resultsTarget.innerHTML = results.innerHTML
      })
  }
}
