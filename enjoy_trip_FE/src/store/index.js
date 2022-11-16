import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    sidos: [{ value: null, text: "시도선택" }],
    guguns: [{ value: null, text: "구군선택" }],
    categories: [{ value: null, text: "전체" }],
  },
  getters: {},
  mutations: {},
  actions: {},
  modules: {},
});
