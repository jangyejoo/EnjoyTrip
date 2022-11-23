<template>
  <div>
    <b-form-group id="fieldset-title" label-for="input-title" :state="state">
      <b-form-input
        id="input-title"
        v-model="title"
        size="lg"
        :state="state"
        placeholder="제목을 입력하세요"
        trim
      ></b-form-input>
    </b-form-group>
    <b-row class="mb-3">
      <b-col lg="8"
        ><b-input-group class="mb-3">
          <b-form-input
            id="input-search"
            v-model="keyword"
            placeholder="검색어를 입력하세요"
            trim
          ></b-form-input>
          <b-input-group-append>
            <b-button
              variant="outline"
              @click="search"
              :disabled="availableSearch"
              >검색</b-button
            >
          </b-input-group-append>
        </b-input-group>
        <KakaoMap id="mapCol" type="tourboardwrite" />
      </b-col>
      <b-list-group
        v-if="searchlist && searchlist.length != 0"
        class="overflow-auto col-lg-4"
        style="height: 554px; padding-left: 15px"
      >
        <tour-board-map-item
          v-for="(attraction, index) in searchlist"
          :key="index"
          :attraction="attraction"
        ></tour-board-map-item>
        <attraction-detail></attraction-detail>
      </b-list-group>
      <b-col
        v-else
        lg="4"
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
    <tour-board-modify-item
      v-for="(item, index) in attractioncart"
      :key="index"
      :item="item"
      style="background-color: #ececec"
    ></tour-board-modify-item>
    <b-button
      class="mt-3 mb-3"
      variant="outline"
      block
      @click="modify"
      :disabled="availableModify"
      size="lg"
    >
      일정 수정하기
    </b-button>
  </div>
</template>

<script>
import KakaoMap from "@/components/common/KakaoMap.vue";
import TourBoardMapItem from "@/components/tourboard/TourBoardMapItem.vue";
import AttractionDetail from "@/components/attraction/AttractionDetail.vue";
import TourBoardModifyItem from "@/components/tourboard/TourBoardModifyItem.vue";

import { mapActions, mapState, mapMutations } from "vuex";

export default {
  name: "TourBoardModify",
  components: {
    KakaoMap,
    TourBoardMapItem,
    AttractionDetail,
    TourBoardModifyItem,
  },
  data() {
    return {
      title: "",
      keyword: "",
    };
  },
  computed: {
    ...mapState("attraction", ["searchlist", "attractioncart", "tour"]),
    ...mapState("userStore", ["userInfo"]),
    state() {
      return this.title.length > 0;
    },
    availableModify() {
      if (this.title != "") return false;
      else return true;
    },
    availableSearch() {
      if (this.keyword != "") return false;
      else return true;
    },
  },
  created() {
    this.title = this.tour.title;
    this.CLEAR_SEARCH_LIST();
    this.SET_ATTRACTION_CART(this.tour.planInfos);
  },
  methods: {
    ...mapActions("attraction", ["getSearchList", "modifyPlan", "detailTour"]),
    ...mapMutations("attraction", [
      "CLEAR_SEARCH_LIST",
      "SET_ATTRACTION_CART",
      "TOUR_MODAL_SWITCH",
    ]),
    close() {
      this.TOUR_MODAL_SWITCH(false);
    },
    search() {
      if (this.search) {
        const params = {
          key: this.keyword,
        };
        this.getSearchList(params);
      }
    },
    modify() {
      let map = new Map();
      map.set("planId", this.tour.planId);
      map.set("title", this.title);
      map.set("thumbnail", this.attractioncart[0].firstImage);
      map.set("userId", this.userInfo.userId);
      this.attractioncart.forEach((item, index) => {
        let id = `attractionId${index + 1}`;
        map.set(id, item.contentId);
        let desc = `attractionDesc${index + 1}`;
        map.set(desc, item.attractionDesc);
      });
      this.modifyPlan(map);
      this.$router.push({ name: "tourboardlist" });
    },
  },
};
</script>

<style scoped>
#mapCol {
  padding: 0px;
}
.btn {
  color: #00ce7c;
  border: 1px solid #00ce7c;
}
.btn:hover {
  color: white;
  background-color: #00ce7c; /* border: 1px solid #007e4b; */
}
</style>
