<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>ENJOY TRIP - 여행지 주변시설</title>
<meta content="" name="description" />
<meta content="" name="keywords" />

<!-- 커스텀 오버레이 복붙 -->
<style>
.wrap {
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

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 15px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png");
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: "";
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}

.info .link {
	color: #5085bb;
}
</style>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<main id="main">
  <!-- ======= Contact Section ======= -->
  <section class="breadcrumbs">
    <div class="container">
      <div class="d-flex justify-content-between align-items-center">
        <ol>
          <li><a href="${root}/main.jsp">Home</a></li>
          <li>여행지 주변시설</li>
        </ol>
      </div>
      <h2 class="text-center mt-5 mb-3">여행지 주변시설</h2>
      <div class="row col-md-12 justify-content-center mb-2">
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="sido">
            <option value="">시도선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="gugun">
            <option value="">구군선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="option">
            <option value="">옵션선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <button
            type="button"
            id="list-btn"
            class="btn btn-outline-primary"
            style="width: 100%"
          >
            Go!
          </button>
        </div>
      </div>
    </div>
  </section>
  <!-- End Contact Section -->
  <!-- ======= Map Section ======= -->
  <div id="map" style="width: 100%; height: 650px"></div>
  <!-- End Map Section -->
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<!-- select box -->
<script>
  //시도 옵션
  fetch(`/attraction/sido`)
    .then((response) => response.json())
    .then((data) => makeSidoList(data));
    
    function makeSidoList(areas) {
    	let opt = ``;
  	  let options = document.querySelector("#sido");
        options.length = 0;
        let len = options.length;
        for (let i = len - 1; i >= 0; i--) {
          options.remove(i);
        }
        opt += `<option value="">시도선택</option>`;
        areas.forEach(function (area) {
        	opt += `
        	<option value=${"${area.areaCode}"}>${"${area.areaName}"}</option>
        	`;
        });
        options.innerHTML = opt;
    }
    
	//시도가 바뀌면 구군정보 얻기.
    document.querySelector("#sido").addEventListener("change", function () {
      if (this[this.selectedIndex].value) {
        let regcode = this[this.selectedIndex].value;
        
        fetch("/attraction/sido/"+regcode)
        .then((response) => response.json())
        .then((data) => makeSigunguList(data));
        
      } else {
     	  let options = document.querySelector("#gugun");
        options.length = 0;
        let len = options.length;
        for (let i = len - 1; i >= 0; i--) {
          options.remove(i);
        }
      }
    });

    // 구군 옵션
    function makeSigunguList(sigungus) {
        let opt = ``;
        let options = document.querySelector("#gugun");
        options.length = 0;
        let len = options.length;
        for (let i = len - 1; i >= 0; i--) {
           options.remove(i);
        }
        opt += `<option value="">구군선택</option>`;
        sigungus.forEach(function (sigungu) {
        	opt += `
        	<option value=${"${sigungu.sigunguCode}"}>${"${sigungu.sigunguName}"}</option>
        	`;
        });
        options.innerHTML = opt;
      }

      // 숙박/이벤트 옵션
      document.querySelector("#gugun").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let opt = ``;
          let options = document.querySelector("#option");
          options.length = 0;
          let len = options.length;
          for (let i = len - 1; i >= 0; i--) {
            options.remove(i);
          }
          opt += `<option value="0" selected>옵션선택</option>`;
          opt += `<option value="32">숙박</option>`;
          opt += `<option value="15">이벤트</option>`;
          document.querySelector("#option").innerHTML = opt;
        } else {
        	let options = document.querySelector("#option");
            options.length = 0;
            let len = options.length;
            for (let i = len - 1; i >= 0; i--) {
              options.remove(i);
            }
        }
      });

      document.querySelector("#list-btn").addEventListener("click", function () {
        let gugunSel = document.querySelector("#gugun");
        let gugunCode = gugunSel[gugunSel.selectedIndex].value;
        let sidoSel = document.querySelector("#sido");
        let sidoCode = sidoSel[sidoSel.selectedIndex].value;
        let optionSel = document.querySelector("#option");
        let optionCode = optionSel[optionSel.selectedIndex].value;

        fetch("${root}/attraction/facilities/list?areaCode="+sidoCode+"&gunguCode="+gugunCode+"&optionCode="+optionCode)
          .then((response) => handleException(response))
          .then((data) => makeList(data));
      });

      // 에러처리
      function handleException(response){
        if (response.status == 204) { // 데이터가 없을 때
          return null;
        } else {
          return response.json();
        }
      }

      function makeList(attractions) {
        if(attractions == null){
        	alert("주변 숙박/이벤트가 없습니다!");
        } else {
        hideMarkers();
        setOverlays(null);
        initMarkers();
        initOverlays();
        var bounds = new kakao.maps.LatLngBounds();
	        [].forEach.call(attractions, function (place) {
	          let marker = new kakao.maps.LatLng(
              place.lattitude,
              place.longitude
	            // place.querySelectorAll("lattitude")[0].textContent,
	            // place.querySelectorAll("longitude")[0].textContent
	          );
	
	          let img = "";
	          if (place.firstImage == "") {
	            img = "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg";
	          } else {
	            img = place.firstImage;
	          }
	          let title = place.title;
	          let addr1 = place.addr1;
	          let tel = place.tel;
	          var content = `<div class="wrap">
	                <div class="info">
	                    <div class="title">
	                        ${"${title}"}
	                    </div>
	                    <div class="body">
	                      <div class="img">
	                        <img src=${"${img}"} width="73" height="70">
	                       </div>
	                        <div class="desc">
	                            <div class="ellipsis">${"${addr1}"}</div>
	                            <div class="tel ellipsis">${"${tel}"}</div>
	                        </div>
	                    </div>
	                </div>
	            </div>`;
	          addMarker(marker, content, bounds);
	        });
	
	        setBounds(bounds);
        }
      }
    </script>

