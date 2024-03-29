<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
    <!-- ======= Chat Details ======= -->
<style>
.write_msg::placeholder {
  color: rgba(255, 255, 255, 0.5);
}
    .bAddr {
   color: black;
   width: 200px;
   height: 60px;
   padding: 5px;
}

.dropdown-menu {
    border: none;
    background: white;
 }
 
 .dropdown-item:focus, .dropdown-item:hover{
    background: white;
 }
 a{
  color:#198754
 }
 
  .input[id=pay]{
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #CCC;
  color: #555;
  box-sizing: border-box;
  font-family: 'Arvo';
  font-size: 18px;
  height: 50px;
  margin: -25px 0 0 -100px;
  padding: 10px 0px;
  position: relative;
  top: 50%;
  margin-left: 20px;
  text-align: center;
  width: 150px;
 }
 
 
 .pruduct{
	display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: space-between;
    height: 388px;
    padding: 0px 20px;
    font-size: 16px;
    border-bottom: 1px solid #ced4da;
    flex-direction: column;
}
.mapmodal{
 position: absolute;
 top: 0%;
 height: auto;
}

.navdropdown-menu {
    border: 1px solid #f6dac591;
    background: #f6dac591;
 }
 
 .navdropdown-item:focus, .dropdown-item:hover{
    background: #f6dac591;
 }
