<template>
  <div id="app">
    <the-navi></the-navi>
    <router-view />
    <the-footer></the-footer>
  </div>
</template>

<script>
import TheNavi from "@/components/common/AppNavi.vue";
import TheFooter from "@/components/common/footer.vue";
export default {
  components: { TheNavi, TheFooter },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #00ce7c;
}

.keycolor {
  background-color: #00ce7c;
}
</style>
