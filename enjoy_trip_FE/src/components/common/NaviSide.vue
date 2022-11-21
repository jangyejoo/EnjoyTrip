<template>
  <b-nav tabs class="shadow-sm">
    <b-container>
      <b-row @click="routerToggle" ref="tog">
        <b-nav-item class="ml-3" active to="/">홈 </b-nav-item>
        <b-nav-item to="/attraction"> 관광지 찾기 </b-nav-item>
        <b-nav-item to="/tourboard"> 여행 계획 게시판 </b-nav-item>
      </b-row>
    </b-container>
  </b-nav>
</template>

<script>
export default {
  name: "NaviSide",
  methods: {
    routerToggle(e) {
      const items = this.$refs.tog.children;
      for (const item of items) {
        if (e.target == item.children[0])
          item.children[0].classList.add("active");
        else item.children[0].classList.remove("active");
      }
    },
  },
};
</script>

<style scoped>
.nav-tabs {
  /* border-bottom: 1px solid rgb(156, 156, 156); */
  border: none;
  color: black;
}

.nav-tabs .nav-link {
  margin-bottom: -1px;
  border-radius: 0px;
  color: black;
}

.nav-tabs .nav-link.active {
  border-color: white;
  border-bottom: 3px solid #00ce7c;
}
</style>
