import { createStore } from 'vuex'
import todos from '@/store/modules/todos'

export const store = createStore({
  modules: {
    todos
  }
})
