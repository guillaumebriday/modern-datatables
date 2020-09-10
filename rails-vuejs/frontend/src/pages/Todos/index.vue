<template lang="pug">
div
  div(class="pb-5 space-y-3 sm:flex sm:items-center sm:justify-between sm:space-x-4 sm:space-y-0")
    h3(class="text-lg leading-6 font-medium text-gray-900") Todos

    div(class="flex space-x-3")
      span(class="shadow-sm rounded-md")
        router-link(:to="{ name: 'new-todo' }" class="inline-flex items-center px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:shadow-outline-indigo focus:border-indigo-700 active:bg-indigo-700 transition duration-150 ease-in-out")
          | Create todo

  todos-search

  todos-list(v-if="todos.length" :todos="todos" :links="links")
  todos-empty(v-else)
</template>

<script>
import { mapGetters } from 'vuex'
import TodosList from '@/components/Todos/List'
import TodosEmpty from '@/components/Todos/Empty'
import TodosSearch from '@/components/Todos/Search'

export default {
  components: {
    TodosList,
    TodosEmpty,
    TodosSearch
  },

  metaInfo: {
    title: 'Todos'
  },

  computed: {
    ...mapGetters({
      todos: 'allTodos',
      links: 'links',
    })
  },

  created () {
    this.$store.dispatch('fetchTodos', { page: this.$route.query.page || 1 })
  }
}
</script>
