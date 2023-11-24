<template>
  <div>
    <div class="mt-4 pt-4">
      <h3 class="text-lg leading-6 font-medium text-gray-900">
        Editing Todo
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
import { useStore } from 'vuex'
import { computed, ref, watch, onMounted, nextTick, toRaw } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useHead } from '@unhead/vue'

useHead({
  title: 'Edit todo'
})

const store = useStore()
const route = useRoute()
const router = useRouter()

const loaded = ref(false)
const error = ref(null)
const todo = ref({})

const todo_ = computed(() => store.getters.todo)

onMounted(async () => {
  await store.dispatch('fetchTodo', { id: route.params.id })

  todo.value = toRaw(todo_.value.attributes)

  await nextTick(() => {
    loaded.value = true
  })
})

watch(todo, async () => {
  if (!loaded.value) return

  error.value = null

  try {
    await store.dispatch('updateTodo', { id: todo_.value.id, params: todo.value })

    await router.push({ name: 'index-todo' })
  } catch (data) {
    error.value = data.error
  }
})
</script>
