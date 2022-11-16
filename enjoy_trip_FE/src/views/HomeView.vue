<template>
  <div>
    <random-attraction></random-attraction>
    <recommand-attraction></recommand-attraction>
  </div>
</template>

<script>
import RandomAttraction from "@/components/mainpage/HomeViewRandomAttraction.vue";
import RecommandAttraction from "@/components/mainpage/HomeViewRecommandAttraction.vue";

export default {
  name: "HomeView",
  components: {
    RandomAttraction,
    RecommandAttraction,
  },
};
</script>

<style></style>
