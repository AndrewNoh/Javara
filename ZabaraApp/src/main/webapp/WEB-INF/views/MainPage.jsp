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
	                <li><a class="nav-link" href="<c:url value="/userinfo/mypage.do"/>">나의 자바라</a></li>
	             </c:if>
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
  
<div style="width:100%; background-color:#f9fafb5c; color:black" id="mainUnder">
	<br>
	<br>
	<br>
	<img src="${pageContext.request.contextPath}/resources/assets/img/main_scroll_banner.png" style="width: 500px; display: block; margin: 0 auto; "/>
	<div style="width:90%; height:969px; margin:auto" class="row">
		<c:forEach var="list" items="${lists}" varStatus="i">
			<div style="margin:auto;" class="col-lg-5">
				<div class="container" style="background: #d7ebff;">	
			        <div class="row">		
			        	<div class="col-lg-8">
			        		<h2 class="portfolio-title">${list.title}</h2>
			        		<div class="portfolio-details-slider swiper">
			            		<div class="swiper-wrapper align-items-center">
									<c:forEach var="in" begin="0" end="${fn:length(imageList[i.index]) eq 0 ? 0 : fn:length(imageList[i.index])-1}">
										<div class="swiper-slide">
											<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i.index][in].imageName}">
										</div>
									</c:forEach>
			            		</div>
			            	</div>
			          	</div>
			
			        	<div class="col-lg-4 portfolio-info">
			            	<div class="content">						
								<div style="text-align: right;">					
									<div>${list.nickName}</div>
										<i class="bi bi-calendar3"></i> ${list.postDate}
									</div>
							
									<div class="mb-4">${list.category}</div>
									<div class="mb-5">
										<p>${list.content}</p>
									</div>
									<div class="mb-5">
										<p>${list.endDate}</p>
									</div>		
							</div>
			          	</div>
		        	</div>	
		    	</div>
			</div><!-- End Portfolio Details -->
		</c:forEach>		
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
   
</script>