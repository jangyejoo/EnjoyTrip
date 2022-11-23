<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <!-- <div class="signform shadow-lg p-3 mb-5 bg-white rounded"> -->
      <div class="signform shadow-lg p-3 mb-5 bg-white rounded" ref="box">
        <!-- logo -->
        <img src="../../assets/img/logo_keyColor.png" alt="" />
        <h4 v-if="!isLoading">비밀번호 찾기</h4>
        <!-- 이메일 -->
        <b-form-group
          label="이메일"
          label-cols-sm="3"
          v-if="!isLoading"
          style="text-align: left"
        >
          <b-form-input type="email" v-model="user.userId"></b-form-input>
        </b-form-group>
        <button @click="findPwd" class="btn" v-if="!isLoading">
          <div class="emptybox">비밀번호 찾기</div>
        </button>

        <div class="tranbox" v-if="!isLoading">
          <span class="findPwd" @click="goSignIn"> 로그인 </span>
        </div>
        <div class="spinfix" v-if="isLoading">
          <b-spinner label="Loading..."></b-spinner>
        </div>
      </div>
    </b-container>
  </div>
</template>

<script>
import http from "@/api/http";
import { mapActions, mapState } from "vuex";

// const userStore = "userStore";

export default {
  name: "SignIn",
  data() {
    return {
      user: {
        userId: "",
      },
      isUser: 3,
      isLoading: false,
    };
  },
  computed: {
    ...mapState("userStore", ["isLogin", "isLoginError", "userInfo"]),
    // ...mapGetters("userStore", ["checkUserInfo"]),
  },
  methods: {
    ...mapActions("userStore", ["userLogin", "getUserInfo"]),
    async findPwd() {
      await this.checkEmailOnServer();
      console.log(this.isUser);
      if (this.isUser == 1) {
        this.isLoading = true;
        console.log("isuser");
        await http.post("user/findpwd", this.user).then(({ data }) => {
          if (data.message == "success") {
            alert("이메일로 전달된 비밀번호를 확인해주세요.");
            this.$router.push("/signin");
            this.isLoading = false;
          } else {
            this.isLoading = false;
            alert("에러발생");
          }
        });
      } else {
        alert("잘못된 입력입니다.");
      }
      this.isUser == 3;
    },
    goSignIn() {
      this.$router.push("/signin");
    },
    async checkEmailOnServer() {
      console.log(this.user.userId);
      await http.post("user/idcheck", this.user).then(({ data }) => {
        this.isUser = data;
      });
    },
  },
};
</script>

<style scoped>
.signform {
  position: relative;
  width: 600px;
  border: 1px solid rgba(0, 0, 0, 0.068);
  margin: 50px auto;
  height: 500px;
  padding: 30px;
  border-radius: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  /* align-content: space-between; */
  /* justify-content: space-around; */
  /* box-shadow: ; */
}

.signform img {
  margin: 0 auto;
  transform: translate(0, 10px);
}

.signform * {
  /* justify-content: center; */
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
  /* justify-content: center; */
}

.emptybox {
  padding: 0;
  margin: 0;
  width: 100%;
  height: 100%;
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

.spinfix {
  position: absolute;
  bottom: calc(50% - 1rem);
  left: calc(50% - 1rem);
}

.dpnone {
  display: none;
}
</style>
