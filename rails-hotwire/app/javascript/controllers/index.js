import { Application } from '@hotwired/stimulus'
import Timeago from "stimulus-timeago"
import Autosave from 'stimulus-rails-autosave'

const application = Application.start()

application.register("timeago", Timeago)
application.register("autosave", Autosave)
