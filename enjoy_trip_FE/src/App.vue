<template>
  <div id="app">
    <the-navi></the-navi>
    <router-view />
  </div>
</template>

<script>
import TheNavi from "@/components/common/AppNavi.vue";
// import { mapActions } from "vuex";
export default {
  components: { TheNavi },
  // methods: {
  //   ...mapActions("userStore", ["getUserInfo"]),
  //   async refresh() {
  //     const token = sessionStorage.getItem("access-token");
  //     await this.getUserInfo(token);
  //   },
  // },
  // created() {
  //   this.refresh();
  // },
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
  color: #42b983;
}

.keycolor {
  background-color: #00ce7c;
}
</style>
