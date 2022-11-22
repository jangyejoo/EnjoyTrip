<template>
  <!-- <div>
    <div>
      <b-form-input type="password"></b-form-input>
      <b-button>Button</b-button>
    </div>
  </div> -->

  <div>
    회원탈퇴를 하려면 비밀번호를 입력해주세요.
    <b-container>
      <b-form-group class="auth-input">
        <b-form-input
          type="password"
          v-model="pwd"
          style="display: inline"
        ></b-form-input>
        <b-button @click="auth" class="auth-btn">확인</b-button>
      </b-form-group>
    </b-container>
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

.auth-btn:hover {
  background-color: #00ce7c;
  /* border: 1px solid #007e4b; */
}
</style>
