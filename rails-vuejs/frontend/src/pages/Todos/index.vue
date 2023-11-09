<template lang="pug">
div
  div(class="bg-white")
    div(class="max-w-screen-xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8")
      div(class="text-center")
        h1(class="mt-1 text-4xl leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none sm:tracking-tight lg:text-6xl") Modern Datatables
        p(class="max-w-xl mt-5 mx-auto text-xl leading-7 text-gray-500")
          | This demo is build with
          a(href="https://vuejs.org/" class="underline hover:text-gray-900")  Vue.js
          |  and
          a(href="https://rubyonrails.org/" class="underline hover:text-gray-900")  Rails
          | .

        p(class="max-w-xl mt-5 mx-auto text-xl leading-7 text-gray-500")
          | Why this project?
          | Find out more on
          a(href="https://github.com/guillaumebriday/modern-datatables" class="underline hover:text-gray-900")  Github
          | .

  div(class="pb-5 space-y-3 sm:flex sm:items-center sm:justify-between sm:space-x-4 sm:space-y-0")
    h3(class="text-lg leading-6 font-medium text-gray-900") Todos

    div(class="flex space-x-3")
      span(class="shadow-sm rounded-md")
        router-link(:to="{ name: 'new-todo' }" class="inline-flex items-center px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-700 active:bg-blue-700 transition duration-150 ease-in-out")
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
