const myPageStore = {
  namespaced: true,
  state: {
    curSection: "my-info",
  },
  getters: {
    getSection: function (state) {
      return state.curSection;
    },
  },
  actions: {
    setCurSection({ commit }, section) {
      commit("SET_CUR_SECTION", section);
    },
  },
  mutations: {
    SET_CUR_SECTION: (state, section) => {
      state.curSection = section;
    },
  },
};

export default myPageStore;
