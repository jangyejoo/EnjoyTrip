<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>ENJOY TRIP - INDEX</title>
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

<%@ include file="/common/header.jsp"%>

<main id="main"> <!-- ======= Why Us Section ======= --> <!-- End Why Us Section -->
<section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<!-- <h2>관광지 정보</h2> -->
			<ol>
				<li><a href="${root}/main.jsp">Home</a></li>
				<li>여행지 일정 공유</li>
			</ol>
		</div>
		<h2 class="text-center mt-5 mb-3">여행지 일정 공유</h2>
	</div>
</section>

<section style="padding-bottom: 0">
	<div class="form" style="max-width: 1500px">
		<form id="write-form" method="POST" action="">
			<input type="hidden" name="act" value="write">
			<div class="container-sm">
				<input type="text" class="form-control" id="input-title"
					name="title" placeholder="제목" />

				<div class="row" style="height: 600px">
					<div class="col-lg-6 col-md-6 h-100">
						<div class="row mb-0">
							<div class="col-lg-9 col-md-9">
								<input type="text" class="form-control" placeholder="검색"
									aria-label="Recipient's username"
									aria-describedby="button-addon2" id="input-search"
									onkeyup="if(window.event.keyCode==13){search()}" />
							</div>
							<div class="col-lg-3 col-md-3">
								<button class="btn btn-outline-secondary" type="button"
									id="button-search"
									style="color: white; background-color: #1e4356">검색</button>
							</div>
						</div>
						<div id="map" style="width: 100%; height: 534px"></div>
					</div>

					<!-- 여행지 리스트 -->
					<div class="col-lg-6 col-md-6 list-group overflow-auto"
						style="height: 600px" id="attraction-list"></div>
				</div>


				<!-- 계획 바구니 -->
				<div class="col-lg-12 col-md-12 list-group pt-3"
					id="attraction-cart"></div>
				<button type="submit" class="btn mt-3" id="write"
					style="color: white; background-color: #1e4356">등록</button>
			</div>
		</form>
	</div>
</section>
</main>


<!-- End #main -->

<%@ include file="/common/footer.jsp"%>

