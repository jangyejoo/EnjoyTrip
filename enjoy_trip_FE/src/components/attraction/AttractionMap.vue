<template>
  <b-row>
    <b-col lg="8" id="mapCol">
      <KakaoMap type="attractionmap" />
    </b-col>

    <b-list-group
      v-if="attractions && attractions.length != 0"
      class="overflow-auto col-lg-4"
      style="height: 500px"
    >
      <attraction-map-item
        v-for="(attraction, index) in attractions"
        :key="index"
        :attraction="attraction"
      ></attraction-map-item>
      <attraction-detail></attraction-detail>
    </b-list-group>
    <b-col
      lg="4"
      v-else
      style="
        display: flex;
        justify-content: center;
        align-items: center;
        height: 500px;
        color: #ececec;
      "
    >
      <p>
        <font-awesome-icon
          icon="fa-solid fa-circle-exclamation"
          class="fa-5x"
          block
        />
      </p>
    </b-col>
  </b-row>
</template>

<script>
import KakaoMap from "@/components/common/KakaoMap.vue";
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
    ...mapState("attraction", ["attractions"]),
  },
};
</script>

<style scoped>
#mapCol {
  padding: 0px;
}
</style>
