<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ENJOY TRIP - BOARD</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- 커스텀 오버레이 -->
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

<main id="main"> <!-- ======= Our Services Section ======= -->
<section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center" id="head">
			<h2>일정 공유 목록</h2>
			
		</div>
	</div>
</section>
<!-- End Our Services Section -->

<!-- ======= Service Details Section ======= -->
<section class="service-details pt-4">
	<div class="container">
		<div class="row">
		</div>
	</div>
</section>
<!-- End Service Details Section -->

<!-- 일정 정보 모달 -->
<div
class="modal fade"
id="planViewModal"
data-bs-backdrop="static"
data-bs-keyboard="false"
tabindex="-1"
aria-labelledby="staticBackdropLabel"
aria-hidden="true"
>
<div class="modal-dialog modal-xl">
  <div class="modal-content">
	<div class="modal-header">
	  <h5 class="modal-title"><mark class="purple">일정 공유</mark></h5>
	  <button
		type="button"
		class="btn-close"
		data-bs-dismiss="modal"
		aria-label="Close"
	  ></button>
	</div>
	<div class="modal-body">
		<section class="services">
			<div class="container" id="plan">
			</div>
		  </section>
	</div>
  </div>
</div>
</div>

<!-- 일정 등록 Modal -->
<div
class="modal fade"
id="registerModal"
data-bs-backdrop="static"
data-bs-keyboard="false"
tabindex="-1"
aria-labelledby="staticBackdropLabel"
aria-hidden="true"
>
<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
  <div class="modal-content">
	<div class="modal-header">
	  <h5 class="modal-title"><mark class="purple">일정 등록</mark></h5>
	  <button
		type="button"
		class="btn-close"
		data-bs-dismiss="modal"
		aria-label="Close"
	  ></button>
	</div>
	<div class="modal-body">
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
								style="color: white; background-color: #1e4356; width: 100%;">검색</button>
						</div>
					</div>
					<div id="map" style="width: 100%; height: 562px"></div>
				</div>

				<!-- 여행지 리스트 -->
				<div class="col-lg-6 col-md-6 list-group overflow-auto"
					style="height: 600px" id="attraction-list"></div>
			</div>


			<!-- 계획 바구니 -->
			<div class="col-lg-12 col-md-12 list-group pt-3"
				id="attraction-cart"></div>
			
		</div>
	</div>
	<div class="modal-footer">
	  <button
		type="button"
		id="btn-join"
		class="btn btn-outline-primary"
		
		style="color: white; background-color: #1e4356"
	  >
	  등록
	  </button>
	  <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">
		닫기
	  </button>
	</div>
  </div>
</div>
</div>

