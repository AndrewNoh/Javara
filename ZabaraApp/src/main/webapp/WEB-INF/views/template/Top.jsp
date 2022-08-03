<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>우리동네 좋은 물건 자바라</title>
<meta content="" name="description">
<meta content="" name="keywords">


<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/img/web_banner.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/sweetalert2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js" charset="utf-8"></script>

<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>

<!-- 오픈 API 라이브러리 -->
<!-- Kakao 지도 서비스 관련 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
<!-- Daum 우편번호 서비스 관련  -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- import 페이 서비스 관련 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- 이미지 분석 서비스 관련 -->
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/sweetalert2.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/style.css"
	rel="stylesheet">
<link rel='stylesheet'
	href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
<!-- =======================================================
  * Template Name: Personal - v4.7.0
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
.navbar a[id=top_banner]:before {
	background-color: rgb(255 255 255/ 0%);
}
</style>
<body>
<div style="position: fixed;top: 30px; right: 3%; z-index: 1;" id="chatbot">
 <a ><img src="${pageContext.request.contextPath}/resources/assets/img/chatbot_icon.png" 
       title="챗봇" style="width: 100px; height: 100px;"></a>
</div>


	<form id="logoutForm" method="post"
		action="<c:url value="/security/logout.do"/>">
		<sec:csrfInput />
	</form>
	<nav id="navbar" class="navbar custom-navbar mx-5">
		<a href="<c:url value="/location/MainPage.do"/>" id="top_banner">
			<img
			src="${pageContext.request.contextPath}/resources/assets/img/sub_banner.png"
			height="80px" />
		</a>

		<!-- <button class="btn" id="srch">검색</button> <button class="btn" id="imgsrch">이미지 검색</button> -->

		<ul>
			<sec:authentication property="name" var="username" />
			<c:if test="${username == 'anonymousUser'}" var="isLogin">
				<li><a class="nav-link "
					href="<c:url value="/location/login.do"/>">로그인</a></li>
			</c:if>
			<c:if test="${not isLogin }">
				<li><a class="nav-link " href="javascript:logout()">로그아웃</a></li>
				<li><a class="nav-link "
					href="<c:url value="/userinfo/mypage.do"/>">나의 자바라</a></li>
			</c:if>
			<li><a class="nav-link "
				href="<c:url value="/board/auctionlist.do"/>">자바라경매</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 동네생활 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="<c:url value="/board/gropboard.do"/>">동네생활</a> <a
						class="dropdown-item" href="<c:url value="/board/news.do"/>">실시간뉴스</a>
				</div></li>
			<li><a class="nav-link " href="<c:url value="/board/qna.do"/>">자주묻는
					질문</a></li>
			<!--<li><a class="nav-link" href="<c:url value="/board/image.do"/>">이미지분석</a></li>-->
			<li><a class="nav-link"
				href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
			<li><a class="nav-link"
				href="<c:url value="/userinfo/category.do"/>">우리동네 카테고리</a></li>
			<li><div class="search col mr-3" id="srch" style="float: left;">
					<div class="srch_bar" style="text-align: center;">
						<div class="stylish-input-group">
							<input type="text" placeholder="검색어를 입력해주세요" name="title"
								class="search-bar"> <span class="input-group-addon">
								<button type="submit" style="vertical-align: -0.3em;">
									<i class="bi bi-search" aria-hidden="true"
										style="font-size: 20px; color: #ffc107;"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<form id="searchForm" action="<c:url value="/board/search.do"/>"
					method="post">
					<sec:csrfInput />
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
								<option selected value="기타">기타</option>
						    	<option value="중고차">중고차</option>
						    	<option value="디지털기기">디지털기기</option>
						    	<option value="생활가전">생활가전</option>
						    	<option value="가구/인테리어">가구/인테리어</option>
						    	<option value="유아동">유아동</option>
						    	<option value="유아도서">유아도서</option>
						    	<option value="생활/가공식품">생활/가공식품</option>
						    	<option value="스포츠/레저">스포츠/레저</option>
						    	<option value="여성잡화">여성잡화</option>
						    	<option value="여성의류">여성의류</option>
						    	<option value="남성패션/잡화">남성패션/잡화</option>
						    	<option value="게임/취미">게임/취미</option>
						    	<option value="뷰티/미용">뷰티/미용</option>
						    	<option value="반려동물용품">반려동물용품</option>
						    	<option value="도서/티켓/음반">도서티켓음반</option>
						    	<option value="식물">식물</option>
						  	</select>
						</div>
						<div class="search row" id="imgsrchDiv" style="float: right;">
							<div class="srch_bar" style="text-align: center;">
								<div class="stylish-input-group">
									<input type="text" placeholder="검색어를 입력해주세요" name="title"
										class="search-bar"> <span class="input-group-addon">
										<button id="modal-open" data-toggle="modal"
											data-target="#myModal" type="button"
											style="margin-left: -30px; vertical-align: -0.3em;">
											<i class="bi bi-images" aria-hidden="false"
												style="font-size: 20px; color: cornflowerblue;"></i>
										</button>
										<button type="submit"
											style="margin-left: 5px; vertical-align: -0.3em;">
											<i id="bi-search" class="bi bi-search" aria-hidden="false"
												style="font-size: 20px;"></i>
										</button>
									</span>
								</div>

							</div>
						</div>
					</div>
				</form></li>
		</ul>

		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header" style="background-color: #efc958;">
						<h5 style="margin-top: 15px; font-family:"SDSwaggerTTF", sans-serif;">
							<strong>이미지분석</strong>
						</h5>
						<i id="modal-close" data-dismiss="modal" class="close bi bi-x"
							style="font-size: 1.5rem; color: black; cursor: pointer;"></i>
					</div>
					<div class="modal-body">
						<div class="body-content">
							<img id="preview_image" style="width: 100%; height: 90%;"/>
							<div id="label-container" style="color: black; cursor: pointer;"></div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<i id="fakeTag" class="bi bi-card-image"
							style="cursor: pointer; font-size: 2rem; color: cornflowerblue; "></i> <input
							type="file" class="ImageAnalysis" id="test_image"
							accept=".png,.jpg,.jpeg" style="display: none;" /> <i
							style="cursor: pointer; font-size: 1.5rem; color: black;" class="bi bi-search"
							onclick="predict()"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="row"></div>

		<i class="bi bi-list mobile-nav-toggle"></i>
	</nav>
	

