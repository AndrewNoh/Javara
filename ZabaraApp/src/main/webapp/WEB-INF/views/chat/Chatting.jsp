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
                  <img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}" alt="대화상대아이디">
                  <div class="main-title" >
                     <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>
                             ${userNickname.nickname }
                     <span class="temperature">37.6°C</span>
                  </div>
               </div>
            </div>
         </div>
         
         <div class="mesgs">
            <div class="msg_history">
               <div class="incoming_msg">
                  <div id="chatMessage">
                     <div class="css-1r0o66s">
                        <div class="chat-header-profile">
                           <c:if test="${userNickname.nickname eq chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}" alt="sunil"></c:if>
                           <c:if test="${userNickname.nickname ne chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}" alt="sunil"></c:if>
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
                        <i class="bi bi-three-dots-vertical m-1" style="left 30px; font-size: 35px;"></i>
                     </div>
                     <div class="option-container" id="chatmenuToggleDiv" style="display:none">
                        <div class="option-item common-bg-hover">알림음 끄기</div>
                        <div class="option-item common-bg-hover">대화상대 차단하기</div>
                        <div class="option-item common-bg-hover">채팅방 나가기</div>
                     </div>
                  </div>
                     </div>
                      <a href="<c:url value="/board/auctionview.do"><c:param value="${list.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details">
                        <div class="reserved-wrapper common-bg-hover" >
                           <c:forEach var="image" items="${images}" varStatus="loop">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}" style="width: 70px;">
                           </c:forEach>
                           <div class="reserved-main">
                           <div>${list.title}</div>
                           <div class="reserved-price">가격 : ${list.upper_Price}</div>
                           </div>
                           <div><c:if test="${list.status == 'END'}">낙찰</c:if>
                            <c:if test="${list.status == 'SALE'}">경매 진행중</c:if></div>
                        </div>
                     </a>
                     <c:forEach var="message" items="${message}" varStatus="loop">
                        <c:forEach var="i" begin="${loop.index}" end="${loop.index}">
                        <c:if test="${ i eq 0}"><br/><div style='text-align: center; margin-top:5px;'><fmt:formatDate value="${message.sendtime}" pattern="yyyy년 MM월 dd일"/></div></c:if>
                        </c:forEach>
                     <c:if test="${message.senduserno eq userno }" var="myuserno">
                        <div class='outgoing_msg'>
                           <div class='sent_msg'>
                              <c:if test="${message.img eq null }" var="chatimg">
                              <c:if test="${fn:contains(message.chatcontent, '전화번호 공유')}" var="phon"><p>전화번호 공유를 요청하였습니다<br/></p></c:if>
                              <c:if test="${fn:contains(message.chatcontent, '낙찰금액')}" var="payment"><p>낙찰금액 : ${list.upper_Price}</br>상대방이 수락하면 수락과 동시에 결제가 진행됩니다.<br/></p></c:if>
                              <c:if test="${!phon and !payment}"><p>${message.chatcontent }<br/></p></c:if>
                              </c:if>
                           <c:if test="${!chatimg}" var="chatimg">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
                            </c:if>
                           
                              <span style='float: right;font-size: small; margin-top:5px;'> <fmt:formatDate value="${message.sendtime}" pattern="HH:mm:ss"/></span>
                           </div>
                        </div>
                     </c:if>
                      <c:if test="${!myuserno}">
                      <div class='outgoing_msg'>
                         <div class='incoming_msg_img'>
                         <c:if test="${userNickname.nickname eq chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}" alt="sunil"></c:if>
                        <c:if test="${userNickname.nickname ne chatroom.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}" alt="sunil"></c:if>
                         </div>
                         <div class='received_msg'>
                            <div class='received_withd_msg'>
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
                              <c:if test="${message.img eq null }" var="chatimg">
                                 <p>${message.chatcontent }<br/></p>
                               </c:if>
                              <c:if test="${!chatimg}" var="chatimg">
                                 <img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/${message.img}"/>
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
                           <input class="form-control" placeholder="YYYY/MM/DD" id="date"/><span class="input-group-append input-group-addon"><span class="input-group-text"><i class="bi bi-calendar"></i></span></span>
                         </div>
                       </div>
                       <div class="form-group">
                         <img src="${pageContext.request.contextPath}/resources/assets/img/chat_date.png"
                         onlick="modal_map()" style="margin-top:10px; margin-bottom:10px"/>
                         <div class="input-group time" id="timepicker">
                           <input class="form-control" placeholder="HH:MM AM/PM" id="time"/><span class="input-group-append input-group-addon"><span class="input-group-text"><i class="bi bi-clock"></i></span></span>
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
                       <button type="button" class="btn btn-dark" style="color:#fff" data-dismiss="modal" id="appointed">약속 잡기</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         <div id="imgtoggleDiv"style="display:none">
             <img src="#" style="width: 100px;"/>
             <a type="button" id="sendFile" onclick="sendFile()" ><i class="bi bi bi-send-check-fill m-1" style="float: right; font-size: 35px;"></i></a> 
         </div>
         
         <div id="modalPhon" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black;">전화번호 공유</h1>
                     </div>
                     <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                         <span>전화번호 공유를 하시겠습니까?</span>
                       <button type="button" class="btn btn-outline-dark my-3" data-dismiss="modal" id="phon" style="margin: auto; display: block;">전화번호 공유</button>
                       </form>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         <div id="modalJpay" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black;"> 낙찰금액 : ${list.upper_Price}</h1>
                     </div>
                     <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                         <span>낙찰을 진행 하시겠습니까?</span>
                       <button type="button" class="btn btn-outline-dark my-3" data-dismiss="modal" id="jpay" style="margin: auto; display: block;">낙찰</button>
                       </form>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
         
           <div id="modalpayment" class="modal fade">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header" style="justify-content: center;">  
                         <h1 class="modal-title" style="color: black; font-size: 20px; font-weight: bold; ">송금하기</h1>
                     </div>
                       <div class="modal-body">
                        <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">
                          <input id="pay" class="input" type="text" > 원 <br/>
                          
                          <h1 style="font-size: 12px; font-weight: bold; text-align:left; margin-top: 30px; ">자바라페이로 보낸다고 알려 주셨나요?</h1>
                          <h1 style="font-size: 10px; text-align:left">- 이미 송금이 완료되었다면 수취인의 동의 없이 취솰 수 없어요.</h1>
                          <h1 style="font-size: 10px; text-align:left; margin-bottom: -10px" >- 연락이 되었다고 하더라도, 상대방의 동의 없이 송금을 취소하기는 어려운 점 양해 부탁드려요.</h1>
                          
                          <span class="underline"></span>
                        </form>
						</div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-dark" style="color:#fff" data-dismiss="modal" id="jpay">보내기</button>
                     </div>
                 </div><!-- /.modal-content -->
             </div><!-- /.modal-dialog -->
         </div><!-- /.modal -->
         
      
         
         
         <div id="emojitoggleDiv"style="display:none ">
            <div id="emoji" style="display: flex; flex-wrap:wrap;">
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/개신남.png" style="width: 100px;" alt="개신남.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/굳.png" style="width: 100px;" alt="굳.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/궁금.png" style="width: 100px;" alt="궁금.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/눈물.png" style="width: 100px;" alt="눈물.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/느낌.png" style="width: 100px;" alt="느낌.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/덜덜.png" style="width: 100px;" alt="덜덜.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/박수.png" style="width: 100px;" alt="박수.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/번득.png" style="width: 100px;" alt="번득.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/복잡.png" style="width: 100px;" alt="복잡.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/뿌.png" style="width: 100px;" alt="뿌.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/신남.png" style="width: 100px;" alt="신남.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/알랍.png" style="width: 100px;" alt="알람.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/우울.png" style="width: 100px;" alt="우울.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/점점점.png" style="width: 100px;" alt="점점점.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/정말.png" style="width: 100px;" alt="정말.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/지루.png" style="width: 100px;" alt="지루.png" class="emojis"/></a>
                <a id="sendFile" ><img src="${pageContext.request.contextPath}/resources/assets/img/chat_img/화남.png" style="width: 100px;" alt="화남.png" class="emojis"/></a>
                <a type="button" id="" onclick="sendemoji()" ><i class="bi bi bi-send-check-fill m-1" style="float: right; font-size: 35px;"></i></a> 
             </div>
         </div>
            <div  class="type_msg" id="form" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
               <div class="input_msg_write d-flex ">
                  <a href="#"  data-toggle="modal" data-target="#modal" class="title m-b-md"><i class="bi bi-clock m-1" style="float: left; font-size: 35px;"></i></a>
                  <a type="button" id="imgtoggle" ><i class="bi bi bi-card-image m-1" style="float: left; font-size: 35px;"></i></a> 
                  <a type="button" id="emojitoggle" ><i class="bi bi bi-emoji-smile m-1" style="float: left; font-size: 35px;"></i></a> 
                  <a type="button" id="phone" data-toggle="modal" data-target="#modalPhon" class="title m-b-md"><i class="bi bi bi bi-telephone-fill m-1" style="float: left; font-size: 35px;"></i></a> 
                  <c:if test="${userno eq writeuserno}">
                  <a type="button" id="jpays" data-toggle="modal" data-target="#modalJpay" class="title m-b-md"><i class="bi bi-credit-card-2-back m-1" style="float: left; font-size: 35px;"></i></a> 
                  <a type="button" id="pay"  data-toggle="modal" data-target="#modalpayment" class="title m-b-md"><i class="bi bi-credit-card-2-back-fill m-1" style="float: left; font-size: 35px;"></i></a></c:if>
                  <input type="file" id="file" name="file" onchange="uploadFile(this)" style="display:none"> 
                  <input type="text" class="write_msg" placeholder="메시지를 입력하세요" id="chatcontent" name="chatcontent"/>
                  <a href="javascript:void(0);" id="send" type="submit"><i class="bi bi-send" aria-hidden="true"  style="float: right; font-size: 35px;"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>