</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	// 일정 공유하기 버튼
	if (`${userInfo}` != ""){
		let add = `
			<button
                type="button"
                class="btn btn-outline-primary"
				style="background-color:#5E88AA; color:white;"
				id="btn-mvjoin"
              >
			  일정 공유하기
		`;
			
		document.querySelector("#head").innerHTML += add;
	}

	// plan 보기
	fetch(`/board/list`)
	.then((response) => response.json())
	.then((data) => makeList(data));

	function makeList(articles){
		let item = ``;
		let container = document.querySelector(".row");
		articles.forEach(function(article){
			item += `
			<div class="col-1 d-flex align-items-stretche data-aos="fade-up""></div>
			<div class="col-4 d-flex align-items-stretch" data-aos="fade-up">
				<div class="card" style="width:100%" data-id="${"${article.planId}"}" ondblclick="planView(this);">
					<div class="card-img" style="position: relative; padding-top:100%; overflow: hidden;">
						<img class="img-thumbnail img-fluid w-100 h-100" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; max-width: 100%; height: auto;" src=${"${article.thumbNail}"} alt="...">
					</div>
					<div class="card-body">
						<h5 class="card-title">
							${"${article.title}"}
						</h5>
						<div class="read-more float-end">
							<label style="font-size: 15px">작성자 : ${"${article.userName}"}</label><br>
							<label style="font-size: 15px">조회수 : ${"${article.hit}"}</label>
						</div>
					</div>
				</div>
			</div>
        	<div class="col-1 d-flex align-items-stretche data-aos="fade-up""></div>
			`;
		})
		container.innerHTML = item;
	}

	// plan 상세정보 보기.
	function planView(el) {
        var modal = new bootstrap.Modal(document.getElementById("planViewModal"), {
          backdrop: false,
          keyboard: false,
        });
        let id = el.getAttribute("data-id");
        fetch("/board/list/"+id)
          .then((response) => response.json())
          .then((data) => { 
			let len = data.planInfos.length;
			let plan = document.querySelector("#plan");
			let item = ``;
			item += `
			<div class="row mb-3"><h2>${"${data.title}"}</h2></div>
			  <div class="row">
					<div class="col-md-8">
					  <div class="clearfix align-content-center">
						<p>
						  <span class="fw-bold">${"${data.userName}"}</span> <br />
						  <span class="text-secondary fw-light"> ${"${data.registerDate}"} </span>
						</p>
					  </div>
					</div>
					<div class="col-md-4 align-self-center text-end"> 조회 : ${"${data.hit + 1}"}</div>
			  </div>
			  <div class="row mt-3">
			`;
            
			if (len == 1) {
				item += `
				<div class="col-4 d-flex align-items-stretche data-aos="fade-up""></div>
				`;
				data.planInfos.forEach(function(planInfo){
					item += `
					<div class="col-4 align-items-stretche data-aos="fade-up">
	            	<div class="icon-box icon-box-pink">
	              		<div><img src="${"${planInfo.firstImage}"}" style="width:100%; height:200px"></div>
	              		<h4 class="title" style="margin-top:30px"><a href="">${"${planInfo.title}"}</a></h4>
	              		<p class="description" style="height:60px">${"${planInfo.contentDesc}"}</p>
	           		 </div>
	          		</div>
					`;
				})
			} else if (len == 2) {
				item += `
				<div class="col-2 d-flex align-items-stretche data-aos="fade-up""></div>
				`;
				data.planInfos.forEach(function(planInfo){
					item += `
					<div class="col-4 align-items-stretche data-aos="fade-up">
	            	<div class="icon-box icon-box-pink">
						<div><img src="${"${planInfo.firstImage}"}" style="width:100%; height:200px"></div>
	              		<h4 class="title" style="margin-top:30px"><a href="">${"${planInfo.title}"}</a></h4>
	              		<p class="description" style="height:60px">${"${planInfo.contentDesc}"}</p>
	            	</div>
	          	</div>
					`;
				})
			} else if (len == 3) {
				data.planInfos.forEach(function(planInfo){
					item += `
					<div class="col-4 align-items-stretche data-aos="fade-up">
	            	<div class="icon-box icon-box-pink">
						<div><img src="${"${planInfo.firstImage}"}" style="width:100%; height:200px"></div>
	              		<h4 class="title" style="margin-top:30px"><a href="">${"${planInfo.title}"}</a></h4>
	              		<p class="description" style="height:60px">${"${planInfo.contentDesc}"}</p>
	            	</div>
	          	</div>
					`;
				})
			} else {
				data.planInfos.forEach(function(planInfo){
					item += `
					<div class="col-3 align-items-stretche data-aos="fade-up">
	            	<div class="icon-box icon-box-pink">
	              		<div><img src="${"${planInfo.firstImage}"}" style="width:100%; height:200px"></div>
	              		<h4 class="title" style="margin-top:30px"><a href="">${"${planInfo.title}"}</a></h4>
	              		<p class="description" style="height:60px; overflow: hidden; text-overflow:clip;">${"${planInfo.contentDesc}"}</p>
	           		 </div>
	          	</div>
					`;
				})
			}

			// 임의로 설정한 로그인 유저
			if (data.userId==`${userInfo.userId}`){
				item += `
				</div>
				<div class="row mb-3">
				<div class="col-md-8"></div>
					<div class="col-md-4 align-self-center text-end">
						<a class="btn btn-danger" 
							id="btn-delete-view" 
							data-id="${"${data.planId}"}" 
							type="button"
							data-bs-dismiss="modal">삭제하기
						</a>
					</div>
				</div>
			`;
			} else {
				item += `
				</div>
				<div class="row mb-3">
				<div class="col-md-8"></div>
				</div>
			`;
			}
			

			plan.innerHTML = item;

            modal.show();

			// 삭제하기 버튼이 눌리면 plan 삭제하고 다시 getList
	  		document.querySelector("#btn-delete-view").addEventListener("click", function(){
				if (confirm("일정을 삭제하시겠습니까?")){
					let id = this.getAttribute("data-id");
					let config = {
						method: "DELETE",
						headers: {
						"Content-Type": "application/json",
						},
					};
					fetch("/board/plan/"+id, config)
						.then((response) => response.json())
						.then((data) => makeList(data));
				}
				
	  		})

          });
      }

	  // 모달 닫기 버튼이 눌리면 다시 getList (조회수 증가 표시를 위해서)
	  document.querySelector(".btn-close").addEventListener("click", function(){
		fetch(`/board/list`)
			.then((response) => response.json())
			.then((data) => makeList(data));
	  })

	  

