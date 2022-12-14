import Vue from "vue";
import VueRouter from "vue-router";
// import TheNavi from "@/views/TheNavi.vue";
import HomeView from "@/views/HomeView.vue";
import AppMyPage from "@/views/AppMyPage.vue";
import SignIn from "@/components/sign/SignIn.vue";
import SignUp from "@/components/sign/SignUp.vue";
import FindPwd from "@/components/sign/FindPwd.vue";
import AppAttraction from "@/views/AppAttraction.vue";
import AppTourBoard from "@/views/AppTourBoard.vue";
import store from "@/store";

Vue.use(VueRouter);

const onlyAuthUser = async (to, from, next) => {
  const checkUserInfo = store.getters["userStore/checkUserInfo"];
  const checkToken = store.getters["userStore/checkToken"];
  let token = sessionStorage.getItem("access-token");
  if (checkUserInfo != null && token) {
    await store.dispatch("userStore/getUserInfo", token);
  }
  if (!checkToken || checkUserInfo === null) {
    alert("로그인이 필요한 페이지입니다..");
    // next({ name: "login" });
    router.push("/signin");
  } else {
    next();
  }
};

const toTop = function () {
  window.scrollTo(0, 0);
};

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/mypage",
    name: "MyPage",
    component: AppMyPage,
  },
  {
    path: "/signin",
    name: "SignIn",
    component: SignIn,
  },
  {
    path: "/signup",
    name: "SignUp",
    component: SignUp,
  },
  {
    path: "/findpwd",
    name: "FindPwd",
    component: FindPwd,
  },
  {
    path: "/attraction",
    name: "Attraction",
    component: AppAttraction,
    // 임시
    // // beforeEnter: onlyAuthUser,
    redirect: "/attraction/list",
    children: [
      {
        path: "list",
        name: "attractionlist",
        component: () => import("@/components/attraction/AttractionList"),
      },
      {
        path: "map",
        name: "attractionmap",
        component: () => import("@/components/attraction/AttractionMap"),
      },
    ],
  },
  {
    path: "/tourboard",
    name: "TourBoard",
    component: AppTourBoard,
    redirect: "/tourboard/list",
    children: [
      {
        path: "list",
        name: "tourboardlist",
        component: () => import("@/components/tourboard/TourBoardList"),
      },
      {
        path: "write",
        name: "tourboardwrite",
        beforeEnter: onlyAuthUser,
        toTop,
        component: () => import("@/components/tourboard/TourBoardWrite"),
      },
      {
        path: "modify",
        name: "tourboardmodify",
        beforeEnter: onlyAuthUser,
        component: () => import("@/components/tourboard/TourBoardModify"),
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  scrollBehavior() {
    return { x: 0, y: 0 };
  },
  base: process.env.BASE_URL,
  routes,
});

export default router;
