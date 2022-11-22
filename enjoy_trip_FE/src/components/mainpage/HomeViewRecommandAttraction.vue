<template>
  <div>
    <h1>지금 뜨는 여행 계획</h1>
    <b-button :to="{ name: 'tourboardlist' }">더보기</b-button>
    <b-container v-if="tours && tours.length != 0" class="bv-example-row mt-3">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 mt-3">
        <tour-board-list-item
          v-for="(tour, index) in listData"
          :key="index"
          :tour="tour"
        ></tour-board-list-item>
      </div>

      <tour-board-detail></tour-board-detail>
    </b-container>
    <b-container v-else class="bv-example-row mt-3">
      <b-row>
        <b-col>
          <b-alert show variant="danger"
            >공유되는 여행 계획이 없습니다.</b-alert
          >
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import TourBoardListItem from "@/components/tourboard/TourBoardListItem";
import TourBoardDetail from "@/components/tourboard/TourBoardDetail.vue";

import { mapState } from "vuex";

export default {
  name: "RecommandAttraction",
  components: {
    TourBoardListItem,
    TourBoardDetail,
  },
  data() {
    return {
      listData: [],
    };
  },
  computed: { ...mapState("attraction", ["tours"]) },
  created() {
    let toursByHit = this.tours.sort((a, b) => b.hit - a.hit);
    for (let i = 0; i < 4; i++) {
      this.listData.push(toursByHit[i]);
    }
  },
};
</script>

<style scoped>
.bv-example-row {
  text-align: left;
}

h1 {
  display: inline;
}
</style>
