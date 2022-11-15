<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.attraction.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>ENJOY TRIP - 여행지 추천</title>
<meta content="" name="description" />
<meta content="" name="keywords" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<main id="main">
	<!-- ======= Our Portfolio Section ======= -->
	<section class="breadcrumbs">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<!-- <h2>관광지 정보</h2> -->
				<ol>
					<li><a href="${root}/main.jsp">Home</a></li>
					<li>여행지 추천</li>
				</ol>
			</div>
			<h2 class="text-center mt-5 mb-3">여행지 추천</h2>
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
					<button type="button" id="list-btn" class="btn btn-outline-primary"
						style="width: 100%">Go!</button>
				</div>
			</div>
		</div>
	</section>
	<!-- End Our Portfolio Section -->

	<!-- ======= Portfolio Section ======= -->
	<section class="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active">전체</li>
						<li data-filter=".filter-tourist">관광지</li>
						<li data-filter=".filter-cultural">문화시설</li>
						<li data-filter=".filter-event">행사/공연/축제</li>
						<li data-filter=".filter-reports">레포츠</li>
						<li data-filter=".filter-lodgment">숙박</li>
						<li data-filter=".filter-shopping">쇼핑</li>
						<li data-filter=".filter-restaurant">음식점</li>
					</ul>
				</div>
			</div>

			<div class="row portfolio-container" data-aos="fade-up"
				data-aos-easing="ease-in-out" data-aos-duration="500"
				style = "height: 1000px;">
					<div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
          <div class="col-lg-4 col-md-6 portfolio-wrap photo">
            <div class="portfolio-item"></div>
          </div>
			</div>
		</div>
	</section>
	<!-- End Portfolio Section -->

  <!-- 관광지 정보 모달 -->
  <div
  class="modal fade"
  id="attractionViewModal"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  tabindex="-1"
  aria-labelledby="staticBackdropLabel"
  aria-hidden="true"
>
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><mark class="purple">관광지 상세정보</mark></h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="modal-body">
        <section id="portfolio-details" class="portfolio-details">
          <div class="container">
            <div class="row gy-4">
              <div class="col-lg-8">
                <div class="portfolio-details-slider swiper">
                  <div class="swiper-wrapper align-items-center">
                    <div class="swiper-slide"></div>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 infoDiv"></div>
            </div>
            <div class="col-lg-12 overviewDiv"></div>
          </div>
        </section>
      </div>
    </div>
  </div>
</div>

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

    // 관광지 상세정보 보기.
    function attractionView(el) {
        var modal = new bootstrap.Modal(document.getElementById("attractionViewModal"), {
          backdrop: true,
          keyboard: false,
        });
        let id = el.getAttribute("data-id");
        fetch("${root}/attraction/detail/"+id)
          .then((response) => response.json())
          .then((data) => {
            let imgContainer = document.querySelector(".swiper-slide");
            let img = '';
            if (data.firstImage == ''){
              img += `
                <img src="https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg" alt=""/>
              `;
            } else {
              img += `<img src=${"${data.firstImage}"} alt="" />`;
            }
            imgContainer.innerHTML = img;
           
            let infoContainer = document.querySelector(".infoDiv");
            let info = ``;
            info += `
            <div class="portfolio-info">
            <h3>${"${data.title}"}</h3>
                  <ul>
                    <li class="category">
                      <strong>Category</strong>: ${"${data.contentTypeName}"}
                    </li>
            `;
            if (data.addr1 != ''){
              info += `
              <li class="address">
                        <strong>Address</strong>: ${"${data.addr1}"}
                        ${"${data.addr2}"}
                      </li>
              `;
            }
            if (data.tel != ''){
              info += `
                <li class="tel"><strong>Tel</strong>: ${"${data.tel}"}</li> 
              `;
            }
            info += `
              </ul>
              </div>
            `;
            infoContainer.innerHTML = info;
          
            let overviewContainer = document.querySelector(".overviewDiv");
            let overview = '';
            if (data.overview != null){
              overview += `
                <div class="portfolio-description">
                    <h2>Overview</h2>
                    <p>${"${data.overview}"}</p>
                  </div>
              `;
            }
            overviewContainer.innerHTML = overview;

            modal.show();
          });
      }

    // 지역별 관광지 조회  
    document.querySelector("#list-btn").addEventListener("click", function () {
        let gugunSel = document.querySelector("#gugun");
        let gugunCode = gugunSel[gugunSel.selectedIndex].value;
        let sidoSel = document.querySelector("#sido");
        let sidoCode = sidoSel[sidoSel.selectedIndex].value;
		
        fetch("${root}/attraction/list?areaCode="+sidoCode+"&gunguCode="+gugunCode)
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
          let portfolios = document.querySelectorAll(".photo");
        if(attractions == null){
        	alert("추천 여행지가 없습니다!");
        } else {
        	for (let index = 0; index < 18; index++) {
        		let container = document.querySelector(".portfolio-container");
        		if (attractions[index] == null){
        			container.removeChild(portfolios[index]);
        			continue;
        		}
          let div = '';
            switch (attractions[index].contentTypeId) {
                  case 12:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-tourist");           
                    break;
                  case 14:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-cultural"); 
                    break;
                  case 15:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-event"); 
                    break;
                  case 28:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-reports"); 
                    break;
                  case 32:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-lodgment"); 
                    break;
                  case 38:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-shopping"); 
                    break;
                  case 39:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo filter-restaurant"); 
                    break;
                  default:
                    portfolios[index].setAttribute("class", "col-lg-4 col-md-6 portfolio-wrap photo"); 
                   break;
                }
            div += `
						<div class="portfolio-item" data-id="${"${attractions[index].contentId}"}" ondblclick="attractionView(this);">
							<img src="${"${attractions[index].firstImage}"}" class="img-fluid" alt="" />
							<div class="portfolio-info">
								<h3 class="title">${"${attractions[index].title}"}</h3>
							</div>
						</div>
					</div>
            `;
            portfolios[index].innerHTML = div;
          }

        }
      }
    
      window.onload = function () {
    	  if (navigator.geolocation) {

    		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    		    navigator.geolocation.getCurrentPosition(function (position) {
    		        var lat = position.coords.latitude; // 위도
    		        var lon = position.coords.longitude; // 경도
    		    
    		        console.log("lat : "+lat);
    		        console.log("lon : "+lon);
    		        
    		          fetch("${root}/attraction/defaultlist?lat="+lat+"&lon="+lon)
    		          .then((response) => response.json())
    		          .then((data) => makeList(data));
    		    	
    		        });
    		    } else {
    		        lon = 37.5012743,
    		        lat = 127.039585;
    		        
    		        fetch("${root}/attraction/defaultlist?lat="+lat+"&lon="+lon)
  		          	.then((response) => response.json())
  		          	.then((data) => makeList(data));
    		            
    		}
    	  
      };
      
    </script>
</body>
</html>
