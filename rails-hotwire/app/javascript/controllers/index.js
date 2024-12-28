import { Application } from '@hotwired/stimulus'
import Timeago from "@stimulus-components/timeago"
import AutoSubmit from '@stimulus-components/auto-submit'

const application = Application.start()

application.register("timeago", Timeago)
application.register("auto-submit", AutoSubmit)
