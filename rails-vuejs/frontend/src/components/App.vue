<template>
  <div class="min-h-screen flex flex-col">
    <div class="container mx-auto p-4 flex-1">
      <RouterView />
    </div>

    <Footer />
  </div>
</template>

<script>
import Footer from '@/components/Shared/Footer'

export default {
  components: {
    Footer
  },

  metaInfo: {
    titleTemplate: '%s | Modern Datatables'
  }
}
</script>
