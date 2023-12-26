import Autosave from 'stimulus-rails-autosave'
import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)


application.register('autosave', Autosave)
