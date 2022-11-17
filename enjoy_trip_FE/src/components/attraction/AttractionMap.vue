<template>
  <b-row class="gy-4">
    <b-col col>
      <KakaoMap />
    </b-col>
    <b-col col> 야호 </b-col>
  </b-row>
</template>

<script>
import KakaoMap from "@/components/attraction/KakaoMap.vue";

export default {
  name: "AttractionMap",
  components: {
    KakaoMap,
  },
};
</script>

<style></style>
