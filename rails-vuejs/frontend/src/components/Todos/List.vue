<template>
  <div>
    <div class="flex flex-col">
      <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table class="min-w-full divide-y divide-gray-200">
              <thead>
                <tr>
                  <th class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                    Description
                  </th>
                  <th class="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                    Completed?
                  </th>
                  <th class="px-6 py-3 bg-gray-50" />
                </tr>
              </thead>

              <tbody>
                <tr
                  v-for="(todo, index) in todos"
                  :key="todo.id"
                  :class="[index % 2 ? 'bg-white' : 'bg-gray-50']"
                >
                  <td class="px-6 py-4 whitespace-no-wrap text-sm leading-5 font-medium text-gray-900">
                    {{ todo.attributes.description }}
                  </td>

                  <td class="px-6 py-4 whitespace-no-wrap text-sm leading-5 text-gray-500">
                    <span
                      class="cursor-pointer inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium leading-4"
                      :class="[todo.attributes.completed ? 'bg-emerald-100 text-emerald-800' : 'bg-red-100 text-red-800']"
                      @click.prevent="toggleCompleted(todo)"
                    >
                      {{ todo.attributes.completed }}
                    </span>
                  </td>

                  <td class="px-6 py-4 whitespace-no-wrap text-right text-sm leading-5 font-medium">
                    <RouterLink
                      :to="{ name: 'edit-todo', params: { id: todo.id } }"
                      class="text-emerald-600 hover:text-emerald-900"
                    >
                      Edit
                    </RouterLink>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <Pagination
      v-model="page"
      :links="links"
    />
  </div>
</template>

<script setup>
import Pagination from '@/components/Shared/Pagination.vue'
import { defineProps, ref, watch } from 'vue'
import { useStore } from 'vuex'

defineProps({
  links: {
    type: Object,
    required: true
  },

  todos: {
    type: Array,
    default: () => []
  }
})

const store = useStore()
const page = ref(1)

watch(page, () => {
  store.dispatch('fetchTodos', { page: page.value })
})

const toggleCompleted = async (todo) => {
  await store.dispatch('updateTodo', { id: todo.id, params: { completed: !todo.attributes.completed } })
}
</script>
