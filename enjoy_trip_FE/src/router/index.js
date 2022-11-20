import Vue from "vue";
import VueRouter from "vue-router";
// import TheNavi from "@/views/TheNavi.vue";
import HomeView from "@/views/HomeView.vue";
import AppMyPage from "@/views/AppMyPage.vue";
import SignIn from "@/views/SignIn.vue";
import SignUp from "@/views/SignUp.vue";
import AppAttraction from "@/views/AppAttraction.vue";
import AppTourBoard from "@/views/AppTourBoard.vue";
import store from "@/store";

Vue.use(VueRouter);

const onlyAuthUser = async (to, from, next) => {
  console.log("author");
  const checkUserInfo = store.getters["userStore/checkUserInfo"];
  const checkToken = store.getters["userStore/checkToken"];
  let token = sessionStorage.getItem("access-token");
  console.log("---------------------");
  console.log("userInfo");
  console.log(checkUserInfo);
  console.log("token");
  console.log(checkToken);
  console.log("로그인 처리 전", checkUserInfo, token);
  if (checkUserInfo != null && token) {
    console.log("토큰 유효성 체크하러 가자!!!!");
    await store.dispatch("userStore/getUserInfo", token);
  }
  if (!checkToken || checkUserInfo === null) {
    alert("로그인이 필요한 페이지입니다..");
    // next({ name: "login" });
    router.push("/signin");
  } else {
    console.log("로그인 했다!!!!!!!!!!!!!.");
    next();
  }
};

const routes = [
  {
    path: "/",
    name: "Home",
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
    path: "/attraction",
    name: "Attraction",
    component: AppAttraction,
    // 임시
    beforeEnter: onlyAuthUser,
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
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
