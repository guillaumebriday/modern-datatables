import { Application } from '@hotwired/stimulus'
import { registerControllers } from 'stimulus-vite-helpers'

import Timeago from "stimulus-timeago"
import Autosave from 'stimulus-rails-autosave'

const application = Application.start()

const controllers = import.meta.glob('./**/*_controller.js', { eager: true })
registerControllers(application, controllers)

application.register("timeago", Timeago)
application.register("autosave", Autosave)
