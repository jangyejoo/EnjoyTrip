<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="light">
      <b-container>
        <b-navbar-brand href="#">
          <router-link to="/">
            <img src="" alt="로고" />
          </router-link>
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
          <b-navbar-nav class="mr-">
            <b-nav-item>
              <router-link to="/SignIn">SignIn</router-link>
            </b-nav-item>
            <b-nav-text>|</b-nav-text>
            <b-nav-item>
              <router-link to="/SignUp">SignUp</router-link>
            </b-nav-item>
          </b-navbar-nav>
        </b-collapse>
      </b-container>
    </b-navbar>
    <b-nav tabs>
      <b-container>
        <b-row @click="routerToggle" ref="tog">
          <b-nav-item class="ml-3" active>
            <router-link to="/">홈</router-link>
          </b-nav-item>
          <b-nav-item>
            <router-link to="/tourmap">관광지 찾기</router-link>
          </b-nav-item>
          <b-nav-item>
            <router-link to="/tourshareboard">여행 계획 게시판</router-link>
          </b-nav-item>
        </b-row>
      </b-container>
    </b-nav>
  </div>
</template>

<script>
export default {
  name: "TheNavi",
  methods: {
    routerToggle(e) {
      const items = this.$refs.tog.children;
      for (const item of items) {
        if (e.target == item.children[0])
          item.children[0].classList.add("active");
        else item.children[0].classList.remove("active");
      }
    },
  },
};
</script>

<style></style>
