<template>
  <b-row class="mt-4 mb-4 text-center">
    <b-col class="sm-3">
      <b-form-select
        v-model="sidoCode"
        :options="sidos"
        @change="gugunList"
      ></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select v-model="gugunCode" :options="guguns"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select
        v-model="categoryCode"
        :options="categories"
      ></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-button block variant="outline" @click="search">검색</b-button>
    </b-col>
  </b-row>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

export default {
  name: "AttractionSearchBar",
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
      categoryCode: 0,
    };
  },
  computed: {
    ...mapState("attraction", ["sidos", "guguns", "categories"]),
  },
  created() {
    this.CLEAR_SIDO_LIST();
    this.CLEAR_GUGUN_LIST();
    this.SET_CATEGORY_LIST();
    this.getSido();
  },
  methods: {
    ...mapActions("attraction", ["getSido", "getGugun", "getAttractionList"]),
    ...mapMutations("attraction", [
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "SET_CATEGORY_LIST",
    ]),
    gugunList() {
      this.CLEAR_GUGUN_LIST();
      this.gugunCode = null;
      if (this.sidoCode) this.getGugun(this.sidoCode);
    },
    search() {
      if (this.gugunCode) {
        const params = {
          areaCode: this.sidoCode,
          gunguCode: this.gugunCode,
          optionCode: this.categoryCode,
        };
        this.getAttractionList(params);
      }
    },
  },
};
</script>

<style scoped>
.btn {
  color: #00ce7c;
  border: 1px solid #00ce7c;
}
.btn:hover {
  color: white;
  background-color: #00ce7c; /* border: 1px solid #007e4b; */
}
</style>
