<template>
  <b-container v-if="tours && tours.length != 0" class="bv-example-row mt-3">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 mt-3">
      <tour-board-list-item
        v-for="(tour, index) in tours"
        :key="index"
        :tour="tour"
      ></tour-board-list-item>
    </div>
    <tour-board-detail></tour-board-detail>
  </b-container>
  <b-container v-else class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show variant="danger">공유되는 여행 계획이 없습니다.</b-alert>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import TourBoardListItem from "@/components/tourboard/TourBoardListItem";
import TourBoardDetail from "@/components/tourboard/TourBoardDetail.vue";

import { mapState } from "vuex";

export default {
  name: "TourBoardList",
  components: {
    TourBoardListItem,
    TourBoardDetail,
  },
  computed: {
    ...mapState(["tours"]),
  },
};
</script>

<style></style>
