<template>
  <div>
    <b-container>
      <h2>{{ userInfo.userName }}</h2>
      <p>이메일: {{ userInfo.userId }}</p>
      <p>가입일자: {{ userInfo.joinDate }}</p>
    </b-container>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState("userStore", ["userInfo"]),
  },
};
</script>

<style></style>
