<template lang="pug">
form(@submit.prevent="$emit('input', {...todo})")
  div(class="mt-6 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6")
    div(class="sm:col-span-3")
      label(class="block text-sm font-medium leading-5 text-gray-700" for="description") Description

      div(class="mt-1 rounded-md shadow-sm")
        input(v-model="todo.description" type="text" id="description" placeholder="Your description" class="form-input block w-full transition duration-150 ease-in-out sm:text-sm sm:leading-5" :class="{ 'border-red-300 text-red-900 placeholder-red-300 focus:border-red-300 focus:shadow-outline-red': error}")

      p(class="mt-2 text-sm text-red-600") {{ error }}

  div(class="relative flex items-start mt-6")
    div(class="flex items-center h-5")
      input(v-model="todo.completed" type="checkbox" id="completed" class="form-checkbox h-4 w-4 text-blue-600 transition duration-150 ease-in-out")

    div(class="ml-3 text-sm leading-5")
      label(class="font-medium text-gray-700" for="completed") Completed

  div(class="mt-8 border-t border-gray-200 pt-5")
    div(class="flex justify-end")
      span(class="inline-flex rounded-md shadow-sm")
        router-link(:to="{ name: 'index-todo' }" class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out")
          | Back

      span(class="ml-3 inline-flex rounded-md shadow-sm")
        button(type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-blue-600 hover:bg-blue-500 focus:outline-none focus:border-blue-700 focus:shadow-outline-blue active:bg-blue-700 transition duration-150 ease-in-out")
          | Save
</template>

<script>
export default {
  props: {
    value: {
      type: Object,
      default: () => ({})
    },

    error: {
      type: String,
      default: null
    }
  },

  data () {
    return {
      todo: {}
    }
  },

  watch: {
    value () {
      this.todo = {...this.value}
    }
  }
}
</script>
