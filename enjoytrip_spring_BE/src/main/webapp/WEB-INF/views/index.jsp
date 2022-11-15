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

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- ======= Hero No Slider Section ======= -->
<section id="hero-no-slider"
	class="d-flex justify-cntent-center align-items-center">
	<div class="container position-relative" data-aos="fade-up"
		data-aos-delay="100">
		<div class="row justify-content-center">
			<div class="col-xl-12">
				<h2 class="animate__animated animate__fadeInDown"
					style="color: skyblue">
					여행가자! <span>EnjoyTrip!</span>
				</h2>
				<p class="animate__animated animate__fadeInUp"
					style="font-size: 22px">
					당신만의 여행 장소를 찾아 떠나세요.<br /> 당신의 행복한 여행을 기원합니다!<br /> Enjoy Your
					Trip!!<br />
				</p>
				<h2 class="animate__animated animate__fadeInDown">
					<br /> <br />
				</h2>
				<h4 class="animate__animated animate__fadeInDown"
					style="color: skyblue">↓↓ 지금 당신의 근처엔 ↓↓</h4>
				<div class="button-box" style="padding-bottom: 20px">
					<br />
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Hero No Slider Section -->

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

<main id="main">
	<!-- ======= Why Us Section ======= -->
	<!-- End Why Us Section -->
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
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

      window.onload = function(){
    	  if (navigator.geolocation) {

    		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    		    navigator.geolocation.getCurrentPosition(function (position) {
    		        var lat = position.coords.latitude; // 위도
    		        var lon = position.coords.longitude; // 경도
    		    
    		        console.log(lat);
    		        console.log(lon);
    		    
    		        var link = "${root}/attraction/defaultlist?lat="+lat+"&lon="+lon;
    		        
    		        curPlaceTourist(link);
    		        });
    		    } else {
    		        lon = 37.5012743,
    		            lat = 127.039585;
    		            
    		        link = "${root}/attraction/defaultlist?lat="+lat+"&lon="+lon;
    		        
    		    curPlaceTourist(link);
    		}
      }

	  // 위치기반 관광지 추천
      function curPlaceTourist(link) {
		    console.log(link);
		    fetch(link)
		    	.then((response) => handleException(response))
		    	.then((data) => makeList(data));
		}

		// 에러처리
		function handleException(response){
        if (response.status == 204) { // 데이터가 없을 때
          return null;
        } else {
          return response.json();
        }
      }

		function makeList(attractions) {
		    for (let index = 0; index < 4; index++) {
		            let contentId = attractions[index].contentId;
		            let contentTitle = attractions[index].title;
		            let contentImg = attractions[index].firstImage;
		            
		            let aEl = document.createElement("a");
			        let sectionId = "section_"+index;
			        aEl.setAttribute("href", "#"+sectionId);
			        aEl.setAttribute("class", "btn-get-started animate__animated animate__fadeInUp");
			        aEl.innerText = contentTitle;
			        document.querySelector(".button-box").appendChild(aEl);
			        
		            section = `
				        <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200" id=${"${sectionId}"} style="width: 100%; height: 80%;"  data-id="${"${contentId}"}" ondblclick="attractionView(this);">
				        <div class="container" >
				          <div class="row">
				            <div class="col-lg-6 text-center">
				              <img src=${"${contentImg}"} alt="" style="width:100%; height:100%"/>
				            </div>

				            <div class="col-lg-6 d-flex flex-column justify-content-center p-5">
				              <div class="icon-box">
				                <h4 class="title">${"${contentTitle}"}</h4>
				              </div>
				            </div>
				          </div>
				        </div>
				      </section>
				        `;
						document.querySelector("#main").innerHTML += section;
					}
		}
    </script>
</body>
</html>
