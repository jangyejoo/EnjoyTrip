<template>
  <b-list-group-item
    @click="rebound"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <b-row>
      <b-col cols="5">
        <b-img thumbnail :src="attraction.firstImage" alt="Image 1"></b-img>
      </b-col>
      <b-col cols="7" style="padding: 0px" :id="attraction.contentId">
        <h5>{{ attraction.title }}</h5>
        {{ attraction.contentTypeName }}
        <b-button
          size="sm"
          class="float-right mr-3"
          pill
          variant="outline"
          @click="selectAttraction"
          >상세보기</b-button
        >
      </b-col>
    </b-row>
  </b-list-group-item>
</template>

<script>
import { mapActions, mapMutations } from "vuex";

export default {
  name: "AttractionMapItem",
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    attraction: Object,
  },
  methods: {
    ...mapActions("attraction", ["detailAttraction"]),
    ...mapMutations("attraction", ["SET_BOUND"]),
    colorChange(flag) {
      this.isColor = flag;
    },
    selectAttraction() {
      this.detailAttraction(this.attraction);
    },
    rebound() {
      this.SET_BOUND(this.attraction);
    },
  },
};
</script>

<style scoped>
.mouse-over-bgcolor {
  background-color: lightblue;
}
.img-thumbnail {
  width: 7rem;
  height: 5rem;
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
