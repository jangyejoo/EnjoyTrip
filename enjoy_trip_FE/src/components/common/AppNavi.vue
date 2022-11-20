<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="primary">
      <b-container>
        <b-navbar-brand to="/" @click="changeIsSide(true)">
          <img src="" alt="로고" />
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
              SignIn
            </b-nav-item>
            <b-nav-text>|</b-nav-text>
            <b-nav-item to="/SignUp" @click="changeIsSide(false)">
              SignUp
            </b-nav-item>
          </b-navbar-nav>

          <div v-else>
            {{ userInfo.userName }}
            <b-button variant="danger" to="/mypage">마이페이지</b-button>
            <button @click="logout">로그아웃</button>
          </div>
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
    async logout() {
      await this.userLogout();
    },
    changeIsSide(val) {
      this.isSide = val;
    },
  },
  components: {
    NaviSide,
  },
  mounted() {
    const curRoute = this.$route.name;
    console.log(curRoute);
    if (curRoute == "SignIn" || curRoute == "SignUp") this.isSide = false;
  },
  computed: {
    ...mapState("userStore", ["userInfo"]),
  },
};
</script>

<style></style>
