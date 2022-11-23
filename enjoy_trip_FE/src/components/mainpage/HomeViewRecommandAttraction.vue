<template>
  <div>
    <b-container>
      <h3 class="title">
        지금 뜨는 여행계획
        <p @click="tog('/tourboard')" class="more">더보기</p>
      </h3>
    </b-container>
    <b-container v-if="tours && tours.length != 0" class="bv-example-row mt-3">
      <swiper class="swiper" :options="swiperOption">
        <tour-board-list-item
          v-for="(tour, index) in listData"
          :key="index"
          :tour="tour"
        ></tour-board-list-item>
        <div class="swiper-button-prev" slot="pagination"></div>
        <div class="swiper-pagination" slot="pagination"></div>
        <div class="swiper-button-next" slot="pagination"></div>
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
import { mapActions, mapMutations } from "vuex";
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
        slidesPerView: 3,
        spaceBetween: 20,
        pagination: { el: ".swiper-pagination", clickable: true },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },

        breakpoints: {
          1024: { slidesPerView: 3, spaceBetween: 20 },
          768: { slidesPerView: 2, spaceBetween: 10 },
          640: {
            slidesPerView: 2,
            spaceBetween: 10,
          },
          320: { slidesPerView: 1, spaceBetween: 10 },
        },
      },
    };
  },
  computed: {
    ...mapState("attraction", ["tours"]),

    ...mapMutations("sideNavStore", ["SET_PATH"]),
  },
  created() {
    let toursByHit = this.tours.sort((a, b) => b.hit - a.hit);
    let i = 0;
    while (i < 10 && toursByHit[i]) {
      this.listData.push(toursByHit[i]);
      i++;
    }
  },
  methods: {
    ...mapActions("sideNavStore", ["changePath"]),
    tog(link) {
      console.log("tog");
      this.$router.push(link);
      this.changePath(link);
    },
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
.title {
  /* background-color: gray; */
  text-align: start;
  margin: 10px 0;
  margin-left: 15px;
  box-sizing: border-box;
  border-radius: 4px;
  color: black;
  font-weight: 400;
}

.more {
  font-size: 1rem;
  cursor: pointer;
  /* border: 1px solid #00ce7c; */
  border-radius: 2px;
  box-sizing: border-box;
  margin-top: 10px;
  margin-right: 20px;
  float: right;
  color: gray;
  text-decoration: none;
}

.more:hover {
  background-color: #00ce7c;
  color: white;
  border-color: #008d55;
}
</style>
