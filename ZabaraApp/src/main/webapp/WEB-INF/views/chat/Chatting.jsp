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
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
    <!-- ======= Chat Details ======= -->
<style>
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
</style>
      <div class=" m-5"> 
      <div class="container">
     <div class="section-title">
        <img src="${pageContext.request.contextPath}/resources/assets/img/title_chat.png" style="width: 200px" />
      </div>
   <div class="messaging ">
      <div class="inbox_msg">
         <div class="inbox_people">
	         <div class="css-1r0o66s">
	            <div class="chat-header-profile">
		            <img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}" alt="대화상대아이디">
		            <div class="main-title" >
			            <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>
			                    ${userNickname.nickname }
			            <span class="temperature">37.6°C</span>
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
                           <span class="temperature">37.6°C</span>
                           </div>
                        </div>
                        <div class="css-1idbtsb" >
                             <div class="more-button-wrapper common-bg-hover"id="chatmenutoggle">
								<i class="bi bi-three-dots-vertical m-1" style="font-size: 35px;"></i>
							</div>
							<div class="option-container" id="chatmenuToggleDiv" style="display:none">
								<div class="option-item common-bg-hover">알림음 끄기</div>
								<div class="option-item common-bg-hover">대화상대 차단하기</div>
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
                        <div class='outgoing_msg'>
                           <div class='sent_msg'  style="text-align: center; ">
                           
                              <c:if test="${message.img eq null }" var="chatimg">
                              	  <c:set var = "string" value = "${message.chatcontent }"/>
   								  <c:set var = "length" value = "${fn:length(string)}"/>
	                              <c:if test="${fn:contains(message.chatcontent, '전화번호 공유를 요청하였습니다')}" var="phon"><p style='text-align: center;'><strong>전화번호 공유를 요청하였습니다</strong><br/></p></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '송금 되었습니다')}" var="transfer"><p style='text-align: center;'><strong>${fn:substring(string, 0, length-12)}</strong></p></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '입급되었습니다')}" var="payment"><p style='text-align: center;'><strong>${fn:substring(string, 0, length-12)}원</strong>이 입금 되었습니다.</br>거래가 종료되었다면 </br>'후기작성'</br> 버튼을 눌러 후기를 작성해주세요.</br><button class='btn btn-outline-success m-3 complete' id='complete'>후기작성</button></p></c:if>
                      	          <c:if test="${fn:contains(message.chatcontent, '축하합니다.낙찰되셨습니다.')}" var="successful"><img style="border-radius: 15px; width: 50%; float:right;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/낙찰되셨습니다.gif"/></br><p style='text-align: center;'><strong>축하합니다.낙찰되셨습니다.</strong></p></c:if>
	                              <c:if test="${fn:contains(message.chatcontent, '약속')}" var="appointed">
	                               	  <span></span><p style='text-align: center;'>
	                               	  <strong>약속</strong></br>
	                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[1]}"/>
    								  <c:set var = "length" value = "${fn:length(string)}"/>
	                               	  <strong>날짜: </strong>${fn:substring(string, 0, length-2)}<strong></br>
	                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[3]}"/>
    								  <c:set var = "length" value = "${fn:length(string)}"/>
	                               	  시간: </strong>${fn:split(message.chatcontent,':')[2]}:${fn:substring(string, 0, length-2)}</br>
	                               	  <strong>장소</strong></br>
	                               	  ${fn:split(message.chatcontent,':')[4]}</br><a target='_blank' href='https://map.kakao.com/link/search/${fn:split(message.chatcontent,":")[4]}' id='appointedmap'  rel='lyteframe' data-gallery='portfolioDetailsGallery' data-glightbox='type: external' class='portfolio-details-lightbox' title='Portfolio Details''>지도로 보기</a></p></c:if>
	                              <c:if test="${!phon and !appointed and !transfer and !payment and !successful}"><p style='text-align: center;'>${message.chatcontent }</p></span></c:if>
                              </c:if>
                              
	                          <c:if test="${!chatimg}" var="chatimg">
	                              <img style="border-radius: 15px; width: 50%; float:right;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
	                          </c:if>
	                          
                              <span style='float: right;font-size: small; margin-top:5px;'> <fmt:formatDate value="${message.sendtime}" pattern="HH:mm:ss"/></span>
                           </div>
                        </div>
                     </c:if>
                     <!-- 받는사람 -->
                      <c:if test="${!myuserno}">
	                      <div class='outgoing_msg'>
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
	                            <div class='received_withd_msg' >
		                           <c:if test="${message.img eq null }" var="chatimg">
	                               	  <c:if test="${fn:contains(message.chatcontent, '전화번호 공유를 요청하였습니다.')}" var="phon"><p style='text-align: center;'><strong>전화번호 공유를 요청하였습니다</strong><br/><button class="btn btn-outline-warning m-3 agreemrnt" id="agreemrnt" >동의</button><button class="btn btn-outline-dark m-3 disagreemrnt" id="disagreemrnt" >비동의</button></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '송금 되었습니다')}" var="transfer"><p style='text-align: center;'><strong>${message.chatcontent }</strong><br/><button class='btn btn-outline-warning m-3 success' id='success' onclick='payCharge()'>받기</button></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '축하합니다.낙찰되셨습니다.')}" var="successful"><img style="border-radius: 15px; width: 50%; float:left;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/낙찰되셨습니다.gif"/></br><p style='text-align: center;'><strong>축하합니다.낙찰되셨습니다.</strong></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '입급되었습니다')}" var="payment"><p style='text-align: center;'>
	                               	  <strong>${message.chatcontent }</strong></br>거래가 종료되었다면 </br>'후기작성'</br> 버튼을 눌러 후기를 작성해주세요.</br><button class='btn btn-outline-warning m-3 complete' id='complete'>후기작성</button></p></c:if>
	                               	  <c:if test="${fn:contains(message.chatcontent, '약속')}" var="appointed">
		                               	  <span><p style='text-align: center;'>
		                               	  <strong>약속</strong></br>
		                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[1]}"/>
	    								  <c:set var = "length" value = "${fn:length(string)}"/>
		                               	  <strong>날짜: </strong>${fn:substring(string, 0, length-2)}<strong></br>
		                               	  <c:set var = "string" value = "${fn:split(message.chatcontent,':')[3]}"/>
	    								  <c:set var = "length" value = "${fn:length(string)}"/>
		                               	  시간: </strong>${fn:split(message.chatcontent,':')[2]}:${fn:substring(string, 0, length-2)}</br>
		                               	  <strong>장소</strong></br>
		                               	  ${fn:split(message.chatcontent,':')[4]}</br><a target='_blank' href='https://map.kakao.com/link/search/${fn:split(message.chatcontent,":")[4]}' id='appointedmap'  rel='lyteframe' data-gallery='portfolioDetailsGallery' data-glightbox='type: external' class='portfolio-details-lightbox' title='Portfolio Details''>지도로 보기</a></p></c:if>
									  <c:if test="${!phon and !appointed and !transfer and !payment and !successful}"><p style="text-align: center;">${message.chatcontent }</p></span></c:if>	                               	  
		                           </c:if>
		                           <c:if test="${!chatimg}" var="chatimg">
		                              <img style="border-radius: 15px; width: 50%; float:left;" src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
		                            </c:if>
	                            </div>
	                            <span style='float: left;font-size: small; margin-top:5px;'> <fmt:formatDate value="${message.sendtime}" pattern="HH:mm:ss"/></span>
	                         </div>
	                      </div>
                      </c:if>
                     </c:forEach>
               </div>
            </div>
         </div>
         <!-- 약속잡기모달 -->
         <div id="modal" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black; font-size: 20px; font-weight: bold; ">약속 설정하기</h1>
                     </div>
                     <div class="modal-body">
                     <form class="form-horizontal" role="form" method="POST" action="#">
                     
                       <div class="form-group">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/chat_calendar.png"
                         onlick="modal_map()" style="margin-top:10px; margin-bottom:10px"/>
                         <div class="input-group date" id="datepicker">
                           <input class="form-control" placeholder="YYYY/MM/DD" id="date"/><span class="input-group-append input-group-addon"><span class="input-group-text"><img style="" src="${pageContext.request.contextPath}/resources/assets/img/hand-pointer.png"></span></span>
                         </div>
                       </div>
                       <div class="form-group">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/chat_date.png"
                         onlick="modal_map()" style="margin-top:10px; margin-bottom:10px"/>
                         <div class="input-group time" id="timepicker">
                           <input class="form-control" placeholder="HH:MM AM/PM" id="time"/><span class="input-group-append input-group-addon"><span class="input-group-text"><img src="${pageContext.request.contextPath}/resources/assets/img/hand-pointer.png"></span></span>
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
                         <span  style="margin-top: 20px;">연락처 공유를 요청하시겠습니까?</span>
                   
                       </form>
                     </div>
                     <div class="modal-footer">
                     <button type="button" class="btn btn-dark my-3" data-dismiss="modal" id="phon" style="margin: auto; display: block; float:right">요청 보내기</button>
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
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/안녕하세요.png" style="width: 90px;" alt="안녕하세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/감사합니다.gif" style="width: 90px;" alt="감사합니다.gif" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/낙찰되셨습니다.gif" style="width: 90px;" alt="낙찰되셨습니다.gif" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/도착하였습니다.png" style="width: 90px;" alt="도착하였습니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/물음표네.png" style="width: 90px;" alt="물음표네.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/어디세요.png" style="width: 90px;" alt="어디세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/예물결.png" style="width: 90px;" alt="예물결.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/으에.png" style="width: 90px;" alt="으에.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/잘쓸게요.gif" style="width: 90px;" alt="잘쓸게요.gif" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/저주세요.png" style="width: 90px;" alt="저주세요.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/죄송합니다.gif" style="width: 90px;" alt="죄송합니다.gif" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/출발하였습니다.png" style="width: 90px;" alt="출발하였습니다.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/하트하트.png" style="width: 90px;" alt="하트하트.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/허걱느낌표.png" style="width: 90px;" alt="허걱느낌표.png" class="emojis"/></a>
                	<a type="button"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/화났다.gif" style="width: 90px;" alt="화났다.gif" class="emojis"/></a>
             	</div>
             </div>
         </div>
         
         <!-- 채팅버튼 -->
            <div style="display:none " class="type_msg" id="emojisub" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>">
	       		<%-- <a type="button" id="emoji1"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/개신남.png" style="width: 50px;" /></a> --%>
               	<a type="button" id="emoji2"><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/binemoji.png" style="width: 50px;"/></a>
	        </div>
            <div  class="type_msg" id="form" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
               <div class="css-1r0o66s" id="plusDiv" style="display: none; top:100px; left:100px;">
	         		<a href="#"  data-toggle="modal" data-target="#modal" class="title m-b-md"><i class="bi bi-clock m-1" style="float: left; font-size: 35px;"></i></a>
	                <a type="button" id="imgbutton" data-toggle="modal" data-target="#modalImg" class="title m-b-md"><i class="bi bi bi-card-image m-1" style="float: left; font-size: 35px;"></i></a> 
	                <a type="button" id="emojitoggle" ><i class="bi bi bi-emoji-smile m-1" style="float: left; font-size: 35px;"></i></a> 
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

