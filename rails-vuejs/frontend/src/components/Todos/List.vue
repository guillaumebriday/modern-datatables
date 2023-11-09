<template lang="pug">
div
  div(class="flex flex-col")
    div(class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8")
      div(class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8")
        div(class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg")
          table(class="min-w-full divide-y divide-gray-200")
            thead
              tr
                th(class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider") Description

                th(class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider") Completed?
                th(class="px-6 py-3 bg-gray-50")
            tbody
              tr(v-for="(todo, index) in todos" :key="todo.id" :class="[index % 2 ? 'bg-white' : 'bg-gray-50']")
                td(class="px-6 py-4 whitespace-no-wrap text-sm leading-5 font-medium text-gray-900")
                  | {{ todo.attributes.description }}

                td(class="px-6 py-4 whitespace-no-wrap text-sm leading-5 text-gray-500")
                  span(@click.prevent="toggleCompleted(todo)" class="cursor-pointer inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium leading-4" :class="[todo.attributes.completed ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800']")
                    | {{ todo.attributes.completed }}

                td(class="px-6 py-4 whitespace-no-wrap text-right text-sm leading-5 font-medium")
                  router-link(:to="{ name: 'edit-todo', params: { id: todo.id } }" class="text-blue-600 hover:text-blue-900") Edit

  pagination(:links="links" v-model="page")
</template>

<script>
import Pagination from '@/components/Shared/Pagination'

export default {
  components: {
    Pagination
  },

  props: {
    links: {
      type: Object,
      required: true
    },

    todos: {
      type: Array,
      default: () => []
    }
  },

  data () {
    return {
      page: 1
    }
  },

  watch: {
    page (page) {
      this.$store.dispatch('fetchTodos', { page })
    }
  },

  methods: {
    async toggleCompleted (todo) {
      await this.$store.dispatch('updateTodo', { id: todo.id, params: { completed: !todo.attributes.completed} })
    }
  },
}
</script>