</script>
<script>
	// 일정 공유하기 페이지에서 js
	window.onload = function(){
		let cartDiv = document.querySelector("#attraction-cart");
		cartDiv='';
	}
	
	document.querySelector("#button-search").addEventListener("click", function(){
		search();
	});
	
	// 엔터로 검색 가능
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
		  event.preventDefault();
		};
	  }, true);
	
	// 검색 (title로)
	function search(){
		let search = document.querySelector("#input-search").value;
		console.log("search >>> " + search);
		fetch("/attraction/search?key="+search)
		.then((response) => handleException(response))
		.then((data) => makeAttractionList(data));
	}
	
	// 에러처리
	function handleException(response){
        if (response.status == 204) { // 데이터가 없을 때
          return null;
        } else {
          return response.json();
        }
      }

	// 검색 결과 출력
	function makeAttractionList(places) {
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
				place.lattitude,
             	place.longitude
			  );
	
			  let img = "";
			  if (place.firstImage == "") {
	            img = "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg";
	          } else {
	            img = place.firstImage;
	          }
			  let contentId = place.contentId;
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
			  
			listDiv.innerHTML += `
			<a
		  class="list-group-item list-group-item-action"
		  aria-current="true"
		  id="attraction${"${contentId}"}"
		  onclick="bound(this.id, \${place.lattitude}, \${place.longitude})";
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
	
	// 관광지 장바구니 리스트
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
					<input type="hidden" id="attractionId\${size}" value="\${contentId}">
					<input type="hidden" id="attractionImg\${size}" value="\${img}">
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
									  <input type="textarea" class="form-control" id="attractionDesc\${size}"
										  placeholder="간단한 관광지 설명 혹은 계획" style="height : 80px; padding : 5px" />
								  </div>
							  </div>
						  </div>
					  </a>
				  </div>`;
			}
		}
	}
	
	// 지도 범위 재설정
	document.querySelector("#btn-mvjoin").addEventListener("click", function(){
		setTimeout(function(){
			console.log("지도 relayout");
			map.relayout();
	},1000);
		registerView();
	});

	function registerView(){
		var modal = new bootstrap.Modal(document.getElementById("registerModal"), {
          backdrop: false,
          keyboard: false,
        });
		modal.show();

		// 일정 등록 버튼
		document.querySelector("#btn-join").addEventListener("click", function(){
			if (!document.querySelector("#input-title").value) {
				alert("제목을 입력해주세요.");
			} else {
				let attractionId0 = null;
				let attractionId1 = null;
				let attractionId2 = null;
				let attractionId3 = null;
				let attractionDesc0 = null;
				let attractionDesc1 = null;
				let attractionDesc2 = null;
				let attractionDesc3 = null;
				let thumbnail = "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg";

				if (document.querySelector("#attractionId0") != null){
					attractionId0 = document.querySelector("#attractionId0").value;
				}
				if (document.querySelector("#attractionId1") != null){
					attractionId1 = document.querySelector("#attractionId1").value;
				}
				if (document.querySelector("#attractionId2") != null){
					attractionId2 = document.querySelector("#attractionId2").value;
				}
				if (document.querySelector("#attractionId3") != null){
					attractionId3 = document.querySelector("#attractionId3").value;
				}
				if (document.querySelector("#attractionDesc0") != null){
					attractionDesc0 = document.querySelector("#attractionDesc0").value;
				}
				if (document.querySelector("#attractionDesc1") != null){
					attractionDesc1 = document.querySelector("#attractionDesc1").value;
				}
				if (document.querySelector("#attractionDesc2") != null){
					attractionDesc2 = document.querySelector("#attractionDesc2").value;
				}
				if (document.querySelector("#attractionDesc3") != null){
					attractionDesc3 = document.querySelector("#attractionDesc3").value;
				}
				if (document.querySelector("#attractionImg0") != null){
					thumbnail = document.querySelector("#attractionImg0").value;
				}
				let registerinfo = {
					title:document.querySelector("#input-title").value,
					attractionId0:attractionId0,
					attractionId1:attractionId1,
					attractionId2:attractionId2,
					attractionId3:attractionId3,
					attractionDesc0:attractionDesc0,
					attractionDesc1:attractionDesc1,
					attractionDesc2:attractionDesc2,
					attractionDesc3:attractionDesc3,
					thumbnail:thumbnail,
				};
				let config = {
					method: "POST",
					headers: {
						"Content-Type": "application/json",
					},
					body: JSON.stringify(registerinfo),
				};
				fetch(`/board/plan`, config)
					.then((response) => response.json())
					.then((data) => {
						makeList(data);
						clearModal();
						modal.hide();
						
					});
			}
			
		});

	}
	

	function clearModal(){
		document.querySelector("#input-title").value = "";
		document.querySelector("#input-search").value = "";
		document.querySelector("#attraction-list").innerHTML="";
		document.querySelector("#attraction-cart").innerHTML="";
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