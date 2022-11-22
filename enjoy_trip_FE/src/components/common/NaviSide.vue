<template>
  <b-nav tabs class="shadow-sm">
    <b-container>
      <div>
        <b-nav ref="tabNav">
          <b-nav-item @click="tog('/')">홈</b-nav-item>
          <b-nav-item @click="tog('/attraction')">관광지 찾기</b-nav-item>
          <b-nav-item @click="tog('/tourboard')">여행계획 게시판</b-nav-item>
        </b-nav>
      </div>
    </b-container>
  </b-nav>
</template>

<script>
import { mapActions, mapGetters, mapMutations } from "vuex";

const sideNavStore = "sideNavStore";

export default {
  name: "NaviSide",
  computed: {
    ...mapGetters(sideNavStore, ["getPath"]),
    ...mapMutations(sideNavStore, ["SET_PATH"]),
    changeTab() {
      return this.getPath;
    },
  },
  methods: {
    ...mapActions(sideNavStore, ["changePath"]),
    tog(link) {
      this.$router.push(link);
      this.changePath(link);
    },
    navLine(idx, col) {
      console.log(col);
      let i = 0;
      while (i < col.length) {
        console.log(i);
        if (i == idx) {
          col[i].children[0].classList.add("active");
        } else {
          col[i].children[0].classList.remove("active");
        }
        i++;
      }
    },
  },
  mounted: function () {
    let navs = this.$refs.tabNav.children;
    switch (this.getPath) {
      case "/":
        this.navLine(0, navs);
        break;

      case "/attraction":
        this.navLine(1, navs);
        break;

      case "/tourboard":
        this.navLine(2, navs);
        break;
    }
  },
  watch: {
    changeTab(path) {
      let navs = this.$refs.tabNav.children;
      switch (path) {
        case "/":
          this.navLine(0, navs);
          break;

        case "/attraction":
          this.navLine(1, navs);
          break;

        case "/tourboard":
          this.navLine(2, navs);
          break;
        default:
          this.navLine(4, navs);
          break;
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
