<template>
  <b-row class="mt-4 mb-4 text-center">
    <b-col class="sm-3">
      <b-form-select v-model="sidoCode" :options="sidos"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select v-model="gugunCode" :options="guguns"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select v-model="category" :options="categories"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-button block variant="outline-primary">검색</b-button>
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
      categoryCode: null,
    };
  },
  computed: {
    ...mapState(["sidos", "guguns", "categories"]),
  },
  created() {
    this.CLEAR_SIDO_LIST();
    this.CLEAR_GUGUN_LIST();
    this.getSido();
  },
  methods: {
    ...mapActions(["getSido"]),
    ...mapMutations(["CLEAR_SIDO_LIST", "CLEAR_GUGUN_LIST"]),
  },
};
</script>

<style></style>