//웹소켓 데이터 
$(function() {

   timer = setInterval( function () {

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
      
       }, 2000);

   });


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
   
      wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/${roomno}'/>");//192.168.219.101//192.168.0.129
      wsocket.binaryType = "arraybuffer";
      //console.log('wsocket:',wsocket);
      //서버와 연결된 웹 소켓에 이벤트 등록
      wsocket.onopen = open;
      wsocket.onclose=function(){
         //appendMessage("연결이 끊어 졌어요");
      };
      wsocket.onmessage=receive;
      wsocket.onerror=function(e){
         //console.log('에러발생:',e)
      }
      
   //서버에 연결되었을때 호출되는 콜백함수
   function open(){
      if(${roomno}!=""){
         appendMessage("<div style='text-align: center; margin-top:5px;'>"+"여기까지 읽으셨습니다."+"</div><br/>");
      }
      else{
         appendMessage("<div style='text-align: center; margin-top:5px;'>"+"대화를 시작해보세요"+"</div><br/>");
      }
   }
   
   
   //서버에서 메시지를 받을때마다 호출되는 함수 
   function receive(e){//e는 message이벤트 객체
      //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
      var today = new Date();   
      //일반 메세지
      var start = e.data.indexOf(":");
      if(e.data.includes('서버로부터받은 메시지${roomno}:')){
         //console.log(e.data);
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
         +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
         +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align: center;'>"+e.data.substring(start+1)+"<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
      }
   
   	////이미지 메세지
      else if(e.data.includes('img${roomno}:')){
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
               +"<div class='received_msg'><div class='received_withd_msg'><img style='border-radius: 15px; width: 50%;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+e.data.substring(start+1)+"'/></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
      }
  ////낙찰 메세지
      else if(e.data.includes('낙찰${roomno}:')){
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
               +"<div class='received_msg'><div class='received_withd_msg'><img style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/낙찰되셨습니다.png'/></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +"<p style='text-align:center;'>축하합니다.<br/></p>"+today.toLocaleTimeString()+"</span></div></div>");
      }
   
   ////전화번호 메세지
      else if(e.data.includes('전화번호${roomno}:')){
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
               +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align:center;'>"+e.data.substring(start+1)+" <br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
         
        	 $.ajax({
                 url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
                 data: {chatcontent:'전화번호 공유 ${userNickname.nickname }:${userNickname.phonenumber}',
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
	         wsocket.send('전화번호2${roomno}:'+"<strong>전화번호 공유</strong></br>${userNickname.nickname }:${userNickname.phonenumber}");
	         wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
	            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'><strong>전화번호 공유</strong></br>${userNickname.nickname }:${userNickname.phonenumber} </p>"
	            +"<span style='float: right;font-size: small; margin-top:5px;'>"+today.toLocaleTimeString()+"</span></div></div>");
	            
      } 
      //전화번호받았을시 내 전화번호 뿌려주는 메세지
      else if(e.data.includes('전화번호2${roomno}:')){
    	  appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
                  +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if>"+nickname+"</div>"
                  +"<div class='received_msg'><div class='received_withd_msg'><p style='text-align:center;'>"+e.data.substring(start+1)+" <br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
                  +today.toLocaleTimeString()+"</span></div></div>");
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
   /* 
   if('${list.status}' === 'END' && '${writeuserno}'==='${userno}'){
	   if('${roomno}'===""){
		   $.ajax({
	           url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
	           data: {chatcontent:'축하합니다.',
	        	   	 img:'낙찰되셨습니다.png',
	                 senduserno:'${userno}',
	                 unread_count:'1',
	                 sendtime: today.toLocaleTimeString('en-US'),
	                 '${_csrf.parameterName}':'${_csrf.token}'},
	           type: 'get',
	           dataType: 'text',
	           success: function (result) {
	              //console.log(result)
	           },
	           error: function () {
	              //console.log('error')
	           }
	        });
	   }
	   else{
		   
	   $.ajax({
           url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
           data: {chatcontent:'축하합니다.',
        	   	 img:'낙찰되셨습니다.png',
                 senduserno:'${userno}',
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
	   }
	   
	   wsocket.send('낙찰${roomno}:'+'축하합니다.');//msg:KOSMO>>안녕
       wsocket.send('RoomNo:${roomno},senduserno:${senduserno},writeuserno:${writeuserno},email:${email}');
       //DIV(대화영역)에 메시지 출력
       
       appendMessage("<div class='outgoing_msg'><div class='sent_msg'><img style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/낙찰되셨습니다.png'/><p style='text-align: center;'>"
             +'축하합니다.'+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
             +today.toLocaleTimeString()+"</span></div></div>");
   }
    */
   //텍스트 보내기
      $('#send').on('click',function(){
    	  var today = new Date();   
         var form1 = $("#form").serialize();
         if($('#chatcontent').val().length>=1){
            $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:$('#chatcontent').val(),
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
         
         
         
         
            //console.log('보낸 메시지${roomno}:',$('#chatcontent').val());
            //console.log('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            
           
            wsocket.send('서버로부터받은 메시지${roomno}:'+$('#chatcontent').val());//msg:KOSMO>>안녕
            wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
            //DIV(대화영역)에 메시지 출력
            
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align: center;'>"
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
		
		$.ajax({
			url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
			data: {chatcontent:"약속 날짜: "+$('#date').val()+" 시간: "+$('#time').val()+" 장소: "+$("#adrress").text(),
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
		
	    	wsocket.send('서버로부터받은 메시지${roomno}:'+"<strong>약속</strong></br><strong>날짜: </strong>"+$('#date').val()+"<strong></br>시간: </strong>"+$('#time').val()+"</br><strong>장소</strong></br>"+$("#adrress").text()+"</br><a target='_blank' href='https://map.kakao.com/link/search/"+$('#adrress').text()+"' id='appointedmap' rel='lyteframe' data-gallery='portfolioDetailsGallery' data-glightbox='type: external' class='portfolio-details-lightbox' title='Portfolio Details''>지도로 보기</a>");//msg:KOSMO>>안녕
	  		wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
	     
	  		appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'>"
	  				+"<strong>약속</strong></br><strong>날짜: </strong>"+$('#date').val()+"<strong></br>시간: </strong>"+$('#time').val()+"</br><strong>장소</strong></br>"+$("#adrress").text()+"</br><a target='_blank' href='https://map.kakao.com/link/search/"+$('#adrress').text()+"' id='appointedmap' rel='lyteframe' data-gallery='portfolioDetailsGallery' data-glightbox='type: external' class='portfolio-details-lightbox' title='Portfolio Details''>지도로 보기</a>"+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
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
		        wsocket.send('img${roomno}:'+result);
		        wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
		           appendMessage("<div class='outgoing_msg'><div class='sent_msg'><img style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
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
               wsocket.send('img${roomno}:'+result);
               wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
                  appendMessage("<div class='outgoing_msg'><div class='sent_msg'><img  style='border-radius: 15px; width: 50%; float:right;' src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
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
	            data: {chatcontent:'전화번호 공유를 요청하였습니다.',
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
         
         //console.log(result);
         wsocket.send('서버로부터받은 메시지${roomno}:'+"<strong>전화번호 공유를 요청하였습니다</strong><br/><button class='btn btn-outline-warning m-3 agreemrnt' id='agreemrnt'>동의</button><button class='btn btn-outline-dark m-3 disagreemrnt' id='disagreemrnt'>비동의</button><input type='hidden' name='sendusrno' value='${userNickname.userno}'/><input type='hidden' name='phonnumber' value='${userNickname.nickname }:${userNickname.phonenumber}'/>");
         wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
         appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'><strong>전화번호 공유를 요청하였습니다</strong></p>"
         +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
         
      });
      
      
      //전화번호 동의
      
      var agreemrnt = $('button[name=agreemrnt]');
      $(document).one("click", '.agreemrnt', function(e){
            this.onclick='null';
            var today = new Date(); 
            var form1 = $("#form").serialize();
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'전화번호 공유 ${userNickname.nickname }:${userNickname.phonenumber} ',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
		            //console.log(result);
		            wsocket.send('전화번호${roomno}:'+"<strong>전화번호 공유</strong></br>${userNickname.nickname }:${userNickname.phonenumber} ");
		            wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
		            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'><strong>전화번호 공유</strong></br>${userNickname.nickname }:${userNickname.phonenumber} </p>"
	                +"<span style='float: right;font-size: small; margin-top:5px;'>"
		            +today.toLocaleTimeString()+"</span></div></div>");
                  
               },
               error: function () {
                  //console.log('error')
               }
            });
             $('.disagreemrnt').attr('disabled',true);
             $(".agreemrnt").attr("disabled",true);
             
            
      });
      
      
      
      //전화번호 거절
      var disagreemrnt = $('button[name=disagreemrnt]');
      $(document).one("click", '.disagreemrnt', function(e){
            this.onclick='null';
            var form1 = $("#form").serialize();
            var today = new Date();        
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'전화번호 공유를 거절하였습니다',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
		            //console.log(result);
		            wsocket.send('서버로부터받은 메시지${roomno}:'+"<strong>전화번호 공유를 거절하였습니다</strong>");
		            wsocket.send('RoomNo${roomno},senduserno${senduserno},writeuserno${writeuserno},email${email}: ${userNickname.nickname }');
		            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'><strong>전화번호 공유를 거절하였습니다</strong></p>"
	                +"<span style='float: right;font-size: small; margin-top:5px;'>"
		            +today.toLocaleTimeString()+"</span></div></div>");
               },
               error: function () {
                  //console.log('error')
               }
            });
            
             $(".agreemrnt").attr("disabled",true);
             $('.disagreemrnt').attr('disabled',true);
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
                         	             url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
                         	             data: {chatcontent:+$("#pay").val()+"원이 송금 되었습니다."
                         	            	 +'<input type="hidden" class="payval" value="'+$("#pay").val()+'"/>',
                         	                   senduserno:${userno},
                         	                   unread_count:'1',
                         	                   sendtime: today.toLocaleTimeString('en-US'),
                         	                   '${_csrf.parameterName}':'${_csrf.token}'},
                         	             type: 'POST',
                         	             dataType: 'text',
                         	             success: function (result) {
                         	            	 
                         	             }
                         	          });
                                      wsocket.send('서버로부터받은 메시지${roomno}:'+"<span id='payval' data-money='"+$("#pay").val()+"' style='text-align:center;'><strong>"+$("#pay").val()+"원</strong>이 송금 되었습니다.<br/><button class='btn btn-outline-warning m-3 success' id='success' onclick='payCharge()'>받기</button><input type='hidden' class='payval' value='"+$("#pay").val()+"'/>");
              	                    appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p id='payval' data-money='"+$("#pay").val()+"' style='text-align:center;'><strong>"+$("#pay").val()+"원</strong>이 송금 되었습니다.<br/></p>"
              	                    +"<span style='float: right;font-size: small; margin-top:5px;'>"
              	                 +today.toLocaleTimeString()+"</span></div></div><input type='hidden' class='payval' value='"+$("#pay").val()+"'/>");
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
          $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
            data: {chatcontent:remit+'원이 입급되었습니다.',
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
         
         //console.log(result);
         wsocket.send('서버로부터받은 메시지${roomno}:'+"<strong>${userNickname.nickname }님이 <strong>"+remit+"원</strong>을 받으셨습니다.</br>거래가 종료되었다면 </br>'후기작성'</br> 버튼을 눌러 후기를 작성해주세요.<button class='btn btn-outline-warning m-3 complete' id='complete'>후기작성</button>");
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'><strong>"+remit+"원</strong>이 입급되었습니다.</br>거래가 종료되었다면 </br>'후기작성'</br> 버튼을 눌러 후기를 작성해주세요.</br><button class='btn btn-outline-success m-3 complete' id='complete'>후기작성</button></p>"
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
                  unread_count:'1',
                  sendtime: today.toLocaleTimeString('en-US'),
                  '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
            },
            error: function () {
            }
         });
         
         wsocket.send('서버로부터받은 메시지${roomno}:'+"");
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'>"+"보낼내용은여기다입력"+"</p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
            
     });
 
    
      
      /////채팅방 나가기
      $('#deletchtroom').on('click',function(){
          var form1 = $("#form").serialize();
          var today = new Date(); 
           $.ajax({
	             url: '<c:url value="/chat/deletchtroom.do"><c:param value="${roomno}" name="roomno"/></c:url>',
	             data: {chatcontent:"<strong>${userNickname.nickname }님이 방을 나가셨습니다.</strong>",
	                   senduserno:${userno},
	                   unread_count:'1',
	                   sendtime: today.toLocaleTimeString('en-US'),
	                   '${_csrf.parameterName}':'${_csrf.token}'},
	             type: 'POST',
	             dataType: 'text',
	             success: function (result) {
	            	 //console.log(result);
	                 wsocket.send('서버로부터받은 메시지${roomno}:'+"<strong>${userNickname.nickname }님이 방을 나가셨습니다.");
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
           $("#map").toggle();
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
    format: "LT",
    icons: {
      up: "fa fa-chevron-up",
      down: "fa fa-chevron-down"
    }
  });
}

   
   
   $('#modal').on('show', function () {    $.fn.modal.Constructor.prototype.enforceFocus = function () { };});
   
    
   $('#modal_map').click(function (e) {
      if(navigator.geolocation){ //브라우저의 Geolocation 지원 여부 판단
            // 현재 위치 정보를 한 번만 얻기
            navigator.geolocation.getCurrentPosition(function(position){
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;
                showKakaoMap(lat,lng); 
                
            });  
        }
      
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
</script>

