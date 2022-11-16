<template>
  <b-container class="bv-example-row mt-3">
    <b-jumbotron header-level="4">
      <template #header>관광지 정보</template>

      <template #lead>
        내가 원하는 관광지를 조회할 수 있는 페이지입니다
      </template>

      <hr class="my-4" />

      <p>관광지 조회는 시도, 구군, 카테고리로 검색 가능합니다</p>
    </b-jumbotron>

    <b-row>
      <b-col><attraction-search-bar></attraction-search-bar></b-col>
    </b-row>

    <b-row>
      <KakaoMap />
    </b-row>
    <b-row>
      <attraction-list></attraction-list>
    </b-row>
  </b-container>
</template>

<script>
import AttractionSearchBar from "@/components/attraction/AttractionSearchBar.vue";
import AttractionList from "@/components/attraction/AttractionList.vue";
import KakaoMap from "@/components/attraction/KakaoMap.vue";

export default {
  name: "AppAttraction",
  components: {
    AttractionSearchBar,
    AttractionList,
    KakaoMap,
  },
};
</script>

<style scoped>
.bv-example-row {
  text-align: left;
}
</style>
