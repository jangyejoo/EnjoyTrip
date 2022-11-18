<template>
  <b-row>
    <b-col lg="6" id="mapCol">
      <KakaoMap />
    </b-col>

    <b-list-group
      v-if="attractions && attractions.length != 0"
      class="overflow-auto col-lg-6"
      style="height: 500px"
    >
      <attraction-map-item
        v-for="(attraction, index) in attractions"
        :key="index"
        :attraction="attraction"
      ></attraction-map-item>
      <attraction-detail></attraction-detail>
    </b-list-group>
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
import AttractionMapItem from "@/components/attraction/AttractionMapItem.vue";
import AttractionDetail from "@/components/attraction/AttractionDetail.vue";

import { mapState } from "vuex";

export default {
  name: "AttractionMap",
  components: {
    KakaoMap,
    AttractionMapItem,
    AttractionDetail,
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
