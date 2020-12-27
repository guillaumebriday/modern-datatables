import axios from 'axios'

const state = {
  todos: [],
  todo: {},
  links: {},
  endpoint: '/todos/'
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
    return axios.get(state.endpoint, { params })
      .then(({ data }) => {
        commit('setTodos', data.data)
        commit('setLinks', data.links)

        return data.data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  fetchTodo ({ commit }, { id }) {
    return axios.get(state.endpoint + id)
      .then(({ data }) => {
        commit('setTodo', data.data)

        return data.data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  addTodo (_, { params }) {
    return axios.post(state.endpoint, { todo: params })
      .then(({ data }) => {
        return data
      })
      .catch(error => {
        return Promise.reject(error)
      })
  },

  updateTodo ({ commit }, { id, params }) {
    return axios.patch(state.endpoint + id, { todo: params })
      .then(({ data }) => {
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
