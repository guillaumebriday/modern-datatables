<template>
  <div class="min-h-screen flex flex-col">
    <div class="container mx-auto p-4 flex-1">
      <RouterView />
    </div>

    <Footer />
  </div>
</template>

<script setup>
import Footer from '@/components/Shared/Footer.vue'
import { useHead } from '@unhead/vue'

useHead({
  titleTemplate: '%s | Modern Datatables'
})
</script>
