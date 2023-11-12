<template>
<div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
  <div class="flex-1 flex justify-between sm:hidden">
    <RouterLink v-if="links.prev" :to="{ name: 'index-todo', query: { page: links.prev } }" @click.native.prevent="$emit('input', links.prev)" :class="navLinkClass">
      Previous
    </RouterLink>

    <span v-else :class="navLinkClass">
      Previous
    </span>

    <RouterLink v-if="links.next" :to="{ name: 'index-todo', query: { page: links.next } }" @click.native.prevent="$emit('input', links.next)" :class="navLinkClass">
      Next
    </RouterLink>

    <span v-else :class="navLinkClass">
      Next
    </span>
  </div>

  <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
    <div>
      <p class="text-sm leading-5 text-gray-700">
        Showing

        <span class="font-medium">
          {{ links.from }}
        </span>

        to

        <span class="font-medium">
          {{ links.to }}
        </span>

        of

        <span class="font-medium">
          {{ links.count }}
        </span>

        results
      </p>
    </div>

    <div class="flex-1 flex justify-between sm:justify-end">
      <RouterLink v-if="links.prev" :to="{ name: 'index-todo', query: { page: links.prev } }" @click.native.prevent="$emit('input', links.prev)" :class="navLinkClass">
        Previous
      </RouterLink>

      <span v-else :class="navLinkClass">
        Previous
      </span>

      <RouterLink v-if="links.next" :to="{ name: 'index-todo', query: { page: links.next } }" @click.native.prevent="$emit('input', links.next)" :class="navLinkClass">
        Next
      </RouterLink>

      <span v-else :class="navLinkClass">
        Next
      </span>
    </div>
  </div>
</div>
</template>

<script>
export default {
  props: {
    links: {
      type: Object,
      required: true
    },

    value: {
      type: Number,
      required: true
    }
  },

  computed: {
    navLinkClass () {
      return 'ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-green focus:border-green-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150'
    }
  }
}
</script>