</style>
      <div class=" m-5"> 
      <div class="container">
     <div class="section-title">
        <h2>채팅</h2>
      </div>
   <div class="messaging ">
      <div class="inbox_msg">
         <div class="inbox_people">
	         <div class="css-1r0o66s">
	            <div class="chat-header-profile">
		            <img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}">
		            <div class="main-title" >
			            <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>
			                    ${userNickname.nickname }
		            </div>
	            </div>
	         </div>
	         <div class="css-1r0o66s">
                        <div class="chat-header-profile">
                           <c:if test="${userNickname.nickname eq chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}" alt="sunil"></c:if>
                           <c:if test="${userNickname.nickname ne chatroom.writeusernickname and (empty finduser.profile_img)}"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}" alt="sunil"></c:if>
                            <c:if test="${userNickname.nickname ne finduser.nickname and (empty chatroom.writeuserprofileimg)}"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${finduser.profile_img}" alt="sunil"></c:if>
                           <div class="main-title" id="usernicname">
                           <c:if test="${userNickname.nickname ne wirtenickName }" var="chatuser">
                              <span>${wirtenickName}</span>
                           </c:if>
                           <c:if test="${!chatuser }">
                              <span>${chatnickname}</span>
                           </c:if>
                           <c:if test="${userNickname.nickname eq nicknames.sendusernickname }" var="nickname">
                              <span>${nicknames.writeusernickname}</span>
                           </c:if>
                           <c:if test="${!nickname }">
                              <span>${nicknames.sendusernickname }</span>
                           </c:if>
                           </div>
                        </div>
                        <div class="css-1idbtsb" >
                             <div class="more-button-wrapper common-bg-hover"id="chatmenutoggle">
								<i class="bi bi-three-dots-vertical m-1" style="font-size: 35px;"></i>
							</div>
							<div class="option-container" id="chatmenuToggleDiv" style="display:none">
								<a style="color: black;" href="<c:url value="/chat/chattingroom.do"/>"><div class="option-item common-bg-hover" id="deletchtroom">채팅방 나가기</div></a>
							</div>
						</div>
                     </div>
                     <a href="<c:url value="/board/auctionview.do"><c:param value="${list.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="${list.title}">
                        <div class="pruduct common-bg-hover" style="color: #f9fafb;">
                           <div style="font-size: 20px;" class="m-2"> ${list.title}</div>
                           <div class="portfolio-details-slider swiper" style="width: -webkit-fill-available;">
				              <div class="swiper-wrapper align-items-center"  >
				              	<c:forEach var="image" items="${images}" varStatus="loop">
									<div class="swiper-slide">
										<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}"  style="width: 100%; height: 100% ; object-fit: cover;">
									</div>					
								</c:forEach>
				
				              </div>
				            </div>
                           <div class="reserved-main " > 
                           <div class="reserved-price m-2">내용 : ${list.content}</br></div>
                           <div class="reserved-price m-2">최고가격 : ${list.upper_Price}</div>
                           </div>
                           <div><c:if test="${list.status == 'END'}">낙찰</c:if>
                            <c:if test="${list.status == 'SALE'}">경매 진행중</c:if></div>
                        </div>
                     </a>
	      </div>
         <div class="mesgs" >
            <div class="msg_history">
               <div class="incoming_msg">
                  <div id="chatMessage">
                     
                     <c:forEach var="message" items="${message}" varStatus="loop">
                        <c:forEach var="i" begin="${loop.index}" end="${loop.index}">
                       		 <c:if test="${ i eq 0}"><br/><div style='text-align: center; margin-top:5px;'><fmt:formatDate value="${message.sendtime}" pattern="yyyy년 MM월 dd일"/></div></c:if>
                        </c:forEach>
                     <!-- 보내는사람 -->
                     <c:if test="${message.senduserno eq userno }" var="myuserno">
                        <div class='outgoing_msg rowNum' >
                           <div class='sent_msg '  style="text-align: center; ">
                           
                              <c:if test="${message.img eq null }" var="chatimg">
                              	  <c:set var = "string" value = "${message.chatcontent }"/>
   								  <c:set var = "length" value = "${fn:length(string)}"/>
	                              <c:if test="${fn:contains(message.chatcontent, '전화번호 공유를 요청하였습니다')}" var="phon"><p style='text-align: center;'><strong>${message.chatcontent }</strong><br/></p></c:if>
	                              <c:if test="${fn:contains(message.chatcontent, '::명함::')}" var="phonOK"><p style='text-align: center; display: flex;align-items:center;'><img class="chat-header-image" style="display: block; width: 70px;height: 70px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}"><span><strong>${userNickname.nickname }</strong><br/>${userNickname.phonenumber }</span></p></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '송금 되었습니다')}" var="transfer"><p style='text-align: center;'><strong>${message.chatcontent }</strong></p><input type='hidden' class='payval' value='${fn:substring(string, 0, length-12)}'/></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '받으셨습니다.')}" var="payment"><p style='text-align: center;'><strong>${message.chatcontent }</p></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '축하합니다.낙찰되셨습니다.')}" var="successful"><p style='text-align: center;'><strong>${list.title}의 거래를 시작해보세요.</strong></p></c:if>
	                              <c:if test="${fn:contains(message.chatcontent, '약속')}" var="appointed">
	                               	  <p style='text-align: center;'>
	                               	  <strong>약속</strong></br>
	                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[1]}"/>
    								  <c:set var = "length" value = "${fn:length(string)}"/>
	                               	  <strong>날짜: </strong>${fn:substring(string, 0, length-2)}<strong></br>
	                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[2]}"/>
    								  <c:set var = "length" value = "${fn:length(string)}"/>
	                               	  시간: </strong>${fn:substring(string, 0, length-2)}</br>
	                               	  <strong>장소</strong></br>
	                               	  ${fn:split(message.chatcontent,':')[3]}</br><a target='_blank' href='https://map.kakao.com/link/search/${fn:split(message.chatcontent,":")[3]}' id="appointedmap">지도로 보기</a></p></c:if>
	                              <c:if test="${!phon and !appointed and !transfer and !payment and !successful and !phonOK}"><p style='text-align: center;'>${message.chatcontent }</p></span></c:if>
                              </c:if>
                              
	                          <c:if test="${!chatimg}" var="chatimg">
	                              <img style="border-radius: 15px; width: 50%; float:right;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
	                          </c:if>
                              <span style='float: right;font-size: small; margin-top:5px;'> <fmt:formatDate value="${message.sendtime}" pattern="a HH:mm:ss"/></span>
                           </div>
                        </div>
                     </c:if>
                     <!-- 받는사람 -->
                     
                      <c:if test="${!myuserno}">
	                      <div class='outgoing_msg rowNum'  >
	                         <div class='incoming_msg_img'>
		                         <c:if test="${userNickname.nickname eq chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}" alt="sunil"></c:if>
		                         <c:if test="${userNickname.nickname ne chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}" alt="sunil"></c:if>
	                         	 <c:if test="${userNickname.nickname ne wirtenickName }" var="chatuser">
	                              <span>${wirtenickName}</span>
	                           </c:if>
	                            
	                           <c:if test="${!chatuser }">
	                              <span>${chatnickname}</span>
	                           </c:if>
	                           <c:if test="${userNickname.nickname eq nicknames.sendusernickname }" var="nickname">
	                              <span>${nicknames.writeusernickname}</span>
	                           </c:if>
	                           <c:if test="${!nickname }">
	                              <span>${nicknames.sendusernickname }</span>
	                           </c:if>
	                         </div>
	                         <div class='received_msg'>
	                            <div class='received_withd_msg '>
		                           <c:if test="${message.img eq null }" var="chatimg">
	                               	  <c:if test="${fn:contains(message.chatcontent, '전화번호 공유를 요청하였습니다.')}" var="phon"><p style='text-align: center;'><strong>전화번호 공유를 요청하였습니다</strong><br/><button class="btn btn-outline-warning m-3 agreemrnt" id="${loop.count} " >동의</button><button class="btn btn-outline-dark m-3 disagreemrnt" id="${loop.count} " >비동의</button></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '::명함::')}" var="phonOK"><p style='text-align: center;display: flex;align-items:center;'>
	                               	  	<c:if test="${userNickname.nickname eq chatroom.writeusernickname }"><img class="chat-header-image" style="display: block; width: 70px;height: 70px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}" alt="sunil"></c:if>
		                         		<c:if test="${userNickname.nickname ne chatroom.writeusernickname }"><img class="chat-header-image" style="display: block; width: 70px;height: 70px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}" alt="sunil"></c:if>
		                         		<span>
		                         		<c:if test="${userNickname.nickname eq nicknames.sendusernickname }" var="nickname">
			                             <strong> ${nicknames.writeusernickname}</strong></br>${nicknames.writeuserphonenumber}
			                           </c:if>
			                           <c:if test="${!nickname }">
			                              <strong>${nicknames.sendusernickname }</strong></br>${nicknames.senduserphonenumber}
			                           </c:if></span></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '송금 되었습니다')}" var="transfer"><p style='text-align: center;'><strong>${message.chatcontent }</strong><br/><button class='btn btn-outline-warning m-3 success' id="${loop.count} "  onclick='payCharge()'>받기</button></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '축하합니다.낙찰되셨습니다.')}" var="successful"><p style='text-align: center;'><strong>${list.title}의 거래를 시작해보세요.</strong></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '받으셨습니다.')}" var="payment"><p style='text-align: center;'><strong>${message.chatcontent }</strong></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '약속')}" var="appointed">
		                               	  <p style='text-align: center;'>
		                               	  <strong>약속</strong></br>
		                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[1]}"/>
	    								  <c:set var = "length" value = "${fn:length(string)}"/>
		                               	  <strong>날짜: </strong>${fn:substring(string, 0, length-2)}</br>
		                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[2]}"/>
	    								  <c:set var = "length" value = "${fn:length(string)}"/>
		                               	  <strong>시간: </strong>${fn:substring(string, 0, length-2)}</br>
		                               	  <strong>장소</strong></br>
		                               	  ${fn:split(message.chatcontent,':')[3]}</br><a target='_blank' href='https://map.kakao.com/link/search/${fn:split(message.chatcontent,":")[3]}' id='appointedmap'  '>지도로 보기</a></p></c:if>
									  <c:if test="${!phon and !appointed and !transfer and !payment and !successful and !phonOK}"><p style="text-align: center;">${message.chatcontent }</p></c:if>	                               	  
		                           </c:if>
		                           <c:if test="${!chatimg}" var="chatimg">
		                              <img style="border-radius: 15px; width: 50%; float:left;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
		                            </c:if>
	                            </div>
	                           <span style='float: left;font-size: small; margin-top:5px;'> <fmt:formatDate value="${message.sendtime}" pattern="a HH:mm:ss"/></span>
	                         </div>
	                      </div>
                      </c:if>
                     </c:forEach>
               </div>
            </div>
         </div>
		<!-- 약속잡기모달 -->
         <div id="modal" class="modal fade mapmodal">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black; font-size: 20px; font-weight: bold; ">약속 설정하기</h1>
                     </div>
                     <div class="modal-body">
                     <form class="form-horizontal" role="form" method="POST" action="#">
                     
                       <div class="form-group">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/chat_calendar.png"
                         onClick="modal_map()" style="margin-top:10px; margin-bottom:10px"/>
                         <div class="input-group date" id="datepicker">
                           <input class="form-control" placeholder="YYYY/MM/DD" id="date"/><span class="input-group-append input-group-addon"><span class="input-group-text"><img style="" src="${pageContext.request.contextPath}/resources/assets/img/hand-pointer.png"></span></span>
                         </div>
                       </div>
                       <div class="form-group">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/chat_date.png"
                         onlick="modal_map()" style="margin-top:10px; margin-bottom:10px"/>
                         <div class="input-group time" id="timepicker">
                           <input class="form-control" placeholder="오전/오후 HH시 MM분 " id="time"/><span class="input-group-append input-group-addon"><span class="input-group-text"><img src="${pageContext.request.contextPath}/resources/assets/img/hand-pointer.png"></span></span>
                         </div>
                       </div>
                         <img src="${pageContext.request.contextPath}/resources/assets/img/geolocation_pin.png"
                         onlick="modal_map()" id="modal_map" style="margin-top:10px; margin-bottom:10px"/>
                       <h5 style="font-size: 10px">*공유할 약속 장소의 위치를 눌러 마커를 찍어보세요.</h5>
                       <div class="form-group" style="display:none" id="map">
                          <div style="width:450px;height:380px;margin-top: 30px"></div> 
                       </div>
                       </form>
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-dark appointed" style="color:#fff" data-dismiss="modal" id="appointed">약속 잡기</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         
         <!-- 전화번호모달 -->
         <div id="modalPhon" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black; font-size: 20px; font-weight: bold; ">연락처 공유</h1>
                     </div>                    
                     <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                         <span  style="margin-top: 20px;">연락처 공유를 하시겠습니까?</span>
                       </form>
                     </div>
                     <div class="modal-footer">
                     <button type="button" class="btn btn-dark my-3" data-dismiss="modal" id="phon" style="margin: auto; display: block; float:right">연락처 보내기</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         
         <!-- 낙찰 전 -->
         <div id="modalsale" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black;"> 주의</h1>
                     </div>
                     <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                         <div>낙찰이 결정되지 않았습니다. 송금을 하시겠습니까?</br>
                         송금을 진행하시려면 '계속' 종료하시려면 '종료' 버튼을 눌러주세요</div>
                       <a type="button" data-toggle="modal" data-target="#modalpayment" class="title m-b-md btn btn-dark"  data-dismiss="modal">계속</a>
                       <button type="button" class="btn btn-dark" style="color:#fff" data-dismiss="modal"  style="margin: auto; display: block;">종료</button>
                       </form>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
           <!-- 송금하기모달 -->      
           <div id="modalpayment" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black; font-size: 20px; font-weight: bold; ">송금하기</h1>
                     </div>
                       <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                          <input id="pay" class="input" type="text" > 원 <br/>
                          <h1 style="font-size: 14px; color: #FFC107; font-weight: bold; text-align:center;margin-top: 10px">페이 잔액
                          <span style="font-size: 14px; color: #000" id="myPay"></span> </h1>
                          
                          <h1 style="font-size: 12px; font-weight: bold; text-align:left; margin-top: 30px; ">자바라페이로 보낸다고 알려 주셨나요?</h1>
                          <h1 style="font-size: 10px; text-align:left">- 이미 송금이 완료되었다면 수취인의 동의 없이 취소 할 수 없어요.</h1>
                          <h1 style="font-size: 10px; text-align:left; margin-bottom: -10px" >- 연락이 되었다고 하더라도, 상대방의 동의 없이 송금을 취소하기는 어려운 점 양해 부탁드려요.</h1>
                          
                          <span class="underline"></span>
                        </form>
                  </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-dark" style="color:#fff" data-dismiss="modal" id="payRemit" onclick="payRemit()">보내기</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         <!-- 사진모달 -->
         <div id="modalImg" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black;"> 사진 전송</h1>
                     </div>
                     <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                         <div id="imgtoggleDiv" style=" display: flex; justify-content: center; align-items: center;">
				             <img id="imge" src="#" style="width: 180px; display: none;"/>
				         </div>
				         <div>
				         <a type="button" id="imgtoggle" ><i class="bi bi bi-card-image m-1" style="font-size: 180px;"></i></a> 
				         </div>
                           <!-- <span style="font-size: 12px; margin-top: 30px; margin-left: 230px;">사진을 전송하시겠습니까?</span> -->
                       <button type="button"  class="btn btn-dark" data-dismiss="modal" onclick="sendFile()" style="display: block; color: #fff; ">보내기</button>
                       </form>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         
         <!-- 이모티콘 -->
         <div id="emojitoggleDiv">
            <div id="emoji" style="display: flex; flex-wrap:wrap;">
            	<%-- <div id="emoji1toggleDiv" style="display:none ">
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/개신남.png" style="width: 90px;" alt="개신남.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/굳.png" style="width: 90px;" alt="굳.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/궁금.png" style="width: 90px;" alt="궁금.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/눈물.png" style="width: 90px;" alt="눈물.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/느낌.png" style="width: 90px;" alt="느낌.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/덜덜.png" style="width: 90px;" alt="덜덜.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/박수.png" style="width: 90px;" alt="박수.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/번득.png" style="width: 90px;" alt="번득.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/복잡.png" style="width: 90px;" alt="복잡.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/뿌.png" style="width: 90px;" alt="뿌.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/신남.png" style="width: 90px;" alt="신남.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/알랍.png" style="width: 90px;" alt="알람.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/우울.png" style="width: 90px;" alt="우울.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/점점점.png" style="width: 90px;" alt="점점점.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/정말.png" style="width: 90px;" alt="정말.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/지루.png" style="width: 90px;" alt="지루.png" class="emojis"/></a>
	                <a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/화남.png" style="width: 90px;" alt="화남.png" class="emojis"/></a>
                </div> --%>
                
                <div id="emoji2toggleDiv" style="display:none ">
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon안녕하세요.png" style="width: 90px;" alt="jabaraemoticon안녕하세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon감사합니다.png" style="width: 90px;" alt="jabaraemoticon감사합니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon낙찰되셨습니다.png" style="width: 90px;" alt="jabaraemoticon낙찰되셨습니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon도착하였습니다.png" style="width: 90px;" alt="jabaraemoticon도착하였습니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon물음표네.png" style="width: 90px;" alt="jabaraemoticon물음표네.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon어디세요.png" style="width: 90px;" alt="jabaraemoticon어디세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon예.png" style="width: 90px;" alt="jabaraemoticon예.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon으에.png" style="width: 90px;" alt="jabaraemoticon으에.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon잘쓸게요.png" style="width: 90px;" alt="jabaraemoticon잘쓸게요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon저주세요.png" style="width: 90px;" alt="jabaraemoticon저주세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon죄송합니다.png" style="width: 90px;" alt="jabaraemoticon죄송합니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon출발하였습니다.png" style="width: 90px;" alt="jabaraemoticon출발하였습니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon하트하트.png" style="width: 90px;" alt="jabaraemoticon하트하트.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon허걱.png" style="width: 90px;" alt="jabaraemoticon허걱.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticon화났다.png" style="width: 90px;" alt="jabaraemoticon화났다.png" class="emojis"/></a>
             	</div>
             </div>
         </div>
         
         <!-- 채팅버튼 -->
            <div style="display:none " class="type_msg" id="emojisub" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>">
	       		<%-- <a type="button" id="emoji1"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/개신남.png" style="width: 50px;" /></a> --%>
               	<a type="button" id="emoji2"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/jabaraemoticonbinemoji.png" style="width: 50px;"/></a>
	        </div>
            <div  class="type_msg" id="form" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
               <div class="css-1r0o66s" id="plusDiv" style="display: none; top:100px; left:100px;">
	                <a type="button" id="emojitoggle" ><i class="bi bi bi-emoji-smile m-1" style="float: left; font-size: 35px;"></i></a> 
	                <a type="button" id="imgbutton" data-toggle="modal" data-target="#modalImg" class="title m-b-md"><i class="bi bi bi-card-image m-1" style="float: left; font-size: 35px;"></i></a> 
	         		<a href="#"  data-toggle="modal" data-target="#modal" class="title m-b-md"><i class="bi bi-clock m-1" style="float: left; font-size: 35px;"></i></a>
	                <a type="button" id="phone" data-toggle="modal" data-target="#modalPhon" class="title m-b-md"><i class="bi bi bi bi-telephone-fill m-1" style="float: left; font-size: 35px;"></i></a> 
	                <c:if test="${userno ne writeuserno}">
	                <!--<a type="button" id="jpays" data-toggle="modal" data-target="#modalJpay" class="title m-b-md"><i class="bi bi-credit-card-2-back m-1" style="float: left; font-size: 35px;"></i></a> --></c:if>
	                <c:if test="${list.status == 'SALE'}">
	                <a type="button" id="sale"  data-toggle="modal" data-target="#modalsale" class="title m-b-md"><i class="bi bi-credit-card-2-back-fill m-1" style="float: left; font-size: 35px;"></i></a></c:if>
	                <c:if test="${list.status == 'END'}">
	                <a type="button" data-toggle="modal" data-target="#modalpayment" class="title m-b-md"><i class="bi bi-credit-card-2-back-fill m-1" style="float: left; font-size: 35px;"></i></a></c:if>
	                <input type="file" id="file" name="file" onchange="uploadFile(this)" style="display:none">
	         </div>
               <div class="input_msg_write d-flex ">
                  <a type="button" id="plus"  class="title m-b-md"><i class="bi bi-plus-square m-1" style="float: left; font-size: 35px;"></i></a>
                  <input type="text" class="write_msg" placeholder="메시지를 입력하세요" id="chatcontent" name="chatcontent"/>
                  <a href="javascript:void(0);" id="send" type="submit"><i class="bi bi-send m-1" aria-hidden="true"  style="float: right; font-size: 35px;"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>
