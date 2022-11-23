<template>
  <div id="app">
    <app-navi class="fix"></app-navi>
    <router-view class="main" />
    <the-footer></the-footer>
  </div>
</template>

<script>
import AppNavi from "@/components/common/AppNavi.vue";
import TheFooter from "@/components/common/footer.vue";
export default {
  components: { AppNavi, TheFooter },
};
</script>

<style>
@font-face {
  font-family: "twayair";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

#app {
  font-family: twayair, Avenir, Helvetica, Arial, sans-serif;
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

.fix {
  position: fixed;
  z-index: 10;
  width: 100%;
  top: 0;
}

.main {
  padding-top: 110px;
  min-height: calc(100vh - 422.56px);
}

input[type="password"] {
  font-family: Avenir !important;
}
input[type="password"]::placeholder {
  font-family: twayair;
}
</style>
