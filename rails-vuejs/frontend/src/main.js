import axios from 'axios'
import { createApp } from 'vue'
import { store } from '@/store'
import { router } from '@/router'
import { createHead } from '@unhead/vue'
import App from '@/components/App.vue'

const head = createHead()

axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
axios.defaults.baseURL = '/api/v1/'

const app = createApp(App, {
  performance: true
})

app
  .use(router)
  .use(store)
  .use(head)

app.mount('#app')
