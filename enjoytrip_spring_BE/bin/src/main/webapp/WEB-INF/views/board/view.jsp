<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ENJOY TRIP - BOARD</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  
<%@ include file="/common/header.jsp"%>

  <main id="main">

    <!-- ======= Our Services Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>일정 공유하기</h2>
          <ol>
            <li><a href="${root}/user">Home</a></li>
            <li><a href="${root}/board?act=list">일정 공유</a></li>
            <li>일정 상세 보기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Our Services Section -->

    <!-- ======= Services Section ======= -->
    <section class="services">
      <div class="container">
		<div class="row mb-3"><h2>${article.title}</h2></div>
      <div class="row">
            <div class="col-md-8">
              <div class="clearfix align-content-center">
                <p>
                  <span class="fw-bold">${name}</span> <br />
                  <span class="text-secondary fw-light"> ${article.registerDate} </span>
                </p>
              </div>
            </div>
            <div class="col-md-4 align-self-center text-end"> 조회 : ${article.hit + 1}</div>
      </div>
        <div class="row mt-3">
        	<c:choose>
        	<c:when test="${fn:length(article.contentTitles) == 1}">
        	<!-- 1개 있을 때 -->
        	<div class="col-4 d-flex align-items-stretche data-aos="fade-up""></div>
        	<c:forEach begin="0" end="${fn:length(article.contentTitles)-1}" step="1" varStatus="i">
        		<div class="col-4 align-items-stretche data-aos="fade-up">
	            <div class="icon-box icon-box-pink">
	              <div><img src="${article.contentImages[i.index]}" style="width:100%; height:200px"></div>
	              <h4 class="title" style="margin-top:30px"><a href="">${article.contentTitles[i.index]}</a></h4>
	              <p class="description" style="height:60px">${article.contentDescs[i.index]}</p>
	            </div>
	          </div>
        	</c:forEach>
        	
        	</c:when>
        	<c:when test="${fn:length(article.contentTitles) == 2}">
        	<!-- 2개 있을 때 -->
        	<div class="col-2 d-flex align-items-stretche data-aos="fade-up""></div>
        	<c:forEach begin="0" end="${fn:length(article.contentTitles)-1}" step="1" varStatus="i">
        		<div class="col-4 align-items-stretche data-aos="fade-up">
	            <div class="icon-box icon-box-pink">
	              <div><img src="${article.contentImages[i.index]}" style="width:100%; height:200px"></div>
	              <h4 class="title" style="margin-top:30px"><a href="">${article.contentTitles[i.index]}</a></h4>
	              <p class="description" style="height:60px">${article.contentDescs[i.index]}</p>
	            </div>
	          </div>
        	</c:forEach>
        	</c:when>
        	<c:when test="${fn:length(article.contentTitles) == 3}">
        	<!-- 3개 있을 때 -->
        	<c:forEach begin="0" end="${fn:length(article.contentTitles)-1}" step="1" varStatus="i">
        		<div class="col-4 align-items-stretche data-aos="fade-up">
	            <div class="icon-box icon-box-pink">
	              <div><img src="${article.contentImages[i.index]}"  style="width:100%; height:200px"></div>
	              <h4 class="title" style="margin-top:30px"><a href="">${article.contentTitles[i.index]}</a></h4>
	              <p class="description" style="height:60px">${article.contentDescs[i.index]}</p>
	            </div>
	          </div>
        	</c:forEach>
        	</c:when>
        	<c:otherwise>
        	<!-- 4개 있을 때 -->
        	<c:forEach begin="0" end="${fn:length(article.contentTitles)-1}" step="1" varStatus="i">
        		<div class="col-3 align-items-stretche data-aos="fade-up">
	            <div class="icon-box icon-box-pink">
	              <div><img src="${article.contentImages[i.index]}" style="width:100%; height:200px"></div>
	              <h4 class="title" style="margin-top:30px"><a href="">${article.contentTitles[i.index]}</a></h4>
	              <p class="description" style="height:60px; overflow: hidden; text-overflow:clip;">${article.contentDescs[i.index]}</p>
	            </div>
	          </div>
        	</c:forEach>
        	</c:otherwise>
        	</c:choose>
        </div>
        <div class="row mb-3">
        <div class="col-md-8"></div>
            <div class="col-md-4 align-self-center text-end">
            	<a class="btn" style="background-color:#5E88AA; color:white" href="${root}/board?act=list">목록보기</a>
		        <!-- 본인 글이면 보이게끔 -->
		        <c:if test="${userInfo.userName == name}">
	  				<a class="btn btn-danger" id="btn-delete-view">삭제하기</a>
       			</c:if>
            </div>
        </div>

      </div>
    </section><!-- End Services Section -->



  </main><!-- End #main -->

  
<%@ include file="/common/footer.jsp"%>
<script>
	document.querySelector("#btn-delete-view").addEventListener("click", function(){
		if(!confirm("정말로 삭제하시겠습니까?")){
			return;
		}else{
			location.href = "${root}/board?act=delete&planId=${article.planId}";
		}
	});
</script>

</body>

</html>