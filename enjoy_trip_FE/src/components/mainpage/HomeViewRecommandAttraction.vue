<template>
  <div>
    <h1>지금 뜨는 여행 계획</h1>
    <b-button to="/tourshareboard">더보기</b-button>
    <recommand-attraction-item></recommand-attraction-item>
  </div>
</template>

<script>
import RecommandAttractionItem from "@/components/mainpage/RecommandAttractionItem.vue";
export default {
  name: "RecommandAttraction",
  components: {
    RecommandAttractionItem,
  },
};
</script>

<style scoped>
h1 {
  display: inline;
}
</style>
