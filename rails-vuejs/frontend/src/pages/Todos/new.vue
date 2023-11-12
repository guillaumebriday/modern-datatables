<template>
<div>
  <div class="mt-4 pt-4">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      New Todo
    </h3>
  </div>

  <TodosForm v-model="todo" :error="error" />
</div>
</template>

<script>
import TodosForm from '@/components/Todos/Form'

export default {
  components: {
    TodosForm
  },

  metaInfo: {
    title: 'Create todo'
  },

  data () {
    return {
      error: null,
      todo: {}
    }
  },

  watch: {
    async todo () {
      this.error = null

      try {
        await this.$store.dispatch('addTodo', { params: this.todo })
        await this.$router.push({ name: 'index-todo' })
      } catch ({ response }) {
        this.error = response.data.error
      }
    }
  }
}
</script>
