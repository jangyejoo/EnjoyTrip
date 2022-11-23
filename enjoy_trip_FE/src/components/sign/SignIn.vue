<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <!-- <div class="signform shadow-lg p-3 mb-5 bg-white rounded"> -->
      <div class="signform shadow-lg p-3 mb-5 bg-white rounded">
        <!-- logo -->
        <img src="../../assets/img/logo_keyColor.png" alt="" />
        <!-- 이메일 -->
        <b-form-group label="이메일:" label-cols-sm="3">
          <b-form-input type="email" v-model="user.userId"></b-form-input>
        </b-form-group>
        <!-- <b-row> </b-row> -->
        <!-- 비밀번호 검사 -->
        <b-form-group label="비밀번호:" label-cols-sm="3">
          <b-form-input type="password" v-model="user.userPwd"></b-form-input>
        </b-form-group>
        <!-- <b-row> </b-row> -->
        <button @click="loginbtn" class="btn">로그인</button>
        <div class="tranbox">
          <span class="findPwd" @click="goFindPwd"> 비밀번호 찾기 </span>
        </div>
      </div>
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
    // ...mapGetters("userStore", ["checkUserInfo"]),
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
      } else {
        alert("로그인에 실패하였습니다. 아이디 혹은 비밀번호를 확인해주세요.");
      }
    },
    async goFindPwd() {
      this.$router.push("/findpwd");
    },
  },
};
</script>

<style scoped>
.signform {
  width: 600px;
  border: 1px solid rgba(0, 0, 0, 0.068);
  margin: 50px auto;
  height: 500px;
  padding: 30px;
  border-radius: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-content: space-between;
  /* justify-content: space-around; */
  /* box-shadow: ; */
}

.signform img {
  margin: 0 auto;
  transform: translate(0, 10px);
}

.signform * {
  justify-content: center;
  /* margin: auto; */
}

.signform img {
  width: 200px;
}
.form-group {
  /* background-color: red; */
  width: 400px;
  margin: 0 auto;
  transform: translateY(-5px);
  justify-content: center;
}

.btn {
  background-color: white;
  width: 300px;
  margin: 0 auto;
  transform: translateY(-10px);
  color: black;
  /* font-weight: 700; */
  border: 1px solid #00ce7c;
}

.btn:hover,
.btn:active,
.btn:visited,
.btn:focus {
  background-color: #00ce7c;
  color: white;
  border: 1px solid #008550;
}

.tranbox {
  transform: translateY(-34px);
}

.findPwd {
  /* display: block;
  transform: translateY(-4px); */
  cursor: pointer;
  /* background-color: red; */
}

.findPwd:hover {
  font-weight: 700;
  /* color: #00ce7c; */
}
</style>
