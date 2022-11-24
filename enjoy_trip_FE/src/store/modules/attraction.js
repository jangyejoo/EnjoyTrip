import http from "@/api/http";

const attraction = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "시도선택" }],
    guguns: [{ value: null, text: "구군선택" }],
    categories: [{ value: 0, text: "전체" }],
    attractions: [],
    detail: null,
    isAttractionModalOpen: false,
    isTourModalOpen: false,
    bound: null,
    tours: [],
    tour: null,
    searchlist: [],
    attractioncart: [],
  },
  getters: {
    // 관광지 조회
    attractionModalState(state) {
      return state.isAttractionModalOpen;
    },
    // 여행 계획 게시판
    tourModalState(state) {
      return state.isTourModalOpen;
    },
  },
  actions: {
    // 관광지 조회
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
          commit("ATTRACTION_MODAL_SWITCH", false);
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
          commit("ATTRACTION_MODAL_SWITCH", true);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    // 여행 계획 게시판
    getTourList({ commit }) {
      http
        .get(`/board/list`)
        .then(({ data }) => {
          commit("SET_TOUR_LIST", data);
          // commit("TOUR_MODAL_SWITCH", false);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detailTour({ commit }, tour) {
      http
        .get(`/board/list/${tour.planId}`)
        .then(({ data }) => {
          commit("SET_DETAIL_TOUR", data);
          commit("TOUR_MODAL_SWITCH", true);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getSearchList({ commit }, params) {
      http
        .get(`/attraction/search`, { params })
        .then(({ data }) => {
          commit("SET_SEARCH_LIST", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    async writePlan({ commit }, map) {
      await http
        .post("/board/plan", Object.fromEntries(map))
        .then(({ data }) => {
          commit("SET_TOUR_LIST", data);
          commit("TOUR_MODAL_SWITCH", false);
        })
        .catch((error) => console.log(error));
    },
    modifyPlan({ commit }, map) {
      http
        .put("/board/plan", Object.fromEntries(map))
        .then(({ data }) => {
          commit("SET_TOUR_LIST", data);
          data.forEach((item) => {
            if (item.planId == map.get("planId")) {
              http
                .get(`/board/list/${item.planId}`)
                .then(({ data }) => {
                  commit("SET_DETAIL_TOUR", data);
                  commit("TOUR_MODAL_SWITCH", true);
                })
                .catch((error) => {
                  console.log(error);
                });
            }
          });
        })
        .catch((error) => console.log(error));
    },
    deletePlan({ commit }, plan) {
      http
        .delete(`/board/plan/${plan.planId}`)
        .then(({ data }) => {
          commit("SET_TOUR_LIST", data);
          commit("TOUR_MODAL_SWITCH", false);
        })
        .catch((error) => console.log(error));
    },
  },
  mutations: {
    // 관광지 조회
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
    ATTRACTION_MODAL_SWITCH(state, value) {
      state.isAttractionModalOpen = value;
    },
    // 여행 계획 게시판
    SET_TOUR_LIST(state, tours) {
      state.tours = tours;
    },
    SET_DETAIL_TOUR(state, tour) {
      state.tour = tour;
    },
    TOUR_MODAL_SWITCH(state, value) {
      state.isTourModalOpen = value;
    },
    SET_SEARCH_LIST(state, searchlist) {
      state.searchlist = searchlist;
    },
    CLEAR_SEARCH_LIST(state) {
      state.searchlist = [];
    },
    CLEAR_ATTRACTION_LIST(state) {
      state.attractioncart = [];
    },
    ADD_ATTRACTION_CART(state, attraction) {
      state.attractioncart.push({
        title: attraction.title,
        firstImage: attraction.firstImage,
        contentId: attraction.contentId,
        attractionDesc: "",
      });
    },
    DELETE_ATTRACTION_CART(state, attraction) {
      let cart = state.attractioncart;
      cart.forEach((item, index) => {
        if (item.contentId == attraction.contentId) {
          cart.splice(index, 1);
        }
      });
    },
    UPDATE_ATTRACTION_CART(state, params) {
      let cart = state.attractioncart;
      cart.forEach((item, index) => {
        if (item.contentId == params.contentId) {
          cart[index].attractionDesc = params.text;
        }
      });
    },
    SET_ATTRACTION_CART(state, planInfos) {
      state.attractioncart = [];
      planInfos.forEach((item) => {
        state.attractioncart.push({
          title: item.title,
          firstImage: item.firstImage,
          contentId: item.contentId,
          attractionDesc: item.contentDesc,
        });
      });
    },
  },
};
export default attraction;
