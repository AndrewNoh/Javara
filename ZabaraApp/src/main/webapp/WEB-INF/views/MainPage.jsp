<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <style>
 img{
 width: 100%;
 display: block; 
 margin: 0px auto;
 }

 

 </style>
  <!-- ======= Header ======= -->
  
 
  <header id="header"> 
  	<form id="logoutForm" method="post" action="<c:url value="/security/logout.do"/>">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
    <div class="main_container " >
    <div class="m-5">

      <a href="<c:url value="/location/MainPage.do"/>"><img src="${pageContext.request.contextPath}/resources/assets/img/main_banner.png" style="text-align: center;"/></a>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->


		<nav id="navbar" class="navbar custom-navbar" style="margin-left: 90px;">
			  <ul>
	          <li><a class="nav-link" href="<c:url value="/location/MainPage.do"/>">홈</a></li>
	          <sec:authentication property="name" var="username"/>
	          
	          <c:if test="${username == 'anonymousUser'}" var="isLogin">
		          <li><a class="nav-link" href="<c:url value="/location/login.do"/>">로그인</a></li>
	          </c:if>
	          <c:if test="${not isLogin }">  
		          <li><a class="nav-link" href="javascript:logout()">로그아웃</a></li>
		          <li><a class="nav-link" href="<c:url value="/userinfo/mypage.do"/>">마이페이지</a></li>
	          </c:if>
	          <li><a class="nav-link" href="<c:url value="/board/auctionlist.do"/>">자바라경매</a></li>
	          <li><a class="nav-link" href="<c:url value="/board/gropboard.do"/>">동네생활</a></li>
	          <li><a class="nav-link" href="<c:url value="/board/news.do"/>">실시간뉴스</a></li>
	          <li><a class="nav-link" href="<c:url value="/board/qna.do"/>">자주묻는 질문</a></li>
	          <li><a class="nav-link" href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
	        </ul>
			  <i class="bi bi-list mobile-nav-toggle"></i>
		</nav><!-- .navbar -->

      <div class="social-links" style="margin-left: 80px;">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>
	</div>
    </div>
  </header><!-- End Header -->
  
<script>
	function logout(){
		$('#logoutForm').submit();//스프링 씨큐리티 사용- csrf를 활성화 시킬때
	}
</script>