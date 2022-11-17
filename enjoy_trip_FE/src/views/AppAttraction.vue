<template>
  <b-container class="bv-example-row mt-3">
    <b-jumbotron header-level="4">
      <template #header>관광지 정보</template>

      <template #lead>
        내가 원하는 관광지를 조회할 수 있는 페이지입니다
      </template>

      <hr class="my-4" />

      <b-button
        class="float-right"
        pill
        variant="outline-primary"
        @click="movePage"
        >지도로 조회</b-button
      >
    </b-jumbotron>

    <b-row>
      <b-col><attraction-search-bar></attraction-search-bar></b-col>
    </b-row>

    <!-- <b-row>
      <attraction-list></attraction-list>
    </b-row> -->
    <router-view></router-view>
  </b-container>
</template>

<script>
import AttractionSearchBar from "@/components/attraction/AttractionSearchBar.vue";
// import AttractionList from "@/components/attraction/AttractionList.vue";

export default {
  name: "AppAttraction",
  components: {
    AttractionSearchBar,
    // AttractionList,
  },
  methods: {
    movePage() {
      if (this.$route.path == "/attraction/list")
        this.$router.push({ name: "attractionmap" });
      else this.$router.push({ name: "attractionlist" });
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
