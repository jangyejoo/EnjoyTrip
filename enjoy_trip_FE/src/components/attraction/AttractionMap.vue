<template>
  <b-row>
    <b-col lg="6" id="mapCol">
      <KakaoMap />
    </b-col>

    <b-col lg="6" v-if="attractions && attractions.length != 0"> </b-col>
    <b-col lg="6" v-else>
      <b-img
        fluid
        src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99D3F6495B1C954A1F"
      ></b-img>
    </b-col>
  </b-row>
</template>

<script>
import KakaoMap from "@/components/attraction/KakaoMap.vue";

import { mapState } from "vuex";

export default {
  name: "AttractionMap",
  components: {
    KakaoMap,
  },
  computed: {
    ...mapState(["attractions"]),
  },
};
</script>

<style scoped>
#mapCol {
  padding: 0px;
}
</style>
