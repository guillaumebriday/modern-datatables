import { createApp } from 'vue'
import { store } from '@/store'
import { router } from '@/router'
import { createHead } from '@unhead/vue/client'
import App from '@/components/App.vue'

import './style.css'

const head = createHead()

const app = createApp(App, {
  performance: true
})

app
  .use(router)
  .use(store)
  .use(head)

app.mount('#app')
