<template>
  <div>
    <NavBar v-if="navShow"/>
    <RouterView />
  </div>
 
</template>

<script>
export default {
  computed: {
    navShow() {
      return this.$route.path === '/' || this.$route.path === '/gallery' || this.$route.path === '/where';
    }
  }
}
</script>


<style scoped>
div{
  background-color: #100B12;
  height: 100svh;
  overflow: hidden;
}

</style>
