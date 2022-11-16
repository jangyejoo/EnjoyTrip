import Vue from "vue";
import Vuex from "vuex";
import http from "@/api/http";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    sidos: [{ value: null, text: "시도선택" }],
    guguns: [{ value: null, text: "구군선택" }],
    categories: [{ value: null, text: "전체" }],
  },
  getters: {},
  mutations: {
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.areaCode, text: sido.areaName });
      });
    },
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "시도선택" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "구군선택" }];
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get(`/attraction/sido`)
        .then(({ data }) => {
          console.log(data);
          commit("SET_SIDO_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  modules: {},
});