<script>


/* $(function() {

   timer = setInterval( function () {

      $.ajax({
         url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
         type: 'get',
         dataType: 'text',
         success: function (result) {
            console.log(result)
         },
         error: function () {
            console.log('error')
         }
      });
      
       }, 1000);

   }); */



document.getElementById("file").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("image").src = e.target.result;
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};



$('#imgtoggle').click(function (e) {
   e.preventDefault();
   $('#file').click();
});

function uploadFile(e) {
   console.log("File Name:",e.value);
}







   //채팅
   var today = new Date();   
   
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
   //$('#toggle').one('click',function(){
      wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/${roomno}'/>");//192.168.219.101//192.168.0.129
      wsocket.binaryType = "arraybuffer";
      console.log('wsocket:',wsocket);
      //서버와 연결된 웹 소켓에 이벤트 등록
      wsocket.onopen = open;
      wsocket.onclose=function(){
         appendMessage("연결이 끊어 졌어요");
      };
      wsocket.onmessage=receive;
      wsocket.onerror=function(e){
         console.log('에러발생:',e)
      }
   //});
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
      if(e.data.substring(0, 12) ==='서버로부터받은 메시지:'){
         console.log(e.data);
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
         +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if></div>"
         +"<div class='received_msg'><div class='received_withd_msg'>"+nickname+"<p>"+e.data.substring(12)+"<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
      }
      else if(e.data.substring(0, 4) ==='img:'){
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if></div>"
               +"<div class='received_msg'><div class='received_withd_msg'>"+nickname+"<img src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+e.data.substring(4)+"'/></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
      }
      else if(e.data.substring(0, 5) ==='전화번호:'){
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><c:if test='${userNickname.nickname eq chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.senduserprofileimg}' alt='sunil'></c:if>"
               +"<c:if test='${userNickname.nickname ne chatroom.writeusernickname }'><img class='chat-header-image' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatroom.writeuserprofileimg}' alt='sunil'></c:if></div>"
               +"<div class='received_msg'><div class='received_withd_msg'>"+nickname+"<p>"+e.data.substring(5)+" 넷<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
         
         wsocket.send('전화번호2:'+"<span style='text-align:center; font-size:20px;'>전화번호 공유</br>${userNickname.nickname }:${userNickname.phonenumber}</span>");
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center; font-size:20px;'>전화번호 공유</br>${userNickname.nickname }:${userNickname.phonenumber} 여섯</p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
      }
         
   }
   function appendMessage(msg){
      
      $('#chatMessage').append(msg);
      $('#chatMessage').scrollTop($('#chatMessage').prop('scrollHeight'));
      $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
   }
   
   $('#chatcontent').on('keypress',function(e){
      if(e.keyCode===13){//엔터 입력
         $('#send').trigger("click");
         
      }
   });
   $('#appointed').on('click',function(e){
      var form1 = $("#form").serialize();
      $.ajax({
         url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
         data: {chatcontent:"약속</br>"+$('#date').val()+" "+$('#time').val()+"</br>장소</br>"+$("#adrress").text()+"</br><a href='https://map.kakao.com/link/search/"+$('#adrress').text()+"'>지도로 보기</a>",
               senduserno:${userno},
               unread_count:'1',
               sendtime: today.toLocaleTimeString('en-US'),
               '${_csrf.parameterName}':'${_csrf.token}'},
         type: 'POST',
         dataType: 'text',
         success: function (result) {
            console.log(result)
         },
         error: function () {
            console.log('error')
         }
      });
      
      
      console.log('보낸 메시지:',"약속</br>"+$('#date').val()+" "+$('#time').val()+"</br>장소</br>"+$("#adrress").text()+"</br><a href='https://map.kakao.com/link/search/"+$('#adrress').text()+"'>지도로 보기</a>");
      wsocket.send('서버로부터받은 메시지:'+"약속</br>"+$('#date').val()+" "+$('#time').val()+"</br>장소</br>"+$("#adrress").text()+"</br><a href='https://map.kakao.com/link/search/"+$('#adrress').text()+"'>지도로 보기</a>");//msg:KOSMO>>안녕
      //DIV(대화영역)에 메시지 출력
      
   
      appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p>"
            +"약속</br>"+$('#date').val()+" "+$('#time').val()+"</br>장소</br>"+$("#adrress").text()+"</br><a href='https://map.kakao.com/link/search/"+$('#adrress').text()+"'>지도로 보기</a>"+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
            +today.toLocaleTimeString()+"</span></div></div>");
      //기존 메시지 클리어      
      $('#chatcontent').val("");
   });
   
      $('#send').on('click',function(){
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
                  console.log(result)
               },
               error: function () {
                  console.log('error')
               }
            });
         
         
         
         
            console.log('보낸 메시지:',$('#chatcontent').val());
            wsocket.send('서버로부터받은 메시지:'+$('#chatcontent').val());//msg:KOSMO>>안녕
            //DIV(대화영역)에 메시지 출력
            
          
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p>"
                  +$('#chatcontent').val()+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
                  +today.toLocaleTimeString()+"</span></div></div>");
         }
      
         
         //기존 메시지 클리어      
         $('#chatcontent').val("");
         //포커스 주기
         $('#chatcontent').focus();
         $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      });
      
      function sendFile() {
            var chatimg = new FormData();
            chatimg.append('chatimg', document.getElementById('file').files[0]);
            chatimg.append("${_csrf.parameterName}", "${_csrf.token}");
            $.ajax({
            url: '<c:url value="/chat/chatimg.do"><c:param value="${userno}" name="userno"/><c:param value="${userno}" name="userno"/><c:param value="${roomno}" name="roomno"/></c:url>',
            data: chatimg,
            type: 'POST',
            dataType : "text",
            processData: false,    
            contentType: false,
         success: function (result) {
            console.log(result)
            wsocket.send('img:'+result);
               appendMessage("<div class='outgoing_msg'><div class='sent_msg'><img src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
               +"<br/><span style='float: right;font-size: small; margin-top:5px;'>"
                  +today.toLocaleTimeString()+"</span></div></div>");
         },
         error: function () {
            console.log('error')
         }
         });
            
           
            
            
            $('#image').remove();
            $("#imgtoggleDiv").toggle();
      
      }
      
      var emojis = document.querySelectorAll('.emojis');
      for(var i=0; i<emojis.length;i++){
            var result;
            emojis[i].onclick=function(e){
               result=this.alt;
               console.log(result)
               wsocket.send('img:'+result);
                  appendMessage("<div class='outgoing_msg'><div class='sent_msg'><img src='${pageContext.request.contextPath}/resources/assets/img/chat_img/"+result+"'/>"
                  +"<br/><span style='float: right;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
                  
                  $.ajax({
                  url: '<c:url value="/chat/chattingemoji.do"><c:param value="${userno}" name="userno"/><c:param value="${userno}" name="userno"/><c:param value="${roomno}" name="roomno"/></c:url>',
                  data: {img:result,
                        '${_csrf.parameterName}':'${_csrf.token}'},
                  type: 'POST',
                  dataType: 'text',
                  success: function (result) {
                     console.log(result)
                  },
                  error: function () {
                     console.log('error')
                  }
               });
                 $("#emojitoggleDiv").toggle();
                  
            }
      }
      
      
      $('#phon').on('click',function(){
         var form1 = $("#form").serialize();
                  
          $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
            data: {chatcontent:'<span style="text-align:center;">전화번호 공유를 요청하였습니다<br/><button class="btn btn-success m-3 agreemrnt" id="agreemrnt">동의</button><button class="btn btn-danger m-3 disagreemrnt" id="disagreemrnt">비동의</button></span>'
            +'<input type="hidden" name="phonnumber" value="${userNickname.nickname }:${userNickname.phonenumber}"/>',
                  senduserno:${userno},
                  unread_count:'1',
                  sendtime: today.toLocaleTimeString('en-US'),
                  '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
               console.log(result)
            },
            error: function () {
               console.log('error')
            }
         });
         
         console.log(result);
         wsocket.send('서버로부터받은 메시지:'+"<span style='text-align:center;'>전화번호 공유를 요청하였습니다<br/><button class='btn btn-success m-3 agreemrnt' id='agreemrnt'>동의</button><button class='btn btn-danger m-3 disagreemrnt' id='disagreemrnt'>비동의</button></span><input type='hidden' name='sendusrno' value='${userNickname.userno}'/><input type='hidden' name='phonnumber' value='${userNickname.nickname }:${userNickname.phonenumber}'/>");
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'>전화번호 공유를 요청하였습니다<br/></p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
         
      });
      var disagreemrnt = document.querySelectorAll('.disagreemrnt');
      for(var i=0; i<disagreemrnt.length;i++){
         disagreemrnt[i].onclick=function(e){
            this.onclick='null';
            var form1 = $("#form").serialize();
                     
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'<span style="text-align:center; font-size:20px;">전화번호 공유를 거절하였습니다</span>',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
                  console.log(result)
               },
               error: function () {
                  console.log('error')
               }
            });
            
            console.log(result);
            wsocket.send('서버로부터받은 메시지:'+"<span style='text-align:center; font-size:20px;'>전화번호 공유를 거절하였습니다</span>");
               appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center; font-size:20px;'>전화번호 공유를 거절하였습니다</p>"
               +"<span style='float: right;font-size: small; margin-top:5px;'>"
            +today.toLocaleTimeString()+"</span></div></div>");
            
         };
      };
      
      
      var agreemrnt = document.querySelectorAll('.agreemrnt');
      for(var i=0; i<agreemrnt.length;i++){
         agreemrnt[i].onclick=function(e){
            this.onclick='null';
            var form1 = $("#form").serialize();
                     
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'<span style="text-align:center; font-size:20px;">전화번호 공유</br>${userNickname.nickname }:${userNickname.phonenumber} 하나</span>',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
                  console.log(result)
               },
               error: function () {
                  console.log('error')
               }
            });
            
            console.log(result);
            wsocket.send('전화번호:'+"<span style='text-align:center; font-size:20px;'>전화번호 공유</br>${userNickname.nickname }:${userNickname.phonenumber} 둘</span>");
               appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center; font-size:20px;'>전화번호 공유</br>${userNickname.nickname }:${userNickname.phonenumber} 샛</p>"
               +"<span style='float: right;font-size: small; margin-top:5px;'>"
            +today.toLocaleTimeString()+"</span></div></div>");
            
         };
      }
      
      $('#jpay').on('click',function(){
         var form1 = $("#form").serialize();
                  
          $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
            data: {chatcontent:'<span style="text-align:center;">낙찰금액 : ${list.upper_Price}</br>낙찰 받으시겠습니까?<br/><button class="btn btn-success m-3 success" id="success">낙찰</button><button class="btn btn-danger m-3 fail" id="fail">거부</button></span>',
                  senduserno:${userno},
                  unread_count:'1',
                  sendtime: today.toLocaleTimeString('en-US'),
                  '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
               console.log(result)
            },
            error: function () {
               console.log('error')
            }
         });
         
         console.log(result);
         wsocket.send('서버로부터받은 메시지:'+"<span style='text-align:center;'>낙찰금액 : ${list.upper_Price}</br>낙찰 받으시겠습니까?<br/><button class='btn btn-success m-3 success' id='success'>낙찰</button><button class='btn btn-danger m-3 fail' id='fail'>거부</button></span>");
            appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'>낙찰금액 : ${list.upper_Price}</br></p>"
            +"<span style='float: right;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");
         
      });
      
      
      
      var fail = document.querySelectorAll('.fail');
      for(var i=0; i<fail.length;i++){
         fail[i].onclick=function(e){
            this.onclick='null';
            var form1 = $("#form").serialize();
                     
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'<span style="text-align:center; font-size:20px;">낙찰을 거부하셨습니다.</span>',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
                  console.log(result)
               },
               error: function () {
                  console.log('error')
               }
            });
            
            console.log(result);
            wsocket.send('낙찰:'+"<span style='text-align:center; font-size:20px;'>낙찰을 거부하셨습니다.</span>");
               appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center; font-size:20px;'>낙찰을 거부하셨습니다.</p>"
               +"<span style='float: right;font-size: small; margin-top:5px;'>"
            +today.toLocaleTimeString()+"</span></div></div>");
            
         };
      };
      
      
      var success = document.querySelectorAll('.success');
      for(var i=0; i<success.length;i++){
         success[i].onclick=function(e){
            this.onclick='null';
            var form1 = $("#form").serialize();
                     
             $.ajax({
               url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
               data: {chatcontent:'<span style="text-align:center; font-size:20px;"><strong>축하합니다. </br></strong>${list.upper_Price}원에 낙찰이 되었습니다.</br></span>',
                     senduserno:${userno},
                     unread_count:'1',
                     sendtime: today.toLocaleTimeString('en-US'),
                     '${_csrf.parameterName}':'${_csrf.token}'},
               type: 'POST',
               dataType: 'text',
               success: function (result) {
                  console.log(result)
               },
               error: function () {
                  console.log('error')
               }
            });
            
            console.log(result);
            wsocket.send('낙찰:'+"<span style='text-align:center; font-size:20px;'><strong>축하합니다. </br></strong>${list.upper_Price}원에 낙찰이 되었습니다.</br></span>");
               appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center; font-size:20px;'><strong>축하합니다. </br></strong>${list.upper_Price}원에 낙찰이 되었습니다.</br></p>"
               +"<span style='float: right;font-size: small; margin-top:5px;'>"
            +today.toLocaleTimeString()+"</span></div></div>");
            
         };
      }
      
      
      
      /* $('#pay').on('click',function(){
          var form1 = $("#form").serialize();
                   
           $.ajax({
             url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
             data: {chatcontent:'<span style="text-align:center;">Jpay<br/><button class="btn btn-success m-3 success" id="jaypayment">결제하기</button><button class="btn btn-danger m-3 fail" id="nojaypayment">취소</button></span>',
                   senduserno:${userno},
                   unread_count:'1',
                   sendtime: today.toLocaleTimeString('en-US'),
                   '${_csrf.parameterName}':'${_csrf.token}'},
             type: 'POST',
             dataType: 'text',
             success: function (result) {
                console.log(result)
             },
             error: function () {
                console.log('error')
             }
          });
          
          console.log(result);
          wsocket.send('서버로부터받은 메시지:'+"<span style='text-align:center;'>Jpay<br/><button class='btn btn-success m-3 success' id='jaypayment'>결제하기</button><button class='btn btn-danger m-3 fail' id='nojaypayment'>취소</button></span>");
             appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p style='text-align:center;'>Jpay결제</br></p>"
             +"<span style='float: right;font-size: small; margin-top:5px;'>"
          +today.toLocaleTimeString()+"</span></div></div>");
          
       }); */
      
      
   //퇴장버튼 클릭시
   $('#exitBtn').one('click',function(){
      wsocket.send('서버로부터받은 메시지:'+nickname+'가(이) 퇴장했어요');//msg:KOSMO>>안녕
      wsocket.close();
   });
   
   
   
   
   
   $(function (){
      $("#chatmenutoggle").click(function (){
           $("#chatmenuToggleDiv").toggle();
        });
      $("#imgtoggle").click(function (){
           $("#imgtoggleDiv").toggle();
        });
      $("#modal_map").click(function (){
           $("#map").toggle();
        });
      $("#emojitoggle").click(function (){
           $("#emojitoggleDiv").toggle();
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