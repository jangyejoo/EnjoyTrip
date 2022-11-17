<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <!-- 이메일 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group
          label="이메일:"
          label-cols-sm="3"
          valid-feedback=""
          :state="checkEmail"
          :invalid-feedback="invalidEmail"
        >
          <b-form-input
            type="email"
            v-model="user.userId"
            :state="checkEmail"
            placeholder="이메일을 입력 해주세요."
            debounce="100"
            trim
          ></b-form-input>
        </b-form-group>
      </b-col>
      <!-- 닉네임 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group
          label="닉네임:"
          label-cols-sm="3"
          valid-feedback=""
          :state="checkName"
          :invalid-feedback="invalidName"
        >
          <b-form-input
            type="text"
            v-model="user.userName"
            :state="checkName"
            placeholder="닉네임을 입력 해주세요."
            debounce="100"
            trim
          ></b-form-input>
        </b-form-group>
      </b-col>
      <!-- 비밀번호 유효성 검사 -->
      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호:" label-cols-sm="3">
          <b-form-input type="password" v-model="user.userPwd"></b-form-input>
        </b-form-group>
      </b-col>

      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호 확인:" label-cols-sm="3">
          <b-form-input type="password"></b-form-input>
        </b-form-group>
      </b-col>

      <b-button variant="primary" @click="signup">회원가입</b-button>
    </b-container>
  </div>
</template>

<script>
import http from "@/api/http";
// /^\w*@\w*\.[a-zA-Z]{2,3}$/

export default {
  name: "SignUp",
  data() {
    return {
      user: {
        userId: "",
        userName: "",
        userPwd: "",
        joinDate: null,
      },
      isUser: 0,
      isName: 0,
    };
  },
  computed: {
    checkEmail() {
      if (this.isUser == 0 && this.user.userId == "") return null;
      if (/^\w*@\w*\.[a-zA-Z]{2,3}$/.test(this.user.userId)) {
        this.checkEmailOnServer();
        if (this.isUser == 1) return false;
        return true;
      } else return false;
    },
    invalidEmail() {
      if (this.isUser == 1) return "사용할 수 없는 이메일입니다.";
      return "이메일을 입력 해주세요.";
    },
    checkName() {
      if (this.isName == 0 && this.user.userName == "") return null;
      if (this.user.userName.length >= 2 && this.user.userName.length <= 6) {
        this.checkNameOnServer();
        if (this.isName == 1) return false;
        return true;
      } else return false;
    },
    invalidName() {
      if (this.isName == 1) return "사용할 수 없는 이메일입니다.";
      return "닉네임은 2자 이상 6자 이하여야합니다.";
    },
    checkPwd() {
      if (this.isUser == 0 && this.user.userId == "") return null;
      if (/^\w*@\w*\.[a-zA-Z]{2,3}$/.test(this.user.userId)) {
        this.checkEmailOnServer();
        if (this.isUser == 1) return false;
        return true;
      } else return false;
    },
  },
  methods: {
    // 이메일 중복체크
    checkEmailOnServer() {
      http
        .post("user/idcheck", this.user)
        .then((data) => (this.isUser = data.data));
    },
    // 닉네임 중복체크
    checkNameOnServer() {
      http
        .post("user/namecheck", this.user)
        .then((data) => (this.isName = data.data));
    },
    signup() {
      http
        .post("/user/regist", this.user)
        .then((data) => console.log(data))
        .catch((error) => console.log(error));
    },
  },
};
</script>

<style></style>
