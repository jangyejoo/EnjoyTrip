import Vue from "vue";
import VueRouter from "vue-router";
// import TheNavi from "@/views/TheNavi.vue";
import HomeView from "@/views/HomeView.vue";
import MemberView from "@/views/MemberView.vue";
import SignIn from "@/views/SignIn.vue";
import SignUp from "@/views/SignUp.vue";
import AppAttraction from "@/views/AppAttraction.vue";
import AppTourBoard from "@/views/AppTourBoard.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: HomeView,
  },
  {
    path: "/member",
    name: "Member",
    component: MemberView,
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
