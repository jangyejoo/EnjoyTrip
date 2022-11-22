<template>
  <div>
    <div v-if="!isAuth">
      개인정보 수정을 하려면 비밀번호를 입력해주세요.
      <b-container>
        <b-form-group class="auth-input">
          <b-form-input
            type="password"
            v-model="authPwd"
            style="display: inline"
          ></b-form-input>
          <b-button @click="auth" class="auth-btn">확인</b-button>
        </b-form-group>
      </b-container>
    </div>
    <div v-else>
      <!-- <div> -->
      <b-container>
        <!-- 이메일 -->
        <b-col sm="6" offset-sm="3">
          <b-form-group label="이메일:" label-cols-sm="3">
            <b-form-input type="email" disabled v-model="userInfo.userId">
            </b-form-input>
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
              v-model="newName"
              :state="checkName"
              placeholder="닉네임을 입력 해주세요."
              debounce="100"
              trim
            ></b-form-input>
          </b-form-group>
        </b-col>

        <!-- 비밀번호 -->
        <b-col sm="6" offset-sm="3" v-if="wantPwdChange">
          <b-form-group
            label="새 비밀번호:"
            label-cols-sm="3"
            :state="checkPwd"
            invalid-feedback="특수문자($,@,$,!,%,*,#,?,&)와 문자를 포함한 6~16글자여야 합니다."
          >
            <b-form-input
              type="password"
              v-model="newPwd"
              :state="checkPwd"
            ></b-form-input>
          </b-form-group>
        </b-col>

        <b-col sm="6" offset-sm="3" v-if="wantPwdChange">
          <b-form-group
            label="비밀번호 확인:"
            label-cols-sm="3"
            :state="dblcheckPwd"
            invalid-feedback="비밀번호가 같지 않습니다."
          >
            <b-form-input
              type="password"
              v-model="isPwd"
              :state="dblcheckPwd"
            ></b-form-input>
          </b-form-group>
        </b-col>
        <div class="btn-container">
          <b-button @click="wantPassChange">비밀번호 변경하기</b-button>

          <b-button
            variant="primary"
            :disabled="availableModify"
            @click="modify"
          >
            회원정보 수정
          </b-button>
        </div>
      </b-container>
    </div>
  </div>
</template>

<script>
import http from "@/api/http";

import { mapState, mapActions } from "vuex";

export default {
  data() {
    return {
      authPwd: "",
      isAuth: false,
      newName: "",
      newPwd: "",
      isPwd: "",
      isName: 0,
      wantPwdChange: false,
    };
  },
  computed: {
    ...mapState("userStore", ["userInfo"]),
    // ...mapMutations("userStore", ["SET_USER_INFO"]),
    checkName() {
      if (this.isName == 0 && this.newName == "") return null;
      if (
        this.newName.length >= 2 &&
        this.newName.length <= 6
        //  &&
        // this.userInfo.userName != this.newName
      ) {
        this.checkNameOnServer();
        if (this.isName == 1) return false;
        return true;
      } else return false;
    },
    invalidName() {
      if (this.isName == 1) return "사용할 수 없는 닉네임입니다.";
      return "닉네임은 2자 이상 6자 이하여야합니다.";
    },
    checkPwd() {
      if (this.newPwd == "") return null;
      if (
        /^(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\d$@!%*#?&]{6,16}$/.test(
          this.newPwd
        )
      ) {
        return true;
      } else return false;
    },
    dblcheckPwd() {
      if (this.isPwd == "") return null;
      if (this.newPwd == this.isPwd) return true;
      return false;
    },
    availableModify() {
      if (this.newName != "" && this.isName == 0 && !this.wantPwdChange)
        return false;
      if (
        this.newPwd != "" &&
        this.newName != "" &&
        this.isName == 0 &&
        this.isPwd == this.newPwd
      )
        return false;
      return true;
    },
  },
  methods: {
    ...mapActions("userStore", ["modifyUserInfo"]),
    ...mapActions("myPageStore", ["setCurSection"]),
    auth() {
      if (this.authPwd == this.userInfo.userPwd) this.isAuth = true;
      else alert("비밀번호가 틀렸습니다.");
    },
    checkNameOnServer() {
      const map = {
        userId: this.userInfo.userId,
        userName: this.newName,
      };
      http
        .post("user/modifynamecheck", map)
        .then((data) => (this.isName = data.data));
    },
    wantPassChange() {
      this.wantPwdChange = !this.wantPwdChange;
    },
    modify() {
      const map = {
        userId: this.userInfo.userId,
        userName: this.newName,
        userPwd: this.wantPwdChange ? this.newPwd : this.userInfo.userPwd,
      };

      http.put("/user/editProfile", map).then(({ status }) => {
        if (status == 200) {
          const map = {
            userId: this.userInfo.userId,
            userName: this.newName,
            userPwd: this.wantPwdChange ? this.newPwd : this.userInfo.userPwd,
            joinDate: this.userInfo.joinDate,
          };
          this.modifyUserInfo(map);
          this.setCurSection("my-info");
        }
      });
    },
  },
  created() {
    this.newName = this.userInfo.userName;
  },
};
</script>

<style scoped>
.auth-input {
  width: 500px;
  margin: auto;
  /* border: 2px solid red; */
}

.auth-input input {
  margin-top: 10px;
  width: 300px;
  margin-right: 30px;
}

.auth-btn {
  background-color: white;
  color: black;
  border: 1px solid #00ce7c;
}

.auth-btn:hover,
.auth-btn:active,
.auth-btn:focus {
  background-color: #00ce7c !important;
}

.btn-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
  margin: auto;
}

.btn-container button {
  margin: 10px 0;
  width: 200px;
  background-color: white;
  color: black;
  border: 1px solid #00ce7c;
}

.btn-container button:hover,
.btn-container button:active,
.btn-container button:focus {
  background-color: #00ce7c !important;
  color: white;
}
</style>
