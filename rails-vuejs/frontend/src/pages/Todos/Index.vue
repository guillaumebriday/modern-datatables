<template>
  <div>
    <div class="bg-white">
      <div class="max-w-screen-xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="mt-1 text-4xl leading-10 font-extrabold text-gray-900 sm:text-5xl sm:leading-none sm:tracking-tight lg:text-6xl">
            Modern Datatables
          </h1>

          <p class="max-w-xl mt-5 mx-auto text-xl leading-7 text-gray-500">
            This demo is build with

            <a
              href="https://vuejs.org/"
              class="underline hover:text-gray-900"
            >
              Vue.js
            </a>

            and

            <a
              href="https://rubyonrails.org/"
              class="underline hover:text-gray-900"
            >
              Rails
            </a>
            .
          </p>

          <p class="max-w-xl mt-5 mx-auto text-xl leading-7 text-gray-500">
            Why this project?
            Find out more on

            <a
              href="https://github.com/guillaumebriday/modern-datatables"
              class="underline hover:text-gray-900"
            >
              Github
            </a>
            .
          </p>
        </div>
      </div>
    </div>

    <div class="pb-5 space-y-3 sm:flex sm:items-center sm:justify-between sm:space-x-4 sm:space-y-0">
      <h3 class="text-lg leading-6 font-medium text-gray-900">
        Todos
      </h3>

      <div class="flex space-x-3">
        <span class="shadow-sm rounded-md">
          <RouterLink
            :to="{ name: 'new-todo' }"
            class="inline-flex items-center px-4 py-2 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-green-600 hover:bg-green-500 focus:outline-none focus:shadow-outline-green focus:border-green-700 active:bg-green-700 transition duration-150 ease-in-out"
          >
            Create todo
          </RouterLink>
        </span>
      </div>
    </div>

    <TodosSearch />

    <TodosList
      v-if="todos.length"
      :todos="todos"
      :links="links"
    />
    <TodosEmpty v-else />
  </div>
</template>

<script setup>
import { useStore } from 'vuex'
import { useRoute } from 'vue-router'
import TodosList from '@/components/Todos/List.vue'
import TodosEmpty from '@/components/Todos/Empty.vue'
import TodosSearch from '@/components/Todos/Search.vue'
import { computed, onMounted } from 'vue'
import { useHead } from '@unhead/vue'

useHead({
  title: 'Todos'
})

const route = useRoute()
const store = useStore()

const todos = computed(() => store.getters.allTodos)
const links = computed(() => store.getters.links)

onMounted(() => {
  store.dispatch('fetchTodos', { page: route.query.page || 1 })
})
</script>
