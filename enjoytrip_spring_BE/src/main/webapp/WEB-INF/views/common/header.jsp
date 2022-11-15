<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
	<!-- Favicons -->
    <link href="${root}/assets/img/logo_color_symbol_1.png" rel="icon" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="${root}/assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="${root}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="${root}/assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${root}/assets/css/login.css" />

    <!-- =======================================================
  * Template Name: Moderna - v4.9.1
  * Template URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  </head>

  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
      <div class="container d-flex justify-content-between align-items-center">
        <div class="logo">
          <h1 class="text-light">
            <a href="${root}/"><span>Enjoy Trip</span></a>
          </h1>
          <!-- Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html"><img src="${root}/assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
          <ul>
          <c:choose>
          <c:when test="${empty userInfo}">
            <li class="login"><a href="${root}/login">로그인</a></li>
            <li class="login"><a href="${root}/regist">회원가입</a></li>
          </c:when>
          <c:otherwise>
            <li><label class="nav-link disabled" style="color:white">${userInfo.userName}님 반갑습니다.</label></li>
            <li class="logout"><a href="${root}/logout" id="btn-logout">로그아웃</a></li>
            <li class="logout">
              <a href="${root}/infoprofile">마이페이지</a>
            </li>
          </c:otherwise>
          </c:choose>
            <li><a href="${root}/board">일정 공유</a></li>
            <li><a href="${root}/attraction">여행지 추천</a></li>
            <li><a href="${root}/attraction/facilities">여행지 주변시설</a></li>
          </ul>
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->
      </div>
    </header>
    <!-- End Header -->    