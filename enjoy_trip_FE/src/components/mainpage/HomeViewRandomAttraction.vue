<template>
  <div class="randCon">
    <div class="anime" ref="pop">
      <b-card
        overlay
        :img-src="`${attraction.firstImage}`"
        img-alt="Card Image"
        class="randCard animate__animated animate__faster"
        ref="card"
      >
        <div class="gray">
          <div class="suggestion">
            이런 여행지는 어떠신가요?
            <b-button variant="success" @click="anotherAttraction" class="btn">
              다른 관광지 보기
            </b-button>
          </div>
          <p class="title">{{ attraction.title }}</p>
          <p class="addr">{{ attraction.addr1 }} {{ attraction.addr2 }}</p>
        </div>
      </b-card>
    </div>
  </div>
</template>

<script>
import http from "@/api/http";
import "animate.css";

export default {
  name: "RandomAttraction",
  data() {
    return {
      attraction: {
        title: "",
        addr1: "",
        addr2: "",
        contentTypeName: "",
        firstImage: "",
      },
    };
  },
  methods: {
    async anotherAttraction() {
      this.newRandAttraction();
      let sido;
      let gugun;
      // let contentType;
      // 시도 코드 랜덤 추출
      await http
        .get("/attraction/sido")
        .then((data) => data.data)
        .then(
          (list) =>
            (sido =
              list[Math.floor(Math.random() * (list.length - 0) + 0)].areaCode)
        );
      // 구군 코드 랜덤 추출
      await http
        .get(`/attraction/sido/${sido}`)
        .then((data) => data.data)
        .then(
          (list) =>
            (gugun =
              list[Math.floor(Math.random() * (list.length - 0) + 0)]
                .sigunguCode)
        );
      // 관광지타입 코드 추출
      // await http
      //   .get(`/attraction/contenttpye`)
      //   .then((data) => data.data)
      //   .then(
      //     (list) =>
      //       (contentType =
      //         list[Math.floor(Math.random() * (list.length - 0) + 0)]
      //           .contentTypeId)
      //   );

      await http
        .get(`/attraction/randlist?areaCode=${sido}&gunguCode=${gugun}`)
        .then((data) => data.data)
        .then(
          (list) =>
            (this.attraction =
              list[Math.floor(Math.random() * (list.length - 0) + 0)])
        );
    },
    newRandAttraction() {
      let cardStyle = this.$refs.card.classList;
      cardStyle.remove("animate__fadeInRightBig");
      cardStyle.add("animate__fadeOutLeftBig");
      setTimeout(() => {
        cardStyle.remove("animate__fadeOutLeftBig");
        cardStyle.add("animate__fadeInRightBig");
      }, 1000);
    },
  },
  async mounted() {
    this.anotherAttraction();
  },
};
</script>

<style scoped>
.flex-card {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

#info {
  text-align: left;
}

.desc {
  font-size: 1.2em;
}

.card-footer {
  display: flex;
  justify-content: space-around;
  position: fiexd;
  bottom: 0;
}

.card-box-cus {
  position: relative;
  width: 800px;
  height: 400px;
  padding-top: 8px;
}

/*


*/

.randCard {
  /* display: none; */
  width: 100%;
  height: 880px;
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
  overflow: hidden;
}

.gray {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.527);
  color: white;
}

.zidx {
  z-index: 5;
}

.randCardBg {
  margin: 0;
}

/*




*/

.btn,
.btn:focus {
  margin-left: 10px;
  background-color: rgba(255, 255, 255, 0);
  color: white;
  border: 1px solid #00ce7c;
}

.btn:hover,
.btn:active {
  background-color: #00ce7c !important;
  border: 1px solid #008f56;
}
.btn:focus {
  box-shadow: none;
}

.title {
  text-align: start;
  font-size: 80px;
  margin-left: 220px;
  /* margin-top: 80px; */
}

.addr {
  text-align: start;
  font-size: 40px;
  margin-left: 230px;
}

.anime {
  /* position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 880px; */
  background-position: center;
  background-size: cover;
  width: 100%;
  height: 880px;
  background-image: url("../../assets/img/or2.gif");
  /* z-index: 10; */
}

.poplogo {
  position: absolute;
  width: 400px;
  top: calc(50% - 150px);
  left: calc(50% - 200px);
}

.suggestion {
  text-align: start;
  font-size: 20px;
  margin-left: 230px;
  margin-top: 80px;
}
</style>
