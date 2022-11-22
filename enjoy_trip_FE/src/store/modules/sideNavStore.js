const sideNavStore = {
  namespaced: true,
  state: {
    curRoute: "home",
  },
  getters: {
    getRoute: function (state) {
      return state.curRoute;
    },
  },
  mutations: {
    SET_ROUTE: (state, changedRoute) => {
      state.curRoute = changedRoute;
    },
  },
  actions: {
    changeRoute({ commit }, route) {
      commit("SET_ROUTE", route.name);
    },
  },
};

export default sideNavStore;
