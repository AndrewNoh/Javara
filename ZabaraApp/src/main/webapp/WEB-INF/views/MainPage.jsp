<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
img{
width: 70%;
}
.m-5{
  position: absolute;
  /* height: 100%; */
  top: 45%;
  left: 52%;
  transform: translate(-50%, -50%);

 }
 .dropdown-menu.show {
    border: 1px solid #f6dac591;
    background: #f6dac591;
    display: block;
}
 
 .arrow-down span{
  display: block;
  width: 1.5em;
  height: 1.5em;
  border-bottom: 1px solid #000;
  border-right: 1px solid #000;
  transform: rotate(45deg);
  margin: -10px;
  animation: animate-arrows 2s infinite;
}


@keyframes animate-arrows{
  0%{
    opacity: 0;
    transform: rotate(45deg) translate(-1.5em, -1.5em);
  }
  50%{
    opacity: 1;
  }
  100%{
    opacity: 0;
    transform: rotate(45deg) translate(1.5em, 1.5em);
  }
}
</style>

  <!-- ======= Header ======= -->
  
 
  <header id="header" style=" z-index=-1;"> 
     <form id="logoutForm" method="post" action="<c:url value="/security/logout.do"/>">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   </form>
    <div class="main_container " >
	    <div class="m-5">
	      <a href="<c:url value="/location/MainPage.do"/>">
	      	<img src="${pageContext.request.contextPath}/resources/assets/img/sub_banner.png" style="text-align: center;"/>
	      </a>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
	
	
	      <nav id="navbar" class="navbar custom-navbar" >
	           <ul style="margin-left: 10px">
	             <sec:authentication property="name" var="username"/>
	             
	             <c:if test="${username == 'anonymousUser'}" var="isLogin">
	                <li><a class="nav-link" href="<c:url value="/location/login.do"/>">로그인</a></li>
	             </c:if>
	             <c:if test="${not isLogin }">  
	                <li><a class="nav-link" href="javascript:logout()">로그아웃</a></li>	                
	             </c:if>
	            <sec:authorize access="hasAnyRole('ROLE_ADMIN')" var="isAdmin">
					<li><a href="<c:url value="/admin/admin.do"/>">관리자</a></li>
					<li><a href="<c:url value="/admin/adminauction.do"/>">경매글관리</a></li>
					<li><a href="<c:url value="/admin/admingropboard.do"/>">동네글관리</a></li>
				</sec:authorize>
				<c:if test="${not isAdmin }">
				<li><a class="nav-link" href="<c:url value="/userinfo/mypage.do"/>">나의 자바라</a></li>
	             <li><a class="nav-link" href="<c:url value="/board/auctionlist.do"/>">자바라경매</a></li>
	             <li class="nav-item dropdown">
	             	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				        동네생활
				      </a>
				      <div class="dropdown-menu">
				        <a class="dropdown-item" href="<c:url value="/board/gropboard.do"/>">동네생활</a>
				        <a class="dropdown-item" href="<c:url value="/board/news.do"/>">실시간뉴스</a>
				      </div>
				   </li>
	             <li><a class="nav-link" href="<c:url value="/board/qna.do"/>">자주묻는 질문</a></li>
	             <!-- <li><a class="nav-link" href="<c:url value="/board/image.do"/>">이미지분석</a></li> -->
	             <li><a class="nav-link" href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
	             </c:if>
	             <!-- 
	             <li><a class="nav-link"
				href="<c:url value="/userinfo/category.do"/>">우리동네 카테고리</a></li>
				-->
				<li>
	           </ul>
	           <i class="bi bi-list mobile-nav-toggle"></i>	           
	      </nav><!-- .navbar -->     	
   		</div>
   		<div class="arrow-down" style="position:absolute; left:50%; top:87%;">
		  <a href="javascript:void(0);" style="display: inline-block;">
		    <span></span>
		    <span></span>
		    <span></span>
		  </a>
		</div>
  	</div>
  </header><!-- End Header -->
<!-- 우리 동네 좋은물건 잡아라 -->
<div style="width:100%; height:800px; background-color:#ffffffde; display: flex; align-items: center; justify-content: center;">
	<br>
	<br>
	<div style="display: flex; flex-direction: row; justify-content: space-around; align-items: center;" >
		<img src="${pageContext.request.contextPath}/resources/assets/img/mainpage_banner01.png" style="max-width: 500px; display: block; "/>
		<img src="${pageContext.request.contextPath}/resources/assets/img/main_board.PNG" style="max-max-width: 500px; "/>
	</div>
	
</div>

<!-- 우리 동네 경매 -->
<div style="width:100%; height:800px; background-color:#bababade; display: flex; align-items: center; justify-content: center;">
	<br>
	<br>
	<br>
	<div style="display: flex; flex-direction: row; justify-content: space-around; align-items: center;" >
		<img src="${pageContext.request.contextPath}/resources/assets/img/mainpage_banner02.png" style="max-width: 500px; display: block;"/>
		<img src="${pageContext.request.contextPath}/resources/assets/img/main_chatimg.PNG" style="max-width: 500px;"/>
	</div>
</div>

<!-- 우리 동네 생활 -->
<div style="width:100%; height:800px; background-color:#ffffffde; display: flex; align-items: center; justify-content: center;">
	<br>
	<br>
	<div style="display: flex; flex-direction: row; justify-content: space-around; align-items: center;" >
		<img src="${pageContext.request.contextPath}/resources/assets/img/mainpage_banner03.png" style="max-width: 500px; display: block;"/>
		<img src="${pageContext.request.contextPath}/resources/assets/img/main_townimg.PNG" style="max-width: 800px;"/>
	</div>
</div>

<!-- React: 우리동네 인기매물 -->
<div style="width:100%; height:800px; background-color:#bababade; color:black" id="mainUnder">
	<br>
	<br>
	<img src="${pageContext.request.contextPath}/resources/assets/img/main_scroll_banner.png" style="width: 500px; display: block; margin: 0 auto; "/>
	<div style="width:90%; height:85%; margin:auto" class="row">
		<iframe style="border:none;width:100%;height:100%" src="/marketapp/react/index.html"></iframe>
	</div>
</div>

<!-- React: 인기검색어 -->
<div style="width:100%; height:700px; background-color:#ffffffde; display: flex; align-items: center; justify-content: center;" id="mainUnder">
   <br>
   <br>
   <img src="${pageContext.request.contextPath}/resources/assets/img/main_wordcloud.png" style="width: 300px; display: block; margin: 0 auto; position: relative; left: 10%"/>
   <div style="width:90%; height:85%; margin:auto" class="row">
      <iframe style="border:none;width:100%;height:100%" src="/marketapp/wordcloud/index.html"></iframe>
   </div>
</div>


<script>
    function logout(){
    	$('#logoutForm').submit();//스프링 씨큐리티 사용- csrf를 활성화 시킬때
    }
   
    $(document).ready(function(){	
    	$('#chatbot').hide();
		$('#navbar').hide();
		$(window).scrollTop(0);
		$('#header').height("1000");
		$('#mainUnder').css("height", $('#header').height());
	});
   
    $('.arrow-down').on("click", function(){
    	down();
    });
    

    $('#header').on("click", function(){
    	var y = event.pageY;
    	
    	console.log(y);
    	
    	if(y >= 870){
    		down();
    	}
    });

    function down(){
    	$('html').animate({scrollTop : $('#mainUnder').offset().top}, 200);
    }
   
    
    $(document).on("click", "svg", function(){
    	console.log("클릭");
    	
    });
</script>