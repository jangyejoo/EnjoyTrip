<template>
  <!-- 관광지 상세정보 모달 -->
  <b-modal
    v-if="detail && detail.length != 0"
    v-model="attractionModalState"
    size="lg"
    scrollable
    no-close-on-backdrop
    hide-footer
    title="관광지 상세정보"
    @hidden="close"
  >
    <b-container>
      <b-row class="gy-4" no-gutters>
        <b-img
          :src="detail.firstImage"
          rounded
          style="width: 100%; max-height: 400px"
        ></b-img>
      </b-row>
      <b-col style="padding: 0" lg="12" class="overview mt-3">
        <h3>
          {{ detail.title }}
          <b-badge
            pill
            v-if="detail.contentTypeId == 12"
            style="background-color: #00ce7c"
            >관광지</b-badge
          >
          <b-badge
            pill
            v-if="detail.contentTypeId == 14"
            style="background-color: #007bff"
            >문화시설
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 15"
            style="background-color: #28a745"
            >행사/공연/축제
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 25"
            style="background-color: #ffc107"
            >여행코스
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 28"
            style="background-color: #343a40"
            >레포츠
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 32"
            style="background-color: #6c757d"
            >숙박
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 38"
            style="background-color: #17a2b8"
            >쇼핑
          </b-badge>

          <b-badge
            pill
            v-if="detail.contentTypeId == 39"
            style="background-color: #ff8491"
            >음식점
          </b-badge>
        </h3>
        <span v-if="detail.addr1 && detail.addr1 != 0">
          <font-awesome-icon icon="fa-solid fa-map-pin" />
          {{ detail.addr1 }} &nbsp; {{ detail.addr2 }} &nbsp; &nbsp;
        </span>
        <span v-if="detail.tel && detail.tel != 0">
          <font-awesome-icon icon="fa-solid fa-phone" />
          {{ detail.tel }} &nbsp; &nbsp;
        </span>

        <p
          class="mt-3 border-left"
          style="padding: 15px"
          v-if="detail.overview && detail.overview.length != 0"
        >
          {{ detail.overview }}
        </p>
      </b-col>
    </b-container>
  </b-modal>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";

export default {
  name: "AttractionDetail",
  computed: {
    ...mapState("attraction", ["detail", "isAttractionModalOpen"]),
    ...mapGetters("attraction", {
      value: "attractionModalState",
    }),
    attractionModalState: {
      get() {
        return this.value;
      },
      set(newValue) {
        return newValue;
      },
    },
  },
  methods: {
    ...mapMutations("attraction", ["ATTRACTION_MODAL_SWITCH"]),
    close() {
      this.ATTRACTION_MODAL_SWITCH(false);
    },
  },
};
</script>

<style scoped>
@font-face {
  font-family: "twayair";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

* {
  font-family: twayair;
}
</style>
