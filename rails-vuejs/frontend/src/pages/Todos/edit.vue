<template>
<div>
  <div class="mt-4 pt-4">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      Editing Todo
    </h3>
  </div>

  <TodosForm v-model="todo" :error="error" />
</div>
</template>

<script>
import TodosForm from '@/components/Todos/Form'
import { mapGetters } from 'vuex'

export default {
  components: {
    TodosForm
  },

  metaInfo: {
    title: 'Edit todo'
  },

  computed: {
    ...mapGetters({
      todo_: 'todo'
    })
  },

  data () {
    return {
      loaded: false,
      error: null,
      todo: {}
    }
  },

  async created () {
    await this.$store.dispatch('fetchTodo', { id: this.$route.params.id })

    this.todo = {...this.todo_.attributes}

    this.$nextTick(() => {
      this.loaded = true
    })
  },

  watch: {
    async todo () {
      if (!this.loaded) return

      this.error = null

      try {
        await this.$store.dispatch('updateTodo', { id: this.todo_.id, params: this.todo })
        await this.$router.push({ name: 'index-todo' })
      } catch ({ response }) {
        this.error = response.data.error
      }
    }
  }
}
</script>
