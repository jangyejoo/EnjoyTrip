<template>
  <b-list-group-item
    @click="rebound"
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
        <b-form-checkbox
          v-model="checked"
          name="check-button"
          switch
          class="float-right mr-3"
          size="lg"
        >
        </b-form-checkbox>
      </b-col>
    </b-row>
  </b-list-group-item>
</template>

<script>
import { mapActions, mapMutations, mapState } from "vuex";

export default {
  name: "TourBoardMapItem",
  data() {
    return {
      isColor: false,
      checked: false,
      already: false,
    };
  },
  props: {
    attraction: Object,
  },
  computed: {
    ...mapState(["attractioncart", "searchlist"]),
  },
  created() {
    this.setCheckBox();
  },
  watch: {
    checked: {
      handler() {
        if (this.checked) {
          this.ADD_ATTRACTION_CART(this.attraction);
        } else {
          this.DELETE_ATTRACTION_CART(this.attraction);
        }
      },
    },
    attractioncart: {
      handler() {
        // // 일단 4개까지만 담을 수 있게 막아 놓음!!
        // if (this.attractioncart.length >= 4) {
        //   this.canAdd = false;
        // }
      },
    },
    attraction: {
      handler() {
        this.setCheckBox();
      },
    },
  },
  methods: {
    ...mapActions(["detailAttraction"]),
    ...mapMutations([
      "SET_BOUND",
      "ADD_ATTRACTION_CART",
      "DELETE_ATTRACTION_CART",
    ]),
    colorChange(flag) {
      this.isColor = flag;
    },
    selectAttraction() {
      this.detailAttraction(this.attraction);
    },
    rebound() {
      this.SET_BOUND(this.attraction);
    },
    setCheckBox() {
      this.checked = false;
      this.already = false;
      this.attractioncart.forEach((item) => {
        if (item.contentId == this.attraction.contentId) {
          this.checked = true;
          this.already = true;
        }
      });
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
