<template>
  <b-container class="bv-example-row mt-3">
    <b-jumbotron header-level="4">
      <template #header>여행 계획 게시판</template>

      <template #lead>
        서로의 여행 계획을 공유할 수 있는 페이지입니다
      </template>

      <hr class="my-4" />

      <b-button
        class="move-btn float-right"
        pill
        variant="outline-primary"
        @click="movePage"
        >여행 계획 올리기</b-button
      >
    </b-jumbotron>

    <router-view></router-view>
  </b-container>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "AppTourBoard",
  created() {
    this.getTourList();
  },
  computed: {
    ...mapState("userStore", ["userInfo"]),
  },
  watch: {
    $route: {
      handler() {
        if (this.$route.path == "/tourboard/list") {
          document.querySelector(".move-btn").innerHTML = "여행 계획 올리기";
          this.getTourList();
        } else
          document.querySelector(".move-btn").innerHTML = "목록으로 돌아가기";
      },
    },
  },
  mounted() {
    if (this.userInfo == null) {
      document.querySelector(".move-btn").setAttribute("style", "display:none");
    }

    if (this.$route.path == "/tourboard/list") {
      document.querySelector(".move-btn").innerHTML = "여행 계획 올리기";
      this.getTourList();
    } else document.querySelector(".move-btn").innerHTML = "목록으로 돌아가기";
  },
  methods: {
    ...mapActions("attraction", ["getTourList"]),
    movePage() {
      if (this.$route.path == "/tourboard/list") {
        this.$router.push({ name: "tourboardwrite" });
      } else {
        this.$router.push({ name: "tourboardlist" });
      }
    },
  },
};
</script>

<style scoped>
.bv-example-row {
  text-align: left;
}
.btn {
  margin-right: 1rem;
}
p {
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