<script>
      window.onload = function(){
    	  //List<String> img = new ArrayList<>();
    	 // List<String> title = new ArrayList<>();
    	  let cartDiv = document.querySelector("#attraction-cart");
    	  cartDiv='';
      }
      
      document.querySelector("#button-search").addEventListener("click", function(){
    	  search();
      });
      
      document.addEventListener('keydown', function(event) {
    	  if (event.keyCode === 13) {
    	    event.preventDefault();
    	  };
    	}, true);
      
      function search(){
    	  let search = document.querySelector("#input-search").value;
    	  console.log("search >>> " + search);
    	  fetch("${root}/board?act=attraction&search="+search)
          .then((response) => response.text())
          .then((data) => makeList(data));
      }
      
      function makeList(data) {
          let parser = new DOMParser();
          const xml = parser.parseFromString(data, "application/xml");
          let places = xml.querySelectorAll("item");
          if(places.length == 0){
          	alert("검색 결과가 없습니다!");
          } else {
          hideMarkers();
          setOverlays(null);
          initMarkers();
          initOverlays();
          var bounds = new kakao.maps.LatLngBounds();
          
          let listDiv = document.querySelector("#attraction-list");
	          listDiv.innerHTML = '';
	         let index = 0;
  	        [].forEach.call(places, function (place) {
  	          let marker = new kakao.maps.LatLng(
  	            place.querySelectorAll("lattitude")[0].textContent,
  	            place.querySelectorAll("longitude")[0].textContent
  	          );
  	
  	          let img = "";
  	          if (place.querySelectorAll("firstimage")[0].textContent == "") {
  	            img = "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg";
  	          } else {
  	            img = place.querySelectorAll("firstimage")[0].textContent;
  	          }
  	          let contentId = place.querySelectorAll("contentid")[0].textContent;
  	          let title = place.querySelectorAll("title")[0].textContent;
  	          let addr1 = place.querySelectorAll("addr1")[0].textContent;
  	          let tel = place.querySelectorAll("tel")[0].textContent
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
  	                            <div class="ellipsis">${"${
  	                              addr1
  	                            }"}</div>
  	                            <div class="tel ellipsis">${"${
  	                              tel
  	                            }"}</div>
  	                        </div>
  	                    </div>
  	                </div>
  	            </div>`;
  	          addMarker(marker, content, bounds);
  	          
  	        listDiv.innerHTML += `
  	        <a
            class="list-group-item list-group-item-action"
            aria-current="true"
            id="attraction${"${contentId}"}"
            onclick="bound(this.id, \${place.querySelectorAll("lattitude")[0].textContent}, \${place.querySelectorAll("longitude")[0].textContent})";
          >
            <div class="row">
              <div class="col-3">
                <img
                  src=${"${img}"}
                  class="img-fluid"
                  alt=""
                  style="height: 100px"
                />
              </div>
              <div class="col-9">
                <div class="d-flex justify-content-between">
                  <h5 class="mb-1"> ${"${title}"}</h5>
                  <small>
                    <div class="form-check form-switch">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        role="switch"
                        id="checkbox${"${contentId}"}"
                        name="contentDesc${"${contentId}"}"
                        onclick="updateList(this.id, this.checked, \${contentId}, '\${img}', '\${title}')"
                      />
                    </div>
                  </small>
                </div>
                <p class="mb-1" style="text-align: left">
                ${"${addr1}"}
                </p>
                <p class="mb-1" style="text-align: left">
                ${"${tel}"}
                </p>
              </div>
            </div>
          </a>
  	          `;
  	          
  	          index++;
  	          if (document.querySelector(`#attractioncart${"${contentId}"}`) != null){
  	        	  let checkbox = listDiv.querySelector(`#checkbox${"${contentId}"}`);
  	        	checkbox.setAttribute("checked","true");
  	          }
  	        });
  	
  	        setBounds(bounds);
          }
        }
      
      function bound(clickedId, lat, lon){
    	  var bounds = new kakao.maps.LatLngBounds();
    	  
    	  let marker = new kakao.maps.LatLng(
    	            lat, lon
    	          );
          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(marker);
            
          setBounds(bounds);
      }
      
      function updateList(clickedId, checked, contentId, img, title){
    	  let cart = document.querySelector("#attraction-cart");
    	  let size = cart.getElementsByTagName("a").length;
    	  if (checked == false){
    		  let child = document.querySelector(`#attractioncart${"${contentId}"}`);
    		  cart.removeChild(child);
    	  } else {
    		  if (size >= 4){
        		  alert("여행지는 최대 4개까지 추가 가능합니다.");
        		  document.querySelector(`#checkbox\${contentId}`).checked = false;
        	  } else {
        		  cart.innerHTML += `
        		  <div id="attractioncart${"${contentId}"}" >
        			  <input type="hidden" name="attractionId\${size}" value="\${contentId}">
        			  <input type="hidden" name="attractionImg\${size}" value="\${img}">
        	    	  <a class="list-group-item list-group-item-action"
        					aria-current="true" style="height: 150px" >
        					<div class="row">
        						<div class="col-2">
        							<img
        								src="\${img}"
        								class="img-fluid" alt="" style="height: 134px" />
        						</div>
        						<div class="col-10">
        							<div class="d-flex justify-content-between">
        								<h5 class="mb-1">\${title}</h5>
        							</div>
        							<div class="form-floating mt-3">
        								<input type="textarea" class="form-control" id="floatingInput" name="attractionDesc\${size}"
        									placeholder="간단한 관광지 설명 혹은 계획" style="height : 80px; padding : 5px" />
        							</div>
        						</div>
        					</div>
        				</a>
        			</div>`;
        	  }
    	  }
      }
      
      document.querySelector("#write").addEventListener("click", function(){
    	  let form = document.querySelector("#write-form");
          form.setAttribute("action", "${root}/board");
          form.submit();
      });
      
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
