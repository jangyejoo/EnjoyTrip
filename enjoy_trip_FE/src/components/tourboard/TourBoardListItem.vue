<template>
  <b-col class="mb-3"
    ><b-card
      class="mb-2"
      :img-src="tour.thumbNail"
      img-alt="Card Image"
      img-top
      img-height="250px"
      tag="article"
      style="max-width: 25rem; max-height: 23rem"
      @click="selectTour"
    >
      <b-card-title :title="tour.title" title-tag="strong" />
      <b-card-text>
        <p class="mb-0">{{ tour.userName }}</p>
        <p class="mb-0">
          {{ tour.registerDate }}
          <span class="mb-0 float-right">
            <b-icon icon="eye" font-scale="1"></b-icon> {{ tour.hit }}</span
          >
        </p>
      </b-card-text>
    </b-card>
  </b-col>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "TourBoardListItem",
  props: {
    tour: Object,
  },
  methods: {
    ...mapActions(["detailTour"]),
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
</style>
