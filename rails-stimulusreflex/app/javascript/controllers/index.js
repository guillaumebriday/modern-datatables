// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'

const application = Application.start()
StimulusReflex.initialize(application, { consumer })
