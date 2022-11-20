<template>
  <div>
    <my-info v-if="getSection == 'my-info'"></my-info>
    <modify-user v-else-if="getSection == 'modify-info'"></modify-user>
  </div>
</template>

<script>
import ModifyUser from "@/components/mypage/ModifyUser.vue";
import MyInfo from "@/components/mypage/MyInfo.vue";

import { mapActions, mapGetters } from "vuex";

// const myPageStore = "myPageStore";

export default {
  computed: {
    ...mapGetters("myPageStore", ["getSection"]),
  },
  methods: {
    ...mapActions("myPageStore", ["setCurSection"]),
  },
  components: {
    ModifyUser,
    MyInfo,
  },
};
</script>

<style scoped>
div {
  border: 1px solid black;
}
</style>
