import { jsonFetch } from '@/utils/fetch'

const state = {
  todos: [],
  todo: {},
  links: {},
  endpoint: '/api/v1/todos'
}

const mutations = {
  setTodos (state, todos) {
    state.todos = todos
  },

  setTodo (state, todo) {
    state.todo = todo
  },

  updateTodo (state, todo) {
    const todoId = todo.id
    state.todos.splice(state.todos.findIndex(todo => todo.id === todoId), 1, todo)
  },

  setLinks (state, links) {
    state.links = links
  }
}

const getters = {
  allTodos (state) {
    return state.todos
  },

  todo (state) {
    return state.todo
  },

  links (state) {
    return state.links
  }
}

const actions = {
  fetchTodos ({ commit }, params = {}) {
    return jsonFetch(state.endpoint, { params })
      .then(data => {
        commit('setTodos', data.data)
        commit('setLinks', data.links)

        return data.data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  fetchTodo ({ commit }, { id }) {
    return jsonFetch(`${state.endpoint}/${id}`)
      .then(data => {
        commit('setTodo', data.data)

        return data.data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  addTodo (_, { params }) {
    return jsonFetch(state.endpoint, {
      method: 'POST',
      body: { todo: params }
    })
      .then(data => {
        return data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  updateTodo ({ commit }, { id, params }) {
    return jsonFetch(`${state.endpoint}/${id}`, {
      method: 'PATCH',
      body: { todo: params }
    })
      .then(data => {
        commit('updateTodo', data.data)
        return data.data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  }
}

export default {
  state,
  mutations,
  getters,
  actions
}