<!-- kakao map -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e0c610333bef001013383b1cf4c1a9a"></script>
<script>
      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

      // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
      var markers = [];

      // 지도에 표시된 커스텀 오버레이 객체를 가지고 있을 배열입니다
      var overlays = [];

      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
      if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {
          var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

          // 마커와 인포윈도우를 표시합니다
          displayMarker(locPosition, message);
        });
      } else {
        // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
          message = "geolocation을 사용할수 없어요..";

        displayMarker(locPosition, message);
      }

      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          map: map,
          position: locPosition,
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
          iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
          content: iwContent,
          removable: iwRemoveable,
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);

        // 생성된 오버레이를 배열에 추가합니다
        overlays.push(infowindow);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
      }

      // 마커 하나를 지도위에 표시합니다
      // addMarker(new kakao.maps.LatLng(33.450701, 126.570667));

      var seletedMarker = null; // 클릭한 마커를 담을 변수

      // 마커를 생성하고 지도위에 표시하는 함수입니다
      function addMarker(position, content, bounds) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          position: position,
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);

        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(position);

        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
        kakao.maps.event.addListener(marker, "click", function () {
          // 마커 위에 커스텀오버레이를 표시합니다
          // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
          var overlay = new kakao.maps.CustomOverlay({
            content: content,
            map: map,
            position: marker.getPosition(),
          });

          setOverlays(null);

          if (!seletedMarker || seletedMarker !== marker) {
            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 커스텀 오버레이를 닫고

            // 생성된 오버레이를 배열에 추가합니다
            overlays.push(overlay);

            // 현재 클릭된 마커의 커스텀 오버레이를 띄운다
            overlay.setMap(map);
          }

          seletedMarker = marker;
        });
      }

      // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
      function setMarkers(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
        }
      }

      // 배열에 추가된 커스텀 오버레이들을 지도에 표시하거나 삭제하는 함수입니다
      function setOverlays(map) {
        for (var i = 0; i < overlays.length; i++) {
          overlays[i].setMap(map);
        }
      }

      // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
      function showMarkers() {
        setMarkers(map);
      }

      // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
      function hideMarkers() {
        setMarkers(null);
      }

      function setBounds(bounds) {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        map.setBounds(bounds);
      }

      function initMarkers() {
        markers = [];
      }

      function initOverlays() {
        overlays = [];
      }
    </script>
</body>
</html>
