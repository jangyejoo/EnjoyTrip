<template>
  <b-list-group-item
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <b-row>
      <b-col cols="3">
        <b-img thumbnail :src="attraction.firstImage" alt="Image 1"></b-img>
      </b-col>
      <b-col cols="9" style="padding: 0px">
        <h5>{{ attraction.title }}</h5>
        {{ attraction.contentTypeName }}
        <b-button
          size="sm"
          class="float-right mr-3"
          pill
          variant="outline-primary"
          @click="selectAttraction"
          >상세보기</b-button
        >
      </b-col>
    </b-row>
  </b-list-group-item>
</template>

<script>
import { mapActions } from "vuex";

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
    ...mapActions(["detailAttraction"]),
    colorChange(flag) {
      this.isColor = flag;
    },
    selectAttraction() {
      this.detailAttraction(this.attraction);
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
</style>
