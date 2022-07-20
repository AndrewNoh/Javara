<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Personal Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  
  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


	<script type="text/javascript"
   src="https://developers.kakao.com/sdk/js/kakao.js" charset="utf-8"></script>

   <script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>

<!-- Kakao 지도 서비스 관련 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
<!-- Daum 우편번호 서비스 관련  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/css/sweetalert2.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet" >
  <link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
  <!-- =======================================================
  * Template Name: Personal - v4.7.0
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>

  <!-- ======= Header ======= -->
  <c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />
   <c:set var="mainURI" value="/marketapp/"/>
   <c:set var="mainURI2" value="/marketapp/location/MainPage.do" />
   <c:if test="${URI != mainURI && URI != mainURI2}">
   	 	<form id="logoutForm" method="post" action="<c:url value="/security/logout.do"/>">
	          		<sec:csrfInput/>
				</form> 
	   	<nav id="navbar" class="navbar custom-navbar mx-5" >
			<a href="<c:url value="/location/MainPage.do"/>"><img src="${pageContext.request.contextPath}/resources/assets/img/jabaralogo.jpg" height="80px" /></a>
			
			  <ul>
	          <li><a class="nav-link neonText" href="<c:url value="/location/MainPage.do"/>">Home</a></li>
	          <sec:authentication property="name" var="username"/>
	          
	          <c:if test="${username == 'anonymousUser'}" var="isLogin">
		          <li><a class="nav-link neonText" href="<c:url value="/location/login.do"/>">로그인 & 회원가입</a></li>
	          </c:if>
	          <c:if test="${not isLogin }">  
		          <li><a class="nav-link neonText" href="javascript:logout()">로그아웃</a></li>
		          <li><a class="nav-link neonText" href="<c:url value="/userinfo/mypage.do"/>">My Page</a></li>
	          </c:if>
	          <li><a class="nav-link neonText" href="<c:url value="/board/auctionlist.do"/>">경매</a></li>
	          <li><a class="nav-link neonText" href="<c:url value="/board/productlist.do"/>">중고거래</a></li>
	          <li><a class="nav-link neonText" href="<c:url value="/board/gropboard.do"/>">동내생활</a></li>
	          <li><a class="nav-link neonText" href="<c:url value="/board/qna.do"/>">Q&A</a></li>
	          <li><a class="nav-link" href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
	        </ul>
			  <i class="bi bi-list mobile-nav-toggle"></i>
		</nav><!-- .navbar -->
 
  </c:if>	
	
<script>
$(function() {
	Kakao.init('3b4e896dc0a59e1644573c8f5af25f9a');
	console.log(Kakao.isInitialized());
});
function logout(){
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "aD0UrmApSUn6FDTwgeL4",
		isPopup : false
	});
	/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();
	/* (5) 현재 로그인 상태를 확인 */
	naverLogin.getLoginStatus(function(status) {
		if (status) {
			/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
			naverLogin.logout(); // proc페이지라면, naverLogin.init(); 가 실행될때가 지 대기 후 실행해야한다.
		}
	});
	if (Kakao.Auth.getAccessToken()) {
		kakaoLogout();
	}
	else $('#logoutForm').submit();//스프링 씨큐리티 사용- csrf를 활성화 시킬때
}
function kakaoLogout() {
	
    if (Kakao.Auth.getAccessToken()) {
    	Kakao.Auth.logout(function() {
	    	unlinkApp();
	    })
    }
    
  }

  function unlinkApp() {
	    Kakao.API.request({
	      url: '/v1/user/unlink'
	    })
	  }
</script>