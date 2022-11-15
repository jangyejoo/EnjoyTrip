import Vue from "vue";
import VueRouter from "vue-router";
// import TheNavi from "@/views/TheNavi.vue";
import HomeView from "@/views/HomeView.vue";
import MemberView from "@/views/MemberView.vue";
import SignIn from "@/views/SignIn.vue";
import SignUp from "@/views/SignUp.vue";
import TourMap from "@/views/TourMapView.vue";
import TourShareBoard from "@/views/TourShareBoard.vue";

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
    name: "SiginIn",
    component: SignIn,
  },
  {
    path: "/signup",
    name: "SiginUp",
    component: SignUp,
  },
  {
    path: "/tourmap",
    name: "TourMap",
    component: TourMap,
  },
  {
    path: "/tourshareboard",
    name: "TourShareBoard",
    component: TourShareBoard,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
