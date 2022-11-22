import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

// modules
import userStore from "@/store/modules/userStore";
import myPageStore from "@/store/modules/myPageStore";
import attraction from "@/store/modules/attraction";
import sideNavStore from "@/store/modules/sideNavStore";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    userStore,
    myPageStore,
    attraction,
    sideNavStore,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: sessionStorage,
    }),
  ],
});
