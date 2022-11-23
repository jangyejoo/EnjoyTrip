<template>
  <div>
    <b-list-group-item>
      <b-row>
        <b-col xl="2" md="3" sm="4">
          <b-img :src="item.firstImage" alt="" rounded />
        </b-col>
        <b-col xl="10" md="9" sm="8">
          <h5>
            {{ item.title }}
            <b-button
              class="float-right"
              variant="outline"
              size="sm"
              @click="deleteItem"
              >X</b-button
            >
          </h5>

          <b-form-textarea
            id="textarea"
            v-model="text"
            @input="update"
            placeholder="간단한 관광지 설명 혹은 계획..."
            rows="3"
            max-rows="3"
          ></b-form-textarea>
        </b-col>
      </b-row>
    </b-list-group-item>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";

export default {
  name: "TourBoardWriteItem",
  data() {
    return {
      text: "",
    };
  },
  computed: {
    ...mapState("attraction", ["attractioncart"]),
  },
  watch: {
    attractioncart: {
      handler() {
        let cart = this.attractioncart;
        cart.forEach((item, index) => {
          if (item.contentId == this.item.contentId) {
            this.text = cart[index].attractionDesc;
          }
        });
      },
    },
  },
  props: {
    item: Object,
  },
  methods: {
    ...mapMutations("attraction", [
      "UPDATE_ATTRACTION_CART",
      "DELETE_ATTRACTION_CART",
    ]),
    update() {
      const params = {
        contentId: this.item.contentId,
        text: this.text,
      };
      this.UPDATE_ATTRACTION_CART(params);
    },
    deleteItem() {
      this.DELETE_ATTRACTION_CART(this.item);
    },
  },
};
</script>

<style scoped>
img {
  width: 100%;
  max-height: 118px;
}
</style>
