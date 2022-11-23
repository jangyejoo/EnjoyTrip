<template>
  <div>
    <random-attraction></random-attraction>
    <recommand-attraction class="gap"></recommand-attraction>
  </div>
</template>

<script>
import RandomAttraction from "@/components/mainpage/HomeViewRandomAttraction.vue";
import RecommandAttraction from "@/components/mainpage/HomeViewRecommandAttraction.vue";

import { mapActions } from "vuex";

export default {
  name: "HomeView",
  components: {
    RandomAttraction,
    RecommandAttraction,
  },
  created() {
    this.getTourList();
  },
  methods: { ...mapActions("attraction", ["getTourList"]) },
};
</script>

<style>
.gap {
  margin: 40px 0;
}
</style>
