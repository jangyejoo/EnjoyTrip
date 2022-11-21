<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <!-- 이메일 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group label="이메일:" label-cols-sm="3">
          <b-form-input type="email" v-model="user.userId"></b-form-input>
        </b-form-group>
      </b-col>
      <!-- 비밀번호 검사 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호:" label-cols-sm="3">
          <b-form-input type="password" v-model="user.userPwd"></b-form-input>
        </b-form-group>
      </b-col>
      <b-button variant="primary" @click="loginbtn"> 로그인 </b-button>
    </b-container>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";

// const userStore = "userStore";

export default {
  name: "SignIn",
  data() {
    return {
      user: {
        userId: "",
        userPwd: "",
      },
    };
  },
  computed: {
    ...mapState("userStore", ["isLogin", "isLoginError", "userInfo"]),
  },
  methods: {
    ...mapActions("userStore", ["userLogin", "getUserInfo"]),
    async loginbtn() {
      await this.userLogin(this.user);
      const token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token)
          .then((success) => console.log(success))
          .catch((error) => console.log(error));
        this.$router.push("/");
      }
    },
  },
};
</script>

<style></style>
