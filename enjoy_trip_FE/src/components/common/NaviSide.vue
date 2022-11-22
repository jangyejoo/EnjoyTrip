<template>
  <b-nav tabs class="shadow-sm">
    <b-container>
      <!-- @click="routerToggle" -->

      <b-row ref="tog" @click="routerToggle">
        <b-nav-item class="ml-3" to="/" id="home" active>홈 </b-nav-item>
        <b-nav-item to="/attraction" id="attractionlist">
          관광지 찾기
        </b-nav-item>
        <b-nav-item to="/tourboard" id="tourboardlist">
          여행 계획 게시판
        </b-nav-item>
      </b-row>
    </b-container>
  </b-nav>
</template>

<script>
import { mapActions, mapMutations, mapGetters } from "vuex";

const sideNavStore = "sideNavStore";

export default {
  name: "NaviSide",

  computed: {
    ...mapGetters(sideNavStore, ["getRoute"]),
    ...mapMutations(sideNavStore, ["SET_ROUTE"]),
    getCurRoute: function () {
      return this.getRoute;
    },
  },
  methods: {
    ...mapActions(sideNavStore, ["changeRoute"]),
    routerToggle() {
      this.changeRoute(this.$route);
    },
  },
  watch: {
    getCurRoute(curRoute) {
      const items = this.$refs.tog.children;
      for (const item of items) {
        if (item.id == curRoute) {
          item.children[0].classList.add("active");
        } else {
          item.children[0].classList.remove("active");
        }
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
