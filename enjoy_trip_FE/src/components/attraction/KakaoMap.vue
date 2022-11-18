<template>
  <b-container class="bv-example-row">
    <div id="map" width="100%"></div>
    <!-- <div class="button-group"> -->
    <!-- <button @click="changeSize(0)">Hide</button> -->
    <!-- <button @click="changeSize(400)">show</button> -->
    <!-- <button @click="displayMarker(markerPositions)">marker set 1</button> -->
    <!-- <button @click="displayMarker(markerPositions2)">marker set 2</button> -->
    <!-- <button @click="displayMarker([])">marker set 3 (empty)</button> -->
    <!-- <button @click="displayInfoWindow">infowindow</button> -->
    <!-- </div> -->
  </b-container>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "KakaoMap",
  data() {
    return {
      markers: [],
      overlays: [],
      seletedMarker: null,
      infowindow: null,
    };
  },
  computed: {
    ...mapState(["attractions", "bound"]),
  },
  watch: {
    attractions: {
      handler() {
        // 마커와 오버레이 표시
        if (this.attractions && this.attractions.length != 0) {
          // this.markers = [];
          this.setMarkers(null);
          this.setOverlays(null);
          this.displayMarker(this.attractions);
        } else {
          this.setMarkers(null);
          this.setOverlays(null);
          // this.markers = [];
        }
      },
    },
    bound: {
      handler() {
        this.rebound(this.bound);
      },
    },
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=915cffed372954b7b44804ed422b9cf0";
      document.head.appendChild(script);
    }
  },
  methods: {
    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 5,
      };

      //지도 객체를 등록합니다.
      //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
      this.map = new kakao.maps.Map(container, options);

      // 마커와 오버레이 표시
      if (this.attractions && this.attractions.length != 0) {
        // this.markers = [];
        this.setMarkers(null);
        this.setOverlays(null);
        this.displayMarker(this.attractions);
      } else {
        this.setMarkers(null);
        this.setOverlays(null);
        // this.markers = [];
      }
    },
    changeSize(size) {
      const container = document.getElementById("map");
      container.style.width = `${size}px`;
      container.style.height = `${size}px`;
      this.map.relayout();
    },
    displayMarker(markerPositions) {
      // if (this.markers.length > 0) {
      //   this.markers.forEach((marker) => marker.setMap(null));
      // }

      const positions = markerPositions.map(
        (position) =>
          new kakao.maps.LatLng(position.lattitude, position.longitude)
      );

      if (markerPositions.length > 0) {
        this.markers = markerPositions.map((position) => {
          const marker = new kakao.maps.Marker({
            map: this.map,
            position: new kakao.maps.LatLng(
              position.lattitude,
              position.longitude
            ),
          });

          const content = `<div class="map-wrap">
	                <div class="map-info">
	                    <div class="map-title">
	                        ${position.title}
                          <div class="map-close" title="닫기"></div>
	                    </div>
	                    <div class="map-body">
	                      <div class="map-img">
	                        <img src="${position.firstImage}" width="73" height="70">
	                       </div>
	                        <div class="map-desc">
	                            <div class="map-ellipsis">${position.addr1}</div>
	                            <div class="map-tel map-ellipsis">${position.tel}</div>
	                        </div>
	                    </div>
	                </div>
	            </div>`;

          // 마커 클릭 이벤트 등록
          kakao.maps.event.addListener(marker, "click", () => {
            // 마커 위에 커스텀 오버레이 표시
            var overlay = new kakao.maps.CustomOverlay({
              content: content,
              map: this.map,
              position: marker.getPosition(),
            });

            this.setOverlays(null);

            if (!this.seletedMarker || this.seletedMarker !== marker) {
              // 클릭된 마커 객체가 null이 아니면
              // 클릭된 마커의 커스텀 오버레이를 닫고

              // 생성된 오버레이를 배열에 추가합니다
              this.overlays.push(overlay);

              // 현재 클릭된 마커의 커스텀 오버레이를 띄운다
              overlay.setMap(this.map);

              var closeBtn = document.querySelector(".map-close");
              closeBtn.addEventListener("click", () => {
                overlay.setMap(null);
              });
            }

            this.seletedMarker = marker;
          });

          return marker;
        });

        const bounds = positions.reduce(
          (bounds, latlng) => bounds.extend(latlng),
          new kakao.maps.LatLngBounds()
        );

        this.map.setBounds(bounds);
      }
    },
    displayInfoWindow() {
      if (this.infowindow && this.infowindow.getMap()) {
        //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
        this.map.setCenter(this.infowindow.getPosition());
        return;
      }

      var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

      this.infowindow = new kakao.maps.InfoWindow({
        map: this.map, // 인포윈도우가 표시될 지도
        position: iwPosition,
        content: iwContent,
        removable: iwRemoveable,
      });

      this.map.setCenter(iwPosition);
    },
    setOverlays(map) {
      for (let i = 0; i < this.overlays.length; i++) {
        this.overlays[i].setMap(map);
      }
    },
    setMarkers(map) {
      if (this.markers.length > 0) {
        this.markers.forEach((marker) => {
          marker.setMap(map);
        });
      }
    },
    rebound(attraction) {
      var bounds = new kakao.maps.LatLngBounds();

      let marker = new kakao.maps.LatLng(
        attraction.lattitude,
        attraction.longitude
      );

      bounds.extend(marker);

      this.map.setBounds(bounds);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
#map {
  width: 100%;
  height: 500px;
}

.button-group {
  margin: 10px 0px;
}

.map-wrap {
  position: absolute;
  left: 0;
  bottom: 40px;
  width: 288px;
  height: 132px;
  margin-left: -144px;
  text-align: left;
  overflow: hidden;
  font-size: 12px;
  font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
  line-height: 1.5;
}

.map-wrap * {
  padding: 0;
  margin: 0;
}

.map-wrap .map-info {
  width: 286px;
  height: 120px;
  border-radius: 5px;
  border-bottom: 2px solid #ccc;
  border-right: 1px solid #ccc;
  overflow: hidden;
  background: #fff;
}

.map-wrap .map-info:nth-child(1) {
  border: 0;
  box-shadow: 0px 1px 2px #888;
}

.map-info .map-title {
  padding: 5px 40px 0 10px;
  height: 30px;
  background: #eee;
  border-bottom: 1px solid #ddd;
  font-size: 15px;
  font-weight: bold;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.map-info .map-close {
  position: absolute;
  top: 10px;
  right: 10px;
  color: #888;
  width: 17px;
  height: 17px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png");
}

.map-info .map-close:hover {
  cursor: pointer;
}

.map-info .map-body {
  position: relative;
  overflow: hidden;
}

.map-info .map-desc {
  position: relative;
  margin: 13px 0 0 90px;
  height: 75px;
}

.map-desc .map-ellipsis {
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  padding-right: 1rem;
}

.map-desc .map-jibun {
  font-size: 11px;
  color: #888;
  margin-top: -2px;
}

.map-info .map-img {
  position: absolute;
  top: 6px;
  left: 5px;
  width: 73px;
  height: 71px;
  border: 1px solid #ddd;
  color: #888;
  overflow: hidden;
}

.map-info:after {
  content: "";
  position: absolute;
  margin-left: -12px;
  left: 50%;
  bottom: 0;
  width: 22px;
  height: 12px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}

.map-info .map-link {
  color: #5085bb;
}
</style>
