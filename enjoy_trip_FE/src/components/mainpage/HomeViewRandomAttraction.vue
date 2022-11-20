<template>
  <b-container class="h-100">
    <b-row class="justify-content-md-center h-100">
      <!-- no image 대응할것 없으면 css무너짐 사진 크기또한 고정 시켜야 함 -->
      <div class="card-box-cus">
        <div class="card-box-pop"></div>
        <b-card
          :img-src="`${attraction.firstImage}`"
          img-alt="Card image"
          img-left
          img-height="300px"
          img-width="300px"
          class="mb-3 w-100 h-100 img-size"
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
            <b-button variant="danger" to="/attraction"
              >지도로 바로가기</b-button
            >
            <!-- 이 부분 또한 백엔드와 연결 후, 기능 추가할것-->
            <!-- 누르면 카드를 가리면서 enjoytrip로고 나온뒤 출력하기 lazy loading용으로 나쁘지 않아보임 -->
            <b-button variant="success" @click="anotherAttraction"
              >다른 관광지 보기</b-button
            >
          </b-card-footer>
        </b-card>
      </div>
    </b-row>
  </b-container>
</template>

<script>
// const axios = require("axios");
import http from "@/api/http";

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
  },
  async created() {
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
  width: 700px;
  height: 300px;
}

/* 팝업 이펙트 넣을곳 */
.card-box-pop {
  position: absolute;
  z-index: 10;
  left: 0;
  top: 0;
  width: 700px;
  height: 300px;
  background-color: rgba(100, 100, 100, 0.5);
}
</style>
