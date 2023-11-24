<template>
  <div>
    <div class="mt-4 pt-4">
      <h3 class="text-lg leading-6 font-medium text-gray-900">
        New Todo
      </h3>
    </div>

    <TodosForm
      v-model="todo"
      :error="error"
    />
  </div>
</template>

<script setup>
import TodosForm from '@/components/Todos/Form.vue'
import { ref, watch } from 'vue'
import { useStore } from 'vuex'
import { useRouter } from 'vue-router'
import { useHead } from '@unhead/vue'

useHead({
  title: 'Create todo'
})

const error = ref(null)
const todo = ref({})

const store = useStore()
const router = useRouter()

watch(todo, async () => {
  error.value = null

  try {
    await store.dispatch('addTodo', { params: todo.value })

    await router.push({ name: 'index-todo' })
  } catch (data) {
    error.value = data.error
  }
})
</script>
