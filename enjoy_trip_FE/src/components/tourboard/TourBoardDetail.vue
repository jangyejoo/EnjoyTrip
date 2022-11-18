<template>
  <!-- 관광지 상세정보 모달 -->
  <b-modal
    v-if="tour && tour.length != 0"
    v-model="tourModalState"
    size="xl"
    scrollable
    no-close-on-backdrop
    title="일정 공유"
    @hidden="close"
  >
    <b-container>
      <b-row class="gy-4">
        <h2>{{ tour.title }}</h2>
        <!-- <b-col col lg="8" class="mb-3">
          <b-img
            :src="tour.thumbNail"
            rounded
            style="width: 100%; heigth: 500px"
          ></b-img>
        </b-col> -->
      </b-row>
    </b-container>
  </b-modal>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";

export default {
  name: "TourBoardDetail",
  computed: {
    ...mapState(["tour", "isTourModalOpen"]),
    ...mapGetters({
      value: "tourModalState",
    }),
    tourModalState: {
      get() {
        return this.value;
      },
      set(newValue) {
        return newValue;
      },
    },
  },
  methods: {
    ...mapMutations(["TOUR_MODAL_SWITCH"]),
    close() {
      this.TOUR_MODAL_SWITCH(false);
    },
  },
};
</script>

<style></style>
