import Vue from "vue";
import vueMoment from "vue-moment";
import moment from "moment-timezone";

moment.locale("ko");
Vue.use(vueMoment, {
  moment,
});