<script>


///사진전송
document.getElementById("file").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("imge").src = e.target.result;
        $("#imgtoggle").hide();
        $("#imge").show();
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};



$('#imgtoggle').click(function (e) {
   e.preventDefault();
   $('#file').click();
});
$('#imge').click(function (e) {
   e.preventDefault();
   $('#file').click();
});

function uploadFile(e) {
   //console.log("File Name:",e.value);
}





   //채팅
   
   
   var wsocket;
   var nickname;
   <c:if test="${userNickname.nickname ne wirtenickName }" var="chatuser">
   nickname='${wirtenickName}'
   </c:if>
   <c:if test="${!chatuser }">
   nickname='${chatnickname}'
   </c:if>
   <c:if test="${userNickname.nickname eq nicknames.sendusernickname }" var="nickname">
   nickname='${nicknames.writeusernickname}'
   </c:if>
   <c:if test="${!nickname }">
   nickname='${nicknames.sendusernickname }'
   </c:if>
   
   
   
   //닉 네임 저장용
   //입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
   
      wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/${room_no}'/>");//192.168.219.101//192.168.0.129
      wsocket.binaryType = "arraybuffer";
      //console.log('wsocket:',wsocket);
      //서버와 연결된 웹 소켓에 이벤트 등록
      wsocket.onopen = open;
      wsocket.onclose=function(){
         //appendMessage("연결이 끊어 졌어요");
    	  wsocket.send("Close from javara Website");
    	  
      };
      wsocket.onmessage=receive;
      wsocket.onerror=function(e){
         //console.log('에러발생:',e)
      }
      
   //서버에 연결되었을때 호출되는 콜백함수
   
   
   function open(){
	   
	   wsocket.send("Hello from Javara Website");
	   
      if(${room_no}!=""){
         appendMessage("<div style='text-align: center; margin-top:5px;'>"+"여기까지 읽으셨습니다."+"</div><br/>");
         
      }
      else{
    	 
         appendMessage("<div style='text-align: center; margin-top:5px;'>"+"대화를 시작해보세요"+"</div><br/>");
      }
   }
   
   
  
    var unreadCount;
    
    
   //서버에서 메시지를 받을때마다 호출되는 함수 
   function receive(e){//e는 message이벤트 객체
	   
	   
	   if(e.data.includes("Hello from samsung")){
	   	wsocket.send("Open from Javara Website");
		   
	   }
   		// unreadCount 0으로 처리하기위한 ajax
	   $.ajax({
	         url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
	         type: 'get',
	         dataType: 'text',
	         success: function (result) {
	            //console.log(result)
	         },
	         error: function () {
	            //console.log('error')
	         }
	      });
	  
   		//채팅 보낸시간
      var today = new Date();   
      //일반 메세지
      var start = e.data.indexOf(":");
      
      //일반 메세지
      if(e.data.includes('서버로부터받은 메시지${room_no}:')){
         appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
         +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
         +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align: center;'>"+e.data.substring(start+1)+"<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
      }
   
   	////이미지 메세지
      else if(e.data.includes('서버로부터받은 img 메시지${room_no}:')){
         appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
               +"<div class='received_msg'><div class='received_withd_msg'><img style='border-radius: 15px; width: 50%;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+e.data.substring(start+1)+"'/></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
      }
  ////약속 메세지
      else if(e.data.includes('서버로부터받은 약속 메시지${room_no}:')){
    	  let arr = e.data.split(/[:,]/);
    	  var start1 = arr[2].length;
          appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
          +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
          +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align: center;'><strong>약속</strong></br><strong>날짜: </strong>"+arr[2].substr(0,start1-2)+"<strong></br>시간: </strong>"+arr[3].substr(0,start1-2)+"</br><strong>장소</strong></br>"+arr[4]+"</br><a target='_blank' href='https://map.kakao.com/link/search/"+arr[4]+"' id='appointedmap' '>지도로 보기</a><br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
          +today.toLocaleTimeString()+"</span></div></div>");
       }
      
   ////전화번호 공유 요청했을때 메세지
   	else if(e.data.includes('서버로부터받은 전화번호공유 메시지${room_no}:')){
   		appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
                +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
                +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align:center;display: flex;align-items:center;'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image'style='display: block; width: 70px;height: 70px;' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
        		+"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' style='display: block; width: 70px;height: 70px;' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"
        		+"<span><c:if test='${userNickname.nickname eq nicknames.sendusernickname }' var='nickname'><strong> ${nicknames.writeusernickname}</strong></br>${nicknames.writeuserphonenumber}</c:if>"
              +"<c:if test='${!nickname }'><strong>${nicknames.sendusernickname }</strong></br>${nicknames.senduserphonenumber}</c:if></span><br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
                +today.toLocaleTimeString()+"</span></div></div>"); 
      }
      //송금
	   else if(e.data.includes('서버로부터받은 송금 메시지${room_no}:')){
		  	let arr = e.data.split(/[:원]/);
	    	  //console.log(arr);
	         appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
	         +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
	         +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align: center;'><strong>"+arr[1]+"원</strong>을 보내셨습니다.<br/><button class='btn btn-outline-warning m-3 success' id='success' onclick='payCharge()'>받기</button><input type='hidden' class='payval' value='"+arr[1]+"'/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
	         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
	      }
      //입금
	   else if(e.data.includes('서버로부터받은 입금 메시지${room_no}:')){
		  	let arr = e.data.split(/[:원]/);
	    	  console.log(arr);
	         appendMessage("<div class='outgoing_msg rowNum'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
	         +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
	         +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align: center;'><strong>"+arr[1]+"원</strong>을 받으셨습니다.</p><span style='float: left;font-size: small; margin-top:5px;'>"
	         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
	      }
      
         
   }
   
   
   //나한테 보내주는 메세지
   function appendMessage(msg){
      
      $('#chatMessage').append(msg);
      $('#chatMessage').scrollTop($('#chatMessage').prop('scrollHeight'));
      $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
   }
   
   
   //메세지 보내기
   
   //엔터키전송
   $('#chatcontent').on('keypress',function(e){
      if(e.keyCode===13){//엔터 입력
         $('#send').trigger("click");
         
      }
   });

   //텍스트 보내기
      $('#send').on('click',function(){
    	  var today = new Date();   
         var form1 = $("#form").serialize();
         if($('#chatcontent').val().length>=1){
            $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:$('#chatcontent').val(),
                     senduserno:${userno},
                     unread_count:unreadCount,
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
                  //console.log(result)
               },
               error: function () {
                  //console.log('error')
               }
            });
         
         
         
            //console.log('보낸 메시지${room_no}:',$('#chatcontent').val());
            //console.log('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            
           
            wsocket.send('서버로부터받은 메시지${room_no}:'+$('#chatcontent').val());//msg:KOSMO>>안녕
            wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            //DIV(대화영역)에 메시지 출력
            
            appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p style='text-align: center;'>"
                  +$('#chatcontent').val()+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
                  +today.toLocaleTimeString()+"</span></div></div>");
         }
      
         
         //기존 메시지 클리어      
         $('#chatcontent').val("");
         //포커스 주기
         $('#chatcontent').focus();
         $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      });
   
   
   ///
   
   
   ///약속잡기
   var appointed = $('button[name=appointed]');
      $(document).on("click", '.appointed', function(e){
    	  var today = new Date(); 
    	  var form1 = $("#form").serialize();  
    	  var time;
    	  if($('#time').val().includes('am')){
    		   time = $('#time').val().replace('am', '오전');
    	  }else if($('#time').val().includes('pm')){
    		   time = $('#time').val().replace('pm', '오후');
    	  }
		$.ajax({
			url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
			data: {chatcontent:"약속 날짜: "+$('#date').val()+" 시간: "+time+" 장소: "+$("#adrress").text(),
					senduserno:${userno},
					unread_count:'1',
					sendtime: today.toLocaleTimeString('en-US'),
					'${_csrf.parameterName}':'${_csrf.token}'},
			type: 'POST',
			dataType: 'text',
			success: function (result) {
				//console.log(result)
			},
			error: function () {
				//console.log('error')
			}
		});
		
	    	wsocket.send('서버로부터받은 약속 메시지${room_no}:'+"약속 날짜: "+$('#date').val()+" 시간: "+time+" 장소: "+$("#adrress").text());//msg:KOSMO>>안녕
	  		wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
	     
	  		appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p style='text-align:center;'>"
	  				+"<strong>약속</strong></br><strong>날짜: </strong>"+$('#date').val()+"<strong></br>시간: </strong>"+time+"</br><strong>장소</strong></br>"+$("#adrress").text()+"</br><a target='_blank' href='https://map.kakao.com/link/search/"+$('#adrress').text()+"' id='appointedmap' '>지도로 보기</a>"+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
	  				+today.toLocaleTimeString()+"</span></div></div>");
		
		//기존 메시지 클리어		
		$('#chatcontent').val("");
		$('#chatcontent').focus();
        $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
		
        var appointedmap = $('a[id=appointedmap]');
        $(document).on("click", '#appointedmap', function(e){
  		    
		});
	});
   
    ///이미지
      function sendFile() {
        var chatimg = new FormData();
        chatimg.append('chatimg', document.getElementById('file').files[0]);
        chatimg.append("${_csrf.parameterName}", "${_csrf.token}");
        var today = new Date(); 
        $.ajax({
	        url: '<c:url value="/chat/chatimg.do"><c:param value="사진" name="chatcontent"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
	        data: chatimg,
	        type: 'POST',
	        dataType : "text",
	        processData: false,    
	        contentType: false,
		     success: function (result) {
		        //console.log(result)
		        wsocket.send('서버로부터받은 img 메시지${room_no}:'+result);
		        wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
		           appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><img style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
		           +"<br/><span style='float: right;font-size: small; margin-top:5px;'>"
		              +today.toLocaleTimeString()+"</span></div></div>");
		         },
	         error: function () {
	            //console.log('error')
	         }
         });
        
        $("#imgtoggle").show();
        $("#imge").hide();
        $('#chatcontent').focus();
        $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      
      }
      
    ///이모티콘 
      var emojis = document.querySelectorAll('.emojis');
      for(var i=0; i<emojis.length;i++){
            var result;
            emojis[i].onclick=function(e){
               result=this.alt;
               var today = new Date(); 
               //console.log(result)
               wsocket.send('서버로부터받은 img 메시지${room_no}:'+result);
               wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
                  appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><img  style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
                  +"<br/><span style='float: right;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
                  
                  $.ajax({
                  url: '<c:url value="/chat/chattingemoji.do"><c:param value="${userno}" name="userno"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
                  data: {img:result,
                	  chatcontent:'이모티콘',
                        '${_csrf.parameterName}':'${_csrf.token}'},
                  type: 'POST',
                  dataType: 'text',
                  success: function (result) {
                     //console.log(result)
                  },
                  error: function () {
                     //console.log('error')
                  }
               });
                 //$("#emojitoggleDiv").toggle();
                 
            }
            $('#chatcontent').focus();
            $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      }
      
      //전화번호보내기
      $('#phon').on('click',function(){
         var form1 = $("#form").serialize();
         var today = new Date();       
         $.ajax({
             url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
             data: {chatcontent:'::명함::',
                   senduserno:${userno},
                   unread_count:unreadCount,
                   sendtime: today.toLocaleTimeString('en-US'),
                   '${_csrf.parameterName}':'${_csrf.token}'},
             type: 'POST',
             dataType: 'text',
             success: function (result) {
		            //console.log(result);
		            wsocket.send('서버로부터받은 전화번호공유 메시지${room_no}:'+"::명함::");
		            wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
		            appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p style='text-align:center;display: flex;align-items:center;'><img class='chat-header-image' style='display: block; width: 70px;height: 70px;' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}' alt='대화상대아이디'></br><span><strong>${userNickname.nickname }</strong></br>${userNickname.phonenumber}<span></p>"
	                +"<span style='float: right;font-size: small; margin-top:5px;'>"
		            +today.toLocaleTimeString()+"</span></div></div>");
                
             },
             error: function () {
                //console.log('error')
             }
          });
         
      });
      
    
      // 페이 잔액 
      $.ajax({
         type: 'POST',
         url : '<c:url value="/pay/balance.do"/>',
         data : {
                'deposit' : 0,
                'withdraw' : 0,
                 '${_csrf.parameterName}' : '${_csrf.token}'
                  },
           dataType : "text",
         success : function(result){
                $('#myPay').text(result
                      .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                      +'원')
                 $('#myPay').attr('title', result)      
                
                }
               });   
        
      
        
     
        // 페이 - 송금 하기    
        function payRemit(){
         // //console.log('클릭 이벤트');
          var remit = $('#pay').val(); // 송금액
          //console.log('typeof remit',typeof remit);
          //console.log('remit',remit);
          var amount =  parseInt($('#myPay').attr('title'));// 잔액
          //console.log('typeof amount',typeof amount);
           //console.log(amount);
          if(remit > amount){
              const Toast = Swal.mixin({
                     toast : true,
                     position : 'center-center',
                     showConfirmButton : false,
                     timer : 1000,
                     timerProgressBar : true,
                  })

                  Toast.fire({
                     icon : 'error',
                     title : '페이 잔액이 부족합니다'
                  })
          }
          else{
               $.ajax({
                  type: 'POST',
                   url : '<c:url value="/pay/balance.do"/>',
                   data : {
                           'deposit' : 0,
                           'withdraw' : remit,                        
                           '${_csrf.parameterName}' : '${_csrf.token}'
                            },
                     dataType : "text",
                     
                     success : function(result){
                    	 
                    	 //console.log(result);
    	                
                  
                          $('#myPay').text(result
                                .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                                +'원')
                                $('#myPay').attr('title', result)   
                                 const Toast = Swal.mixin({
                                         toast : true,
                                         position : 'center-center',
                                         showConfirmButton : false,
                                         timer : 1000,
                                         timerProgressBar : true,
                                      })
   
                                      Toast.fire({
                                         icon : 'success',
                                         title : '송금 완료하였습니다'
                                      })
                                      var today = new Date(); 
                                      $.ajax({
                         	             url: '<c:url value="/chat/chatting.do"><c:param value="${room_no}" name="room_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
                         	             data: {chatcontent:+$("#pay").val()+"원이 송금 되었습니다.",
                         	                   senduserno:${userno},
                         	                   unread_count:unreadCount,
                         	                   sendtime: today.toLocaleTimeString('en-US'),
                         	                   '${_csrf.parameterName}':'${_csrf.token}'},
                         	             type: 'POST',
                         	             dataType: 'text',
                         	             success: function (result) {
                         	            	 
                         	             }
                         	          });
                                      wsocket.send('서버로부터받은 송금 메시지${room_no}:'+$("#pay").val()+"원을 보내셨습니다.");
                                      wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
              	                    appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p id='payval' data-money='"+$("#pay").val()+"' style='text-align:center;'><strong>"+$("#pay").val()+"원</strong>을 보내셨습니다.<br/></p>"
              	                    +"<span style='float: right;font-size: small; margin-top:5px;'>"
              	                 +today.toLocaleTimeString()+"</span></div></div>");
                           }
                     
                       
                    });     
               } 
           };
           
           
           // 페이 - 송금 받기
           /* function payCharge(){
              // console.log('클릭 이벤트');
        	   var payval = document.querySelectorAll('.payval');
               for(var i=0; i<payval.length;i++){
      	         var remit = payval[i].value;     
               } 
              
                 
                         
           } */
    
      
