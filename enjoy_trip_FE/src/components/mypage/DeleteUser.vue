<template>
  <div>
    <div>
      회원탈퇴를 하려면 비밀번호를 입력해주세요.
      <b-form-input type="password" v-model="pwd"></b-form-input>
      <b-button @click="auth">Button</b-button>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import http from "@/api/http";
import router from "@/router";

export default {
  data() {
    return {
      pwd: "",
    };
  },
  computed: {
    ...mapState("userStore", ["userInfo"]),
  },
  methods: {
    ...mapActions("userStore", ["userLogout"]),
    auth() {
      if (this.pwd == this.userInfo.userPwd) {
        if (confirm("정말로 삭제하시겠습니까?")) {
          http
            .delete("/user/delete", { data: this.userInfo })
            .then(({ status }) => {
              if (status == 200) router.push("/");
              this.userLogout(this.userInfo.userId);
            });
        }
      } else alert("비밀번호가 틀렸습니다.");
    },
  },
};
</script>

<style></style>
