import { Controller } from "@hotwired/stimulus"
import { ScrollTo } from '@stimulus-components/scroll-to'

const application = Application.start()
application.register('scroll-to', ScrollTo)

// Connects to data-controller="scrollto"
export default class extends Controller {
  connect() {
  }
}
