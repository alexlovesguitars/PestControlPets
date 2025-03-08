import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import { Application } from '@hotwired/stimulus'
import ScrollTo from '@stimulus-components/scroll-to'

const application = Application.start()
application.register('scroll-to', ScrollTo)