//송금확인
      var success = $('button[name=success]');
      $(document).on("click", '.success', function(e){
         var form1 = $("#form").serialize();
	     var payval = document.querySelectorAll('.payval');
         for(var i=0; i<payval.length;i++){
	         var remit = payval[i].value;     
         }
         
         
         //console.log('송금 받기',remit);
         //console.log(remit);
            $.ajax({
               type: 'POST',
              url : '<c:url value="/pay/balance.do"/>',
             data : {
                   'deposit' : remit,
                   'withdraw' : 0,
                 '${_csrf.parameterName}' : '${_csrf.token}'
               },
               dataType : "text",
             success : function(result){
             
                $('#myPay').text(result
                      .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                    +'원')
             }
               
            });
         
            var today = new Date(); 
    	    console.log(document.getElementsByClassName('rowNum').length);
          $.ajax({
            url: '<c:url value="/chat/clickEvents.do"><c:param value="${room_no}" name="room_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
            data:{chatcontent:"송금이 완료되었습니다.",
                senduserno:${userno},
                unread_count:unreadCount,
                rownum:document.getElementsByClassName('rowNum').length,
                sendtime: today.toLocaleTimeString('en-US'),
                '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
            	
            },
            error: function () {
               //console.log('error')
            }
         });
          $.ajax({
              url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
              data: {chatcontent:remit+'원을 받으셨습니다.',
                    senduserno:${userno},
                    unread_count:unreadCount,
                    sendtime: today.toLocaleTimeString('en-US'),
                    '${_csrf.parameterName}':'${_csrf.token}'},
              type: 'POST',
              dataType: 'text',
              success: function (result) {
                 //console.log(result)
              },
              error: function () {
                 //console.log('error')
              }
           });
         
         //console.log(result);
         wsocket.send('서버로부터받은 입금 메시지${room_no}:'+remit+'원을 받으셨습니다.');
         wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p style='text-align:center;'><strong>"+remit+"원</strong>을 받으셨습니다.</p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
         $('.success').attr('disabled',true);
     });

    //후기작성
      var complete = $('button[name=complete]');
      $(document).on("click", '.complete', function(e){
         var form1 = $("#form").serialize();
         
            var today = new Date(); 
          $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
            data: {chatcontent: "",
                  senduserno:${userno},
                  unread_count:unreadCount,
                  sendtime: today.toLocaleTimeString('en-US'),
                  '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
            },
            error: function () {
            }
         });
         
         wsocket.send('서버로부터받은 메시지${room_no}:'+"");
         wsocket.send('RoomNo${room_no},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            appendMessage("<div class='outgoing_msg rowNum'><div class='sent_msg'><p style='text-align:center;'>"+"보낼내용은여기다입력"+"</p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
            
     });
 
    
      
      /////채팅방 나가기
      $('#deletchtroom').on('click',function(){
          var form1 = $("#form").serialize();
          var today = new Date(); 
           $.ajax({
	             url: '<c:url value="/chat/deletchtroom.do"><c:param value="${room_no}" name="room_no"/></c:url>',
	             data: {chatcontent:"<strong>${userNickname.nickname }님이 방을 나가셨습니다.</strong>",
	                   senduserno:${userno},
	                   unread_count:unreadCount,
	                   sendtime: today.toLocaleTimeString('en-US'),
	                   '${_csrf.parameterName}':'${_csrf.token}'},
	             type: 'POST',
	             dataType: 'text',
	             success: function (result) {
	            	 //console.log(result);
	                 wsocket.send('서버로부터받은 메시지${room_no}:'+"<strong>${userNickname.nickname }님이 방을 나가셨습니다.");
	             },
	             error: function () {
	                //console.log('error');
	             }
	          });
          
       }); 
      
      
      
      
   
   
   
   
   $(function (){
      $("#chatmenutoggle").click(function (){
           $("#chatmenuToggleDiv").toggle();
        });
      $("#chatmenuToggleDiv").click(function (){
           $("#chatmenuToggleDiv").toggle();
        });
      $("#imgbutton").click(function (){
           $("#plusDiv").toggle();
           $("#sendFile").toggle();
           $("#send").toggle();
        });
      $("#modal_map").click(function (){
           $("#map").toggle(1000);
           setTimeout(function() {
               map.relayout();                 
               myAddressMap($("#myAddress").text());                  
            }, 1000);
           $("#plusDiv").toggle();
        });
      $("#emojitoggle").click(function (){
           $("#plusDiv").toggle();
           $("#emojisub").toggle();
        });
      $("#plus").click(function (){
           $("#plusDiv").toggle();
        });
      $("#sendFile").click(function (){
           $("#sendFile").toggle();
           $("#send").toggle();
        });
      $("#emoji1").click(function (){
           $("#emoji1toggleDiv").toggle();
           $("#emojisub").toggle();
        });
      $("#emoji2").click(function (){
           $("#emoji2toggleDiv").toggle();
           $("#emojisub").toggle();
        });
      $("#emoji1toggleDiv").click(function (){
           $("#emoji1toggleDiv").toggle();
        });
      $("#emoji2toggleDiv").click(function (){
           $("#emoji2toggleDiv").toggle();
        });
         
      
   
   });
   
   
   //약속잡기
   if (/Mobi/.test(navigator.userAgent)) {
  // if mobile device, use native pickers
  $(".date input").attr("type", "date");
  $(".time input").attr("type", "time");
} else {
  // if desktop device, use DateTimePicker
  $("#datepicker").datetimepicker({
    useCurrent: false,
    format: "YYYY-MM-DD",
    showTodayButton: true,
    icons: {
      next: "fa fa-chevron-right",
      previous: "fa fa-chevron-left",
      today: 'todayText',
    }
  });
  $("#timepicker").datetimepicker({
    format: "a hh시 mm분",
    icons: {
      up: "fa fa-chevron-up",
      down: "fa fa-chevron-down"
    }
  });
}

   
   
   $('#modal').on('show', function () {    $.fn.modal.Constructor.prototype.enforceFocus = function () { };});
   
    
   $('#modal_map').click(function (e) {
                showKakaoMap(37.478745014709745, 126.8787909892446); 
      
        // 현재 위치의 위도/경도를 중심좌표로 지도를 표시하는 함수
        function showKakaoMap(lat,lng){
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            var options = { //지도를 생성할 때 필요한 기본 옵션
                   center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표
                   level: 3 //지도의 레벨(확대, 축소 정도)
             
                   };
            
            map = new kakao.maps.Map(container, options);
            
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new daum.maps.services.Geocoder();
        
            var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
            infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
        
       
            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
            daum.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                        var detailAddr = !!result[0].road_address ? '<div id="adrress">' + result[0].road_address.address_name + '</div>' : '';
            
                        var content = '<div class="bAddr">' + detailAddr
                         + '</div>';
            
                        // 마커를 클릭한 위치에 표시합니다 
                        marker.setPosition(mouseEvent.latLng);
                        marker.setMap(map);
            
                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                        
                        var latlng = mouseEvent.latLng;
                              
                        $('input:text[name="cvplplcGpsX"]').val(latlng.getLng());
                        $('input:text[name="cvplplcGpsY"]').val(latlng.getLat());
                    }   
                });
            });
            
        
        function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
        }
        
        function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }
        
        //지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
        function displayCenterInfo(result, status) {
        if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        
                for(var i = 0; i < result.length; i++) {
        // 행정동의 region_type 값은 'H' 이므로
                    if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                    }
            }
        }    
        }
        }
   });
    
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
</script>

