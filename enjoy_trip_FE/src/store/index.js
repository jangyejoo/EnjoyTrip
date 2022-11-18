import Vue from "vue";
import Vuex from "vuex";
import http from "@/api/http";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    sidos: [{ value: null, text: "시도선택" }],
    guguns: [{ value: null, text: "구군선택" }],
    categories: [{ value: 0, text: "전체" }],
    attractions: [],
    detail: null,
    isModalOpen: false,
    bound: null,
  },
  getters: {
    modalState(state) {
      return state.isModalOpen;
    },
  },
  mutations: {
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.areaCode, text: sido.areaName });
      });
    },
    SET_GUGUN_LIST(state, guguns) {
      guguns.forEach((gugun) => {
        state.guguns.push({
          value: gugun.sigunguCode,
          text: gugun.sigunguName,
        });
      });
    },
    SET_CATEGORY_LIST(state) {
      state.categories = [
        { value: 0, text: "전체" },
        { value: 12, text: "관광지" },
        { value: 14, text: "문화시설" },
        { value: 15, text: "행사/공연/축제" },
        { value: 25, text: "여행코스" },
        { value: 28, text: "레포츠" },
        { value: 32, text: "숙박" },
        { value: 38, text: "쇼핑" },
        { value: 39, text: "음식점" },
      ];
    },
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "시도선택" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "구군선택" }];
    },
    SET_ATTRACTION_LIST(state, attractions) {
      state.attractions = attractions;
    },
    SET_DETAIL_ATTRACTION(state, attraction) {
      state.detail = attraction;
    },
    SET_BOUND(state, attraction) {
      state.bound = attraction;
    },
    MODAL_SWITCH(state, value) {
      state.isModalOpen = value;
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get(`/attraction/sido`)
        .then(({ data }) => {
          commit("SET_SIDO_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getGugun({ commit }, sidoCode) {
      http
        .get(`/attraction/sido/${sidoCode}`)
        .then(({ data }) => {
          commit("SET_GUGUN_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getAttractionList({ commit }, params) {
      http
        .get(`/attraction/facilities/list`, { params })
        .then(({ data }) => {
          commit("SET_ATTRACTION_LIST", data);
          commit("MODAL_SWITCH", false);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detailAttraction({ commit }, attraction) {
      http
        .get(`/attraction/detail/${attraction.contentId}`)
        .then(({ data }) => {
          commit("SET_DETAIL_ATTRACTION", data);
          commit("MODAL_SWITCH", true);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  modules: {},
});
