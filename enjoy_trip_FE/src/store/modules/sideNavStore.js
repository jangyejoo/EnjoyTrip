const sideNavStore = {
  namespaced: true,
  state: {
    path: "/",
  },
  getters: {
    getPath: function (state) {
      return state.path;
    },
  },
  mutations: {
    SET_PATH: (state, path) => {
      state.path = path;
    },
  },
  actions: {
    changePath({ commit }, path) {
      commit("SET_PATH", path);
    },
  },
};

export default sideNavStore;
