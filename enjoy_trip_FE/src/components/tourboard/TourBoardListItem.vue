<template>
  <swiper-slide>
    <b-col class="mb-3">
      <article
        class="card mb-2"
        style="max-width: 25rem, max-height:23 rem"
        @click="selectTour"
      >
        <div class="img-wrapper" style="overflow: hidden">
          <img
            :src="tour.thumbNail"
            alt="Card Image"
            class="card-img-top"
            style="height: 250px"
          />
        </div>
        <div class="card-body">
          <strong class="card-title">{{ tour.title }}</strong>
          <div class="card-text">
            <p class="mb-0">{{ tour.userName }}</p>
            <p class="mb-0">
              {{ tour.registerDate | moment("YYYY-MM-DD LT") }}
              <span class="mb-0 float-right">
                <font-awesome-icon icon="fa-solid fa-eye" />
                {{ tour.hit }}</span
              >
            </p>
          </div>
        </div>
      </article>
    </b-col>
  </swiper-slide>
</template>

<script>
import { mapActions } from "vuex";
import { SwiperSlide } from "vue-awesome-swiper";
import "swiper/css/swiper.css";

export default {
  name: "TourBoardListItem",
  components: {
    SwiperSlide,
  },
  props: {
    tour: Object,
  },
  methods: {
    ...mapActions("attraction", ["detailTour"]),
    selectTour() {
      this.detailTour(this.tour);
    },
  },
};
</script>

<style scoped>
.card-title {
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.card:hover {
  cursor: pointer;
}
.img-wrapper {
  overflow: hidden;
}
.card-img-top {
  transition: all 0.2s linear;
}
.card-img-top:hover {
  transform: scale(1.4);
}
</style>
