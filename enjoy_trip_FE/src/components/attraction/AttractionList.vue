<template>
  <b-container
    v-if="attractions && attractions.length != 0"
    class="bv-example-row mt-3"
  >
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 mt-3">
      <attraction-list-item
        v-for="(attraction, index) in attractions"
        :key="index"
        :attraction="attraction"
      ></attraction-list-item>
    </div>
  </b-container>
  <b-container v-else class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show variant="danger">관광지가 없습니다.</b-alert>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import AttractionListItem from "@/components/attraction/AttractionListItem.vue";
import { mapState } from "vuex";

export default {
  name: "AttractionList",
  components: {
    AttractionListItem,
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(["attractions"]),
  },
};
</script>

<style></style>
