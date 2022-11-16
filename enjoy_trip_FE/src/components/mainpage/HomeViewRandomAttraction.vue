<template>
  <b-container class="h-100">
    <b-row class="justify-content-md-center h-100">
      <!-- no image 대응할것 없으면 css무너짐 사진 크기또한 고정 시켜야 함 -->
      <b-card
        img-src="https://placekitten.com/300/300"
        img-alt="Card image"
        img-left
        class="mb-3 w-75 h-100"
      >
        <!-- 글이나 사진이 지나치게 길어지면 card의 크기가 변함 고정시키고 overflow대응할것 -->
        <b-card-body class="h-75">
          <b-card-text>
            <div id="info">
              <h2>관광지 이름</h2>
              <h6>주소</h6>
              <p class="desc">관광지 상세정보</p>
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
          <b-button variant="danger" to="/attraction">지도로 바로가기</b-button>
          <!-- 이 부분 또한 백엔드와 연결 후, 기능 추가할것-->
          <!-- 누르면 카드를 가리면서 enjoytrip로고 나온뒤 출력하기 lazy loading용으로 나쁘지 않아보임 -->
          <b-button variant="success" @click="sendaxios"
            >다른 관광지 보기</b-button
          >
        </b-card-footer>
      </b-card>
    </b-row>
  </b-container>
</template>

<script>
export default {
  name: "RandomAttraction",
  methods: {
    sendaxios() {
      console.log("axios test");
    },
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
</style>
