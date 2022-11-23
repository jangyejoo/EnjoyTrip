<template>
  <div>
    <h1>지금 뜨는 여행 계획 (10개만)</h1>
    <b-button :to="{ name: 'tourboardlist' }">더보기</b-button>
    <b-container v-if="tours && tours.length != 0" class="bv-example-row mt-3">
      <swiper class="swiper" :options="swiperOption">
        <tour-board-list-item
          v-for="(tour, index) in listData"
          :key="index"
          :tour="tour"
        ></tour-board-list-item>

        <div class="swiper-pagination" slot="pagination"></div>
      </swiper>

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
import { Swiper } from "vue-awesome-swiper";
import "swiper/css/swiper.css";

import { mapState } from "vuex";

export default {
  name: "RecommandAttraction",
  components: {
    TourBoardListItem,
    TourBoardDetail,
    Swiper,
  },
  data() {
    return {
      listData: [],
      swiperOption: {
        slidesPerView: 4,
        spaceBetween: 10,
        pagination: { el: ".swiper-pagination", clickable: true },
        breakpoints: {
          1024: { slidesPerView: 4, spaceBetween: 10 },
          768: { slidesPerView: 3, spaceBetween: 10 },
          640: {
            slidesPerView: 2,
            spaceBetween: 10,
          },
          320: { slidesPerView: 1, spaceBetween: 10 },
        },
      },
    };
  },
  computed: { ...mapState("attraction", ["tours"]) },
  created() {
    let toursByHit = this.tours.sort((a, b) => b.hit - a.hit);
    let i = 0;
    while (i < 10 && toursByHit[i]) {
      this.listData.push(toursByHit[i]);
      i++;
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
