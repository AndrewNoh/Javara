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
	
<!-- 관리자페이지 css -->

<!-- Fontfaces CSS-->
    <link id="admin" href="css/font-face.css" rel="stylesheet" media="all">
    <link id="admin1" href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link id="admin2" href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link id="admin3" href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link id="admin4" href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link id="admin5" href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link id="admin6" href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link id="admin7" href="${pageContext.request.contextPath}/resources/adminassets/adminvendor/wow/animate.css" rel="stylesheet" media="all">
    <link id="admin8" href="${pageContext.request.contextPath}/resources/adminassets/adminvendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link id="admin9" href="${pageContext.request.contextPath}/resources/adminassets/adminvendor/slick/slick.css" rel="stylesheet" media="all">
    <link id="admin10" href="${pageContext.request.contextPath}/resources/adminassets/adminvendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link id="admin11" href="${pageContext.request.contextPath}/resources/adminassets/adminvendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link id="admin12" href="${pageContext.request.contextPath}/resources/adminassets/admincss/adminStyle.css" rel="stylesheet" media="all">
<!-- =======================================================
  * Template Name: Personal - v4.7.0
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>

.new-corsur {
    cursor: pointer;
}

.navbar a[id=top_banner]:before {
	background-color: rgb(255 255 255/ 0%);
}

#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #b9dbff;
  border: 1px solid white;
  color: #000;
  text-align: center;
  border-radius: 3px;
  padding: 5px;
  position: fixed;
  z-index: 1;
  left: 90%;
  top: 30px;
  font-size: 17px;
  box-shadow: 12px 12px 2px 1px #00000054;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {top: 0; opacity: 0;} 
  to {top: 30px; opacity: 1;}
}

