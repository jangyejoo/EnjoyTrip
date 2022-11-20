<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <!-- 이메일 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group label="이메일:" label-cols-sm="3">
          <b-form-input type="email"></b-form-input>
        </b-form-group>
      </b-col>
      <!-- 비밀번호 검사 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호:" label-cols-sm="3">
          <b-form-input type="password"></b-form-input>
        </b-form-group>
      </b-col>
      <b-button variant="primary" @click="loginbtn"> 로그인 </b-button>
      <b-button variant="primary" @click="logooout"> 로그아웃 </b-button>
    </b-container>
  </div>
</template>

<script>
// import userStore from "@/store/modules/userStore";
import { mapActions, mapState } from "vuex";

// const userStore = "userStore";

export default {
  name: "SignIn",
  // data() {
  //   return {
  //     isLogin: null,
  //   };
  // },
  computed: {
    ...mapState("userStore", ["isLogin", "isLoginError", "userInfo"]),
  },
  methods: {
    ...mapActions("userStore", ["userLogin", "getUserInfo", "userLogout"]),
    async loginbtn() {
      const user = {
        userId: "aa@aa.aa",
        userPwd: "@aaaaa",
      };
      await this.userLogin(user);
      const token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token);
        // this.$router.push("/");
      }
    },
    async logooout() {
      await this.userLogout("aa@aa.aa");
    },
  },
};
</script>

<style></style>
