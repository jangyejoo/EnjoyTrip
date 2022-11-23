<template>
  <div>
    <b-navbar toggleable="lg" type="white" variant="white">
      <b-container>
        <b-navbar-brand @click="tog('/')">
          <img
            src="@/assets/img/logo_keyColor.png"
            alt="로고"
            style="width: 80px; cursor: pointer"
          />
        </b-navbar-brand>

        <!-- <b-navbar-toggle target="nav-collapse"></b-navbar-toggle> -->

        <b-collapse id="nav-collapse" is-nav>
          <!-- search -->
          <!-- <b-navbar-nav class="m-auto">
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
          </b-navbar-nav> -->
          <!-- 우측 섹션 -->
          <div class="collapse navbar-collapse justify-content-end">
            <b-navbar-nav class="mr-1" v-if="userInfo == null">
              <b-nav-item @click="tog('/SignIn')"> 로그인 </b-nav-item>
              <b-nav-text>|</b-nav-text>
              <!-- <b-nav-text</b-nav-text> -->
              <b-nav-item @click="tog('/SignUp')"> 회원가입 </b-nav-item>
            </b-navbar-nav>

            <b-navbar-nav class="mr-1" v-else>
              <b-nav-item class="user">
                <span>{{ userInfo.userName }}</span
                >님 반갑습니다.
              </b-nav-item>
              <b-nav-item @click="initSection('/mypage')">
                마이페이지
              </b-nav-item>
              <b-nav-text>|</b-nav-text>
              <b-nav-item @click="logout"> 로그아웃 </b-nav-item>
            </b-navbar-nav>
          </div>
        </b-collapse>
      </b-container>
    </b-navbar>
    <!-- 하위 섹션 -->
    <navi-side class="zidx"></navi-side>
  </div>
</template>

<script>
import NaviSide from "@/components/common/NaviSide.vue";
import { mapState, mapMutations, mapActions, mapGetters } from "vuex";

export default {
  name: "AppNavi",
  computed: {
    ...mapState("userStore", ["userInfo"]),
    ...mapGetters("sideNavStore", ["getPath"]),
    ...mapMutations("sideNavStore", ["SET_PATH"]),
    changeTab() {
      return this.getPath;
    },
  },

  methods: {
    ...mapActions("userStore", ["userLogout"]),
    ...mapActions("myPageStore", ["setCurSection"]),
    ...mapActions("sideNavStore", ["changePath"]),
    async logout() {
      await this.userLogout();
      this.$router.push("/");
      this.changePath("/");
    },
    initSection(link) {
      this.setCurSection("my-info");
      this.$router.push(link);
      this.changePath(link);
    },
    tog(link) {
      this.$router.push(link);
      this.changePath(link);
    },
  },
  components: {
    NaviSide,
  },
};
</script>

<style>
.nav-item .nav-link,
.navbar-text {
  color: black;
}

.nav-item .nav-link:visited {
  color: rgb(0, 0, 0);
}

.nav-item.user .nav-link {
  cursor: initial;
  font-weight: 400;
  /* color: red; */
}

.zidx {
  z-index: 100;
  background-color: white;
}

body {
  -ms-overflow-style: none;
}
::-webkit-scrollbar {
  display: none;
}
</style>
