<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>우리동네 좋은 물건 자바라</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
	
  
  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/web_banner.png" rel="icon">
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

  <!-- 오픈 API 라이브러리 -->
  <!-- Kakao 지도 서비스 관련 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
  <!-- Daum 우편번호 서비스 관련  -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- import 페이 서비스 관련 -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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


          <form id="logoutForm" method="post" action="<c:url value="/security/logout.do"/>">
                   <sec:csrfInput/>
            </form> 
         <nav id="navbar" class="navbar custom-navbar mx-5" >
	         <a href="<c:url value="/location/MainPage.do"/>">
	         <img src="${pageContext.request.contextPath}/resources/assets/img/sub_banner.png" height="80px" /></a>
         <form id="searchForm" action="<c:url value="/board/search.do"/>" method="post">
            <sec:csrfInput/>
            <div class="row">
	            <div class="search col mr-3" id="srch" style="float: left;">
	               <div class="srch_bar" style="text-align:center;">
	                    <div class="stylish-input-group"  >
	                     <input type="text" placeholder="검색어를 입력하세요" name="title" class="search-bar">
	                     <span class="input-group-addon">
	                         <button type="submit" style="vertical-align:-0.3em;"><i class="bi bi-images" aria-hidden="true" style="font-size: 20px; color: #ffc107;"></i> </button>
	                     </span>
	                  </div>
	               </div>
	            </div>
	            <div class="search col" id="imgsrch" style="float: right;">
	               <div class="srch_bar" style="text-align:center;" id="imgsrchDiv">
	                    <div class="stylish-input-group"  >
	                     <input type="text" placeholder="이미지를 넣어주세요" name="title" class="search-bar">
	                     <span class="input-group-addon">
	                         <button type="submit" style="vertical-align:-0.3em;"><i class="bi bi-images" aria-hidden="true" style="font-size: 20px;color: #ffc107;"></i> </button>
	                     </span>
	                  </div>
	               </div>
	            </div>
            </div>
            <div class="search row" id="srchDiv" style="display: none;">
               <div class="custom-select col mb-2" style="width: 100px;">
               <select id="searchBoardSelect" name="board">
                  <option selected value="경매">경매</option>
                  <option value="경매">경매</option>
                  <option value="우리동네">동네생활</option>
               </select>
               </div>
               <div class="custom-select col mb-2" style="width: 100px;">
               <select id="searchCategorySelect" name="category">
                  <option  value=""></option>
                  <option selected value="기타">기타</option>
                           <option value="중고차">중고차</option>
                           <option value="디지털기기">디지털기기</option>
                           <option value="생활가전">생활가전</option>
                          <option value="가구/인테리어">가구/인테리어</option>
                           <option value="유아용품">유아용품</option>
                           <option value="도서">도서</option>
                           <option value="가공식품">가공식품</option>
                           <option value="스포츠/레저">스포츠/레저</option>
                           <option value="여성잡화">여성잡화</option>
                           <option value="여성의류">여성의류</option>
                           <option value="남성패션/잡화">남성패션/잡화</option>
                           <option value="게임/취미">게임/취미</option>
                           <option value="뷰티/미용">뷰티/미용</option>
                  <option value="반려동물용품">반려동물용품</option>
               </select>
               </div>
              
            </div>
         </form>
            <!-- <div class="search row" id="imgsrchDiv" style="float: right;">
               <div class="srch_bar" style="text-align:center;">
                    <div class="stylish-input-group"  >
                     <input type="text" placeholder="이미지를 넣어주세요" name="title" class="search-bar">
                     <span class="input-group-addon">
                         <button type="submit" style="vertical-align:-0.3em;"><i class="bi bi-images" aria-hidden="true" style="font-size: 20px;"></i> </button>
                     </span>
                  </div>
               </div>
            </div> -->
             <!-- <button class="btn" id="srch">검색</button> <button class="btn" id="imgsrch">이미지 검색</button> -->
         
         <ul>
             <sec:authentication property="name" var="username"/>
             <c:if test="${username == 'anonymousUser'}" var="isLogin">
                <li><a class="nav-link " href="<c:url value="/location/login.do"/>">로그인</a></li>
             </c:if>
             <c:if test="${not isLogin }">  
                <li><a class="nav-link " href="javascript:logout()">로그아웃</a></li>
                <li><a class="nav-link " href="<c:url value="/userinfo/mypage.do"/>">나의 자바라</a></li>
             </c:if>
             <li><a class="nav-link " href="<c:url value="/board/auctionlist.do"/>">자바라경매</a></li>
             <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        동네생활
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="<c:url value="/board/gropboard.do"/>">동네생활</a>
			        <a class="dropdown-item" href="<c:url value="/board/news.do"/>">실시간뉴스</a>
			      </div>
			    </li>
             <li><a class="nav-link " href="<c:url value="/board/qna.do"/>">자주묻는 질문</a></li>
             <!--<li><a class="nav-link" href="<c:url value="/board/image.do"/>">이미지분석</a></li>-->
             <li><a class="nav-link" href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
           </ul>
           <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
 
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
  
  
  $(function (){
      $("#srch").click(function (){
           $("#srchDiv").toggle();
           $("#srch").toggle();
           $("#imgsrch").toggle();
        });
      $("#imgsrch").click(function (){
           $("#srch").toggle();
        });
   
   });
</script>