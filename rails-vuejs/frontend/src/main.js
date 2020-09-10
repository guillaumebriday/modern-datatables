import axios from 'axios'
import Vue from 'vue'
import VueMeta from 'vue-meta'
import store from '@/store'
import router from '@/router'
import App from '@/components/App'

Vue.use(VueMeta)

Vue.config.productionTip = false

axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
axios.defaults.baseURL = '/api/v1/'

new Vue({
  store,
  router,
  render: h => h(App),
}).$mount('#app')