@keyframes fadein {
  from {top: 0; opacity: 0;}
  to {top: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {top: 30px; opacity: 1;} 
  to {top: 0; opacity: 0;}
}

@keyframes fadeout {
  from {top: 30px; opacity: 1;}
  to {top: 0; opacity: 0;}
}
.modalContent{
  position: relative;
  padding: 20px 20px;
  z-index: 4;
  margin-left: 36%;
  height: auto;
  max-width: 500px;
  width: 90%;
  overflow-x: hidden;
  overflow-y: auto;
  border-radius: 20px;
  background:rgb(137 137 137 / 53%);
  box-shadow: 0 15px 35px rgb(181 179 179 / 50%);
  border: 2px solid rgba(255, 255, 255, 0.3);
}

.modal-backdrop.show{
    opacity: .5;	
}
</style>
<body>
<sec:authorize access="hasAnyRole('ROLE_ADMIN')" var="isAdmin">
</sec:authorize>


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
	                <li><a class="nav-link" href="<c:url value="/location/login.do"/>">로그인</a></li>
	             </c:if>
	             <c:if test="${not isLogin }">  
	                <li><a class="nav-link" href="javascript:logout()">로그아웃</a></li>	                
	             </c:if>
	            <c:if test="${isAdmin }">
					<li><a href="<c:url value="/admin/admin.do"/>">관리자</a></li>
					<li><a href="<c:url value="/admin/adminauction.do"/>">경매글관리</a></li>
					<li><a href="<c:url value="/admin/admingropboard.do"/>">동네글관리</a></li>
				</c:if>
				<c:if test="${not isAdmin }">
				<li><a class="nav-link" href="<c:url value="/userinfo/mypage.do"/>">나의 자바라</a></li>
	             <li><a class="nav-link" href="<c:url value="/board/auctionlist.do"/>">자바라경매</a></li>
	             <li><a class="nav-link" href="<c:url value="/userinfo/category.do"/>">우리동네 카테고리</a></li>	
	             <li class="nav-item dropdown">
	             	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				        동네방네
				      </a>
				      <div class="dropdown-menu navdropdown-menu">
				      	<a class="dropdown-item navdropdown-item" href="<c:url value="/board/news.do"/>">실시간뉴스</a>
				        <a class="dropdown-item navdropdown-item" href="<c:url value="/board/gropboard.do"/>">동네생활</a>
				      </div>
				   </li>
	             <li><a class="nav-link" href="<c:url value="/board/qna.do"/>">자주묻는 질문</a></li>
	             <!-- <li><a class="nav-link" href="<c:url value="/board/image.do"/>">이미지분석</a></li> -->
	             <li><a class="nav-link" href="<c:url value="/chat/chattingroom.do"/>">채팅</a></li>
	             </c:if>
	             
			<li>
				<c:if test="${not isAdmin }">
					<form id="searchForm" action="<c:url value="/board/search.do"/>"
						method="post">
						<sec:csrfInput />
						<div class="search row" id="srchDiv">						
							<div class="search row" id="imgsrchDiv" style="float: right;">
								<div class="srch_bar" style="text-align: center;">
									<div class="stylish-input-group">
										<input type="text" name="title"
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
					</form>
				</c:if>
			</li>
			<li><a class="nav-link"id="chatbot"><img src="${pageContext.request.contextPath}/resources/assets/img/chatbot_icon.png" 
			       title="챗봇" style="width: 100px; height: 100px;"></a></li>
		</ul>

			   <div class="modal" id="myModal">
			         <div class="modalContent">
			           <div style="text-align: end;">
			              <i id="modal-close" data-dismiss="modal" class="close bi bi-x"
			                  style="font-size: 1.8rem; color: black; cursor: pointer;"></i>
			            </div>
			               <h4 style="font-family:"SDSwaggerTTF", sans-serif;">
			                  <strong>이미지분석</strong>
			               </h4>
			               <div class="body-content" style="padding:5px;background-color: rgb(125 125 125 / 70%);border-radius: 10px;">
			                  <img id="preview_image" style="width: 100%; height: 100%;"/>
			                  <div id="label-container" style="color: white; cursor: pointer;margin-top: 10px;font-size: 18px;"></div>
			               </div>
			
						<div class="row">
						<div class="col"></div>
						  <div class="col" style="text-align: end;">
			               <i id="fakeTag" class="bi bi-card-image"
			                  style="cursor: pointer; font-size: 1.8rem; color: cornflowerblue; "></i> <input
			                  type="file" class="ImageAnalysis" id="test_image"
			                  accept=".png,.jpg,.jpeg" style="display: none;" /> <i
			                  style="margin-left:10px; cursor: pointer; font-size: 1.5rem; color: white;" class="bi bi-search"
			                  onclick="predict()"></i>
			              </div>
			            </div>
			         </div>
			   </div>
		<div class="row"></div>

		<i class="bi bi-list mobile-nav-toggle"></i>
	</nav>
	
<c:if test="${not isAdmin }">
	<div class="chat" style="display: none;position: flex; y-index: 1;">
	  <div class="chat-title">
	    <h1 style="font-size: 15px; color: black; ">자바라 챗봇</h1>
	    
	    <figure class="avatar">
	      <img src="${pageContext.request.contextPath}/resources/assets/img/web_banner.png"   /></figure>     
		<div  class="r-nav"> 
	     <ul>
			  <li> <a id="chatbotOff" class="new-corsur">X</a></li>	  
			  <li> <a><img src="" width="26px" /></a></li>   	
	     </ul>     
		</div><!--r-nav -->   
		</div><!--chat-title -->
		<div class="messages">
		    <div class="messages-content bg-white mt-2">

		    </div>
		</div><!-- messages -->
		<div class="message-box">
	
			<!--<textarea type="text" class="message-input mt-2" id="message" placeholder="무엇이 궁금하신가요?"></textarea>-->
			<input id="message" type="text"><button type="submit" class="btn btn-dark" style="float: right; width: 100px">문의하기</button>
		</div><!-- message-box -->
	</div><!-- chat -->
	
	<script src="<c:url value="/js/chatbot.js"/>"></script>
</c:if>
<div id="snackbar"></div>

<script>
	
//관리자페이지 css안먹게하기
$("link#admin").prop('disabled', true);
$("link#admin1").prop('disabled', true);
$("link#admin2").prop('disabled', true);
$("link#admin3").prop('disabled', true);
$("link#admin4").prop('disabled', true);
$("link#admin5").prop('disabled', true);
$("link#admin6").prop('disabled', true);
$("link#admin7").prop('disabled', true);
$("link#admin8").prop('disabled', true);
$("link#admin9").prop('disabled', true);
$("link#admin10").prop('disabled', true);
$("link#admin11").prop('disabled', true);
$("link#admin12").prop('disabled', true);
	
	$("#message").on('keypress',function(e) {
		if (e.keyCode == 13){
	        //e.preventDefault();
	        var message = $(this).val()
	        console.log(message)
	        if (!message) {//텍스트를 입력하지 않는 경우
	          return
	        }
	        //messages-content에 사용자의 응답 추가됨
	        $('.messages-content').append('<div style="color:white; padding:7px; display: flex;justify-content: flex-end;" class="human-message"><span style="border-radius:10px; padding:5px; background-color:black; ">'+message+'</span></div>')
	        // 입력창 클리어
	        $('#message').val('')
	        //스크롤바 아래로
	        $(".messages-content").scrollTop($(".messages-content")[0].scrollHeight);
	        $('.messages-content').focus();
	        //메시지 전송
	        sendMessage(message,'<%=session.getId()%>');
	    }
	});


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
			$("#chatbotOff").click(function() {
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
				$("#modalContent").fadeOut();
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
		
		<sec:authentication property="name" var="username" />
	          <c:if test="${username != 'anonymousUser'}" var="isLogin">
	          wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/0'/>"); 
	           //192.168.219.101//192.168.0.129
	           //console.log('wsocket:',wsocket);
	           //서버와 연결된 웹 소켓에 이벤트 등록
	           if(opener==null){ 
	              wsocket.onopen;;
	          }else{ 
	              wsocket.close();
	          }   
	          
	           wsocket.onclose=function(){
	              //console.log("연결이 끊어 졌어요");
	           };
	           wsocket.onmessage=receive;
	           wsocket.onerror=function(e){
	              //console.log('에러발생:',e)
	           }
	           
	          //서버에 연결되었을때 호출되는 콜백함수
	          </c:if>
	           function receive(e){//e는 message이벤트 객체
	               //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
	                const element = document.getElementById('snackbar');
	               //일반 메세지
	               console.log(e.data);
	               if(e.data.includes('RoomNo')){
	                  var start1 = e.data.indexOf(",");
	                  var start2 = e.data.indexOf(":");
	                  if(e.data.includes('RoomNo${room_no},')){
	                     //console.log('같은방');
	                  }
	                  else if(e.data.includes('senduserno${userno},') || e.data.includes('writeuserno${userno},')){
	                     if(!e.data.includes('${username}')){
	                        element.innerHTML = '';
	                        element.innerHTML += e.data.substring(start2+1)+'님이 보낸 채팅이 도착했어요';
	                        var x = document.getElementById("snackbar");
	                        x.className = "show";
	                        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                     }
	                  }
	               }
	               else if(e.data.includes('경매')){
	               var start1 = e.data.indexOf(",");
	               var start2 = e.data.indexOf(":");
	                  if( e.data.includes('userNo${userno},')){
	                     element.innerHTML = '';
	                     element.innerHTML += e.data.substring(start2+1);
	                     var x = document.getElementById("snackbar");
	                     x.className = "show";
	                     setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                     if( e.data.includes('좋아요,')){
		                     element.innerHTML = '';
		                     element.innerHTML += e.data.substring(start2+1);
		                     var x = document.getElementById("snackbar");
		                     x.className = "show";
		                     setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		                  }
	                  }
	                  if( e.data.includes('upperuserno${userno},')){
	                     element.innerHTML = '';
	                     element.innerHTML += e.data.substring(start2+1);
	                     console.log(e.data.substring(start2+1));
	                     var x = document.getElementById("snackbar");
	                     x.className = "show";
	                     setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                  }
	                  
	              }else if(e.data.includes('낙찰')){
	                  var start = e.data.indexOf(":");
	                  if( e.data.includes('upperuserno${userno},')){
	                     element.innerHTML = '';
	                     element.innerHTML += e.data.substring(start+1);
	                     var x = document.getElementById("snackbar");
	                     x.className = "show";
	                     setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                  }
	              }
	               else if(e.data.includes('동네')){
	                  var arr= e.data.split(/[,:]/);
	                  if(e.data.includes('townlist_no')){
	                     if(e.data.includes('WriteUserNO:${userno},')){
	                        element.innerHTML = '';
	                        element.innerHTML += '동네생활 '+arr[5]+'에 댓글이 달렸어요';
	                        var x = document.getElementById("snackbar");
	                        x.className = "show";
	                        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                     }
	                  }else if(e.data.includes('like')){
	                     if(e.data.includes('WriteUserNO:${userno},')){
	                       element.innerHTML = '';
	                        element.innerHTML += '동네생활 '+arr[5]+'에 좋아요가 눌렸어요';
	                        var x = document.getElementById("snackbar");
	                        x.className = "show";
	                        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	                     }
	                  }
	               }
	           }
	           
			 
	</script>
