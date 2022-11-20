<template>
  <div>
    <b-list-group-item>
      <b-row>
        <b-col xl="2" md="3" sm="4">
          <b-img
            :src="item.firstImage"
            alt=""
            rounded
            style="width: 100%; height: 100%"
          />
        </b-col>
        <b-col xl="10" md="9" sm="8">
          <h5 class="mb-1">{{ item.title }}</h5>
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
import { mapMutations } from "vuex";

export default {
  name: "TourBoardWriteItem",
  data() {
    return {
      text: "",
    };
  },
  props: {
    item: Object,
  },
  methods: {
    ...mapMutations(["UPDATE_ATTRACTION_CART"]),
    update() {
      const params = {
        contentId: this.item.contentId,
        text: this.text,
      };
      this.UPDATE_ATTRACTION_CART(params);
    },
  },
};
</script>

<style></style>
