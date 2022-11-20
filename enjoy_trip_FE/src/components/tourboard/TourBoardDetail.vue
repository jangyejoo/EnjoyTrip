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
      <h2>{{ tour.title }}</h2>
      <p class="mb-0">{{ tour.userName }}</p>
      <p class="mb-0">
        {{ tour.registerDate }}
        <span class="mb-0 float-right">
          <font-awesome-icon icon="fa-solid fa-eye" /> {{ tour.hit }}</span
        >
      </p>
      <ul class="timeline">
        <tour-board-timeline-item
          v-for="(item, index) in tour.planInfos"
          :key="index"
          :item="item"
        ></tour-board-timeline-item>
      </ul>
    </b-container>

    <template #modal-footer>
      <div class="w-100">
        <b-button
          variant="danger"
          class="float-right"
          @click="deleteSharedPlan"
        >
          삭제하기
        </b-button>
      </div>
    </template>
  </b-modal>
</template>

<script>
import TourBoardTimelineItem from "@/components/tourboard/TourBoardTimelineItem.vue";

import { mapState, mapMutations, mapGetters, mapActions } from "vuex";

export default {
  name: "TourBoardDetail",
  components: {
    TourBoardTimelineItem,
  },
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
    ...mapActions(["deletePlan"]),
    ...mapMutations(["TOUR_MODAL_SWITCH"]),
    close() {
      this.TOUR_MODAL_SWITCH(false);
    },
    deleteSharedPlan() {
      if (confirm("일정을 삭제하시겠습니까?")) {
        this.deletePlan(this.tour);
        this.close();
      }
    },
  },
};
</script>

<style lang="less" scoped>
.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;

  &:before {
    background-color: #eee;
    bottom: 0;
    content: " ";
    left: 50px;
    margin-left: -1.5px;
    position: absolute;
    top: 0;
    width: 3px;
  }
}
</style>
