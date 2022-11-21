<template>
  <div>
    <b-navbar toggleable="lg" type="white" variant="white">
      <b-container>
        <b-navbar-brand to="/" @click="changeIsSide(true)">
          <img
            src="@/assets/img/logo_keyColor.png"
            alt="로고"
            style="width: 80px"
          />
        </b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <!-- search -->
          <b-navbar-nav class="m-auto">
            <b-nav-form>
              <b-form-input
                size="sm"
                class="mr-sm-2"
                placeholder="Search"
              ></b-form-input>
              <b-button size="sm" class="my-2 my-sm-0" type="submit"
                >Search</b-button
              >
            </b-nav-form>
          </b-navbar-nav>
          <!-- 우측 섹션 -->
          <b-navbar-nav class="mr-1" v-if="userInfo == null">
            <b-nav-item to="/SignIn" @click="changeIsSide(false)">
              로그인
            </b-nav-item>
            <b-nav-text>|</b-nav-text>
            <!-- <b-nav-text</b-nav-text> -->
            <b-nav-item to="/SignUp" @click="changeIsSide(false)">
              회원가입
            </b-nav-item>
          </b-navbar-nav>

          <b-navbar-nav class="mr-1" v-else>
            <p>
              {{ userInfo.userName }}
            </p>
            <b-nav-item to="/mypage" @click="initSection">
              마이페이지
            </b-nav-item>
            <b-nav-text>|</b-nav-text>
            <!-- <b-nav-text</b-nav-text> -->
            <b-nav-item @click="logout"> 로그아웃 </b-nav-item>
          </b-navbar-nav>

          <!-- <div v-else>
            {{ userInfo.userName }}
            <b-button variant="danger" to="/mypage" @click="initSection">
              마이페이지
            </b-button>
            <button @click="logout">로그아웃</button>
          </div> -->
        </b-collapse>
      </b-container>
    </b-navbar>
    <!-- 하위 섹션 -->
    <navi-side v-show="isSide"></navi-side>
  </div>
</template>

<script>
import NaviSide from "@/components/common/NaviSide.vue";
import { mapState, mapActions } from "vuex";

export default {
  // import NaviSide from "@/components/common/Navi.Side.vue",

  name: "AppNavi",
  data() {
    return {
      isSide: true,
    };
  },
  methods: {
    ...mapActions("userStore", ["userLogout"]),
    ...mapActions("myPageStore", ["setCurSection"]),
    async logout() {
      await this.userLogout();
    },
    changeIsSide(val) {
      this.isSide = val;
    },
    initSection() {
      this.setCurSection("my-info");
    },
  },
  components: {
    NaviSide,
  },
  mounted() {
    const curRoute = this.$route.name;
    if (curRoute == "SignIn" || curRoute == "SignUp") this.isSide = false;
  },
  computed: {
    ...mapState("userStore", ["userInfo"]),
  },
};
</script>

<style scoped>
.nav-item .nav-link,
.navbar-text {
  color: black;
}

.nav-item .nav-link:visited {
  color: rgb(0, 0, 0);
}
</style>
