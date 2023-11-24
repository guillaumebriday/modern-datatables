<template>
  <form @submit.prevent="$emit('update:modelValue', todo)">
    <div class="mt-6 grid grid-cols-1 row-gap-6 col-gap-4 sm:grid-cols-6">
      <div class="sm:col-span-3">
        <label
          class="block text-sm font-medium leading-5 text-gray-700"
          for="description"
        >
          Description
        </label>

        <div class="mt-1 rounded-md shadow-sm">
          <input
            id="description"
            v-model="todo.description"
            type="text"
            placeholder="Your description"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
            :class="{ 'border-red-300 text-red-900 placeholder-red-300 focus:border-red-300 focus:shadow-outline-red': error}"
          >
        </div>

        <p class="mt-2 text-sm text-red-600">
          {{ error }}
        </p>
      </div>
    </div>

    <div class="relative flex items-start mt-6">
      <div class="flex items-center h-5">
        <input
          id="completed"
          v-model="todo.completed"
          type="checkbox"
          class="rounded border-gray-300 text-emerald-600 shadow-sm focus:border-emerald-300 focus:ring focus:ring-offset-0 focus:ring-emerald-200 focus:ring-opacity-50"
        >
      </div>

      <div class="ml-3 text-sm leading-5">
        <label
          class="font-medium text-gray-700"
          for="completed"
        >
          Completed
        </label>
      </div>
    </div>

    <div class="mt-8 border-t border-gray-200 pt-5">
      <div class="flex justify-end">
        <span class="inline-flex rounded-md shadow-sm">
          <RouterLink
            :to="{ name: 'index-todo' }"
            class="py-2 px-4 border border-gray-300 rounded-md text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-emerald-300 focus:shadow-outline-emerald active:bg-gray-50 active:text-gray-800 transition duration-150 ease-in-out"
          >
            Back
          </RouterLink>
        </span>

        <span class="ml-3 inline-flex rounded-md shadow-sm">
          <button
            type="submit"
            class="inline-flex justify-center py-2 px-4 border border-transparent text-sm leading-5 font-medium rounded-md text-white bg-emerald-600 hover:bg-emerald-500 focus:outline-none focus:border-emerald-700 focus:shadow-outline-emerald active:bg-emerald-700 transition duration-150 ease-in-out"
          >
            Save
          </button>
        </span>
      </div>
    </div>
  </form>
</template>

<script setup>
import { defineProps, ref, watchEffect } from 'vue'

const props = defineProps({
  modelValue: {
    type: Object,
    default: () => ({})
  },

  error: {
    type: String,
    default: null
  }
})

const todo = ref({})

watchEffect(() => {
  todo.value = { ...props.modelValue }
})
</script>
