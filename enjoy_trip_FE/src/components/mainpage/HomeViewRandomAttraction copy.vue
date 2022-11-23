<template>
  <b-container class="h-100">
    <!-- <h1 class="animate__animated animate__bounce">An animated element</h1> -->
    <h3 class="title">이 장소는 어떤가요?</h3>
    <b-row class="justify-content-md-center h-100">
      <!-- no image 대응할것 없으면 css무너짐 사진 크기또한 고정 시켜야 함 -->
      <!-- <b-button @click="newRandAttraction">bool</b-button> -->
      <div class="card-box-cus">
        <div class="card-box-pop animate__animated animate_custom" ref="pop">
          <img
            src="../../assets/img/logo_keyColor01.png"
            alt=""
            class="animate__animated animate_custom"
            ref="popimg"
          />
        </div>

        <b-card
          :img-src="`${attraction.firstImage}`"
          img-alt="Card image"
          img-left
          img-height="400px"
          img-width="400px"
          class="mb-3 w-100 h-100 img-size"
          ref="card"
        >
          <!-- 글이나 사진이 지나치게 길어지면 card의 크기가 변함 고정시키고 overflow대응할것 -->
          <b-card-body class="h-75">
            <b-card-text>
              <div id="info">
                <h3>{{ attraction.title }}</h3>
                <h6>{{ attraction.addr1 }} {{ attraction.addr2 }}</h6>
                <!-- <p class="desc">{{ attraction.contentTypeName }}</p> -->
              </div>
            </b-card-text>
          </b-card-body>
          <b-card-footer
            footer-bg-variant="white"
            footer-border-variant="white"
            footer-class="card-footer"
            align-v="end"
          >
            <!-- attraction에는 지도 정보를 같이 줘서 이동 -->
            <b-button variant="success" to="/attraction" class="btn">
              지도로 바로가기
            </b-button>
            <!-- 이 부분 또한 백엔드와 연결 후, 기능 추가할것-->
            <!-- 누르면 카드를 가리면서 enjoytrip로고 나온뒤 출력하기 lazy loading용으로 나쁘지 않아보임 -->
            <b-button variant="success" @click="anotherAttraction" class="btn">
              다른 관광지 보기
            </b-button>
          </b-card-footer>
        </b-card>
      </div>
    </b-row>
  </b-container>
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
      let pop = this.$refs.pop.classList;
      let popImg = this.$refs.popimg.classList;
      pop.remove("animate__bounceOut");
      pop.add("animate__bounceIn");
      cardStyle.add("dp");

      setTimeout(() => {
        popImg.add("animate__tada");
        pop.remove("animate__bounceIn");
      }, 1000);

      setTimeout(() => {
        popImg.remove("animate__tada");
      }, 1800);

      setTimeout(() => {
        pop.add("animate__bounceOut");
        cardStyle.remove("dp");
      }, 2300);
    },
  },
  async mounted() {
    this.anotherAttraction();
    // this.newRandAttraction();
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

/* 팝업 이펙트 넣을곳 */
.card-box-pop {
  position: absolute;
  z-index: 5;
  left: 0;
  top: 1px;
  width: 800px;
  height: 400px;
  /* transform: translateY(1px); */
  border-radius: 3px;
  background-image: url("../../assets/img/popbg.webp");
  background-size: cover;
}

.card-box-pop img {
  width: 300px;
  position: absolute;
  left: calc(50% - 150px);
  top: calc(50% - 90px);
}

.animate_custom {
  animation-duration: 0.8s;
}

.dp {
  display: none;
}
/* .zIdx {
  z-index: 20;
} */

/* .bg1 {
  background-image: ;
} */

.btn {
  background-color: white;
  color: black;
  border: 1px solid #00ce7c;
}

.btn:hover,
.btn:active,
.btn:focus {
  background-color: #00ce7c !important;
  border: 1px solid #008f56;
}

.title {
  text-align: start;
  margin: 10px 0;
  margin-left: 15px;
  box-sizing: border-box;
  border-radius: 4px;
  color: black;
  font-weight: 400;
}
</style>