<div class="chat" style="display: none;position: flex; y-index: 1;">
  <div class="chat-title">
    <h1 style="font-size: 15px; color: #000; font-family: GmarketSansBold">자바라 챗봇</h1>
    
    <figure class="avatar">
      <img src="${pageContext.request.contextPath}/resources/assets/img/web_banner.png"   /></figure>     
	<div  class="r-nav"> 
     <ul>
		  <li> <a>X</a></li>	  
		  <li> <a><img src="" width="26px" /></a></li>   	
     </ul>     
	</div><!--r-nav -->   
	</div><!--chat-title -->
	<div class="messages">
	    <div class="messages-content">
	    </div>
	</div><!-- messages -->
	<div class="message-box">
		<!-- <textarea type="text" class="message-input" placeholder="무엇이 궁금하신가요?"></textarea> -->
		<button type="submit" class="btn btn-dark" style="float: right;">전송</button>
	</div><!-- message-box -->
</div><!-- chat -->

<script>
		$(function() {
			Kakao.init('3b4e896dc0a59e1644573c8f5af25f9a');
			console.log(Kakao.isInitialized());
		});
		function logout() {
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
			} else
				$('#logoutForm').submit();//스프링 씨큐리티 사용- csrf를 활성화 시킬때
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
				url : '/v1/user/unlink'
			})
		}

		$(function() {
			$("#srch").click(function() {
				$("#srchDiv").toggle();
				$("#srch").toggle();
			});
			$("#imgsrch").click(function() {
				$("#srchDiv").hide();
				$("#srch").show();
			});
			$("#chatbot").click(function() {
				$(".chat").toggle();
			});
		});

		//이미지 분석 코드

		$(function() {
			$("#modal-open").click(function() {
				$("#popup").css('display', 'flex').hide().fadeIn();
			});

			$("#modal-close").click(function() {
				modalClose();
			});
			function modalClose() {
				$("#modal-content").fadeOut();
			}
		});

		const URL = "../my_model/";

		let model //메모리에 로드한 모델 저장용
		, labelContainer//예측 결과를 보여줄 div요소 저장용
		, maxPredictions;//클래스(분류) 갯수 저장용

		
	  async function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";

			model = await
			tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();
			console.log('카테고리(클래스) 수:', maxPredictions);

			labelContainer = document.getElementById("label-container");
			for (let i = 0; i < 3; i++) { // and class labels
				var ch= document.createElement("div");
				ch.addEventListener('click', function(){
					searchDiv(i);
				} );
				labelContainer.appendChild(ch);
			}
		}

	
		var k=0;
		async function predict() {
			if($('#test_image').val()!=""){
				var image = document.querySelector("#preview_image");

				const prediction = await
				model.predict(image, false);
				console.log('prediction:', prediction);

				var resultArray = [];
				var className = [];
				for (var i = 0; i < maxPredictions; i++) {
					console.log("resultArray"
							+ prediction[i].probability.toFixed(2) * 100);
					resultArray.push(prediction[i].probability.toFixed(2) * 100);
				}

				for (var i = 0; i < maxPredictions; i++) {
					var classPrediction = prediction[i].className + ": "
							+ prediction[i].probability.toFixed(2) * 100+"%";
					className.push(classPrediction);
				}

				for (var i = 0; i < resultArray.length - 1; i++) {
					for (k = i + 1; k < resultArray.length; k++) {
						if (resultArray[i] < resultArray[k]) {
							console.log(resultArray[i])
							var temp = resultArray[i];
							resultArray[i] = resultArray[k];
							resultArray[k] = temp;
							var tempname = className[i];
							className[i] = className[k];
							className[k] = tempname;
						}
					}
				}
				for (k = 0; k < 3; k++) {
					labelContainer.childNodes[k].innerHTML = "";
				}

				for (k = 0; k < 3; k++) {
					if (className[k].indexOf(": 0") != -1) {
						break;
					}
					labelContainer.childNodes[k].innerHTML = className[k];
					console.log(labelContainer.childNodes[k].innerHTML)
				}
			}

			
		}
		
		function searchDiv(i){
			//$('.search-bar').val(labelContainer.childNodes[i].innerHTML);
			var searchbar = labelContainer.childNodes[i].innerHTML;
			searchbar = searchbar.split(':');
			$('.search-bar').val(searchbar[0]);
			$('#bi-search').trigger('click'); 
		};

		init();

		document.querySelector('#test_image').onchange = function() {
			previewImage(this);
		};

		function previewImage(input) {//input는 <input type="file" ~/>객체
			if (input.files && input.files[0]) {
				console.log('input.files:', input.files);//FileList객체
				console.log('input.files[0]:', input.files[0]);//File객체
				var reader = new FileReader();

				reader.readAsDataURL(input.files[0]);//이미지파일을 URL로 읽기.(BASE64로 인코딩 된 문자열)

				reader.onload = function(e) {
					console.log("e.target:", e.target);//FileReader객체
					console.log("e.target.result:", e.target.result);//파일 컨텐츠
					document.querySelector("#preview_image").setAttribute(
							'src', e.target.result);
				};
			}
		}//////////////////

		$("#fakeTag").click(function() {
			console.log("함수안으로 ");
			$(".ImageAnalysis").click();

		});
		
		
		

		
	</script>