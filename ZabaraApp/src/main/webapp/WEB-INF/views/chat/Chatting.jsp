<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
#chatMessage{
    flex-direction: column;
    overflow-y: auto;
    height: 520px;
}
#message{
margin:10px;
}
.chat-header-image{
       margin-right: 12px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
}
</style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
    <!-- ======= Chat Details ======= -->
      <div class="neonborder m-5">
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
                                    <svg width="4" height="16" viewBox="0 0 4 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 3.19998C2.7152 3.19998 3.3002 2.61498 3.3002 1.89998C3.3002 1.18498 2.7152 0.599976 2.0002 0.599976C1.2852 0.599976 0.700195 1.18498 0.700195 1.89998C0.700195 2.61498 1.2852 3.19998 2.0002 3.19998Z" fill="currentColor"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 6.70001C1.2852 6.70001 0.700195 7.28501 0.700195 8.00001C0.700195 8.71501 1.2852 9.30001 2.0002 9.30001C2.7152 9.30001 3.3002 8.71501 3.3002 8.00001C3.3002 7.28501 2.7152 6.70001 2.0002 6.70001Z" fill="currentColor"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 12.8C1.2852 12.8 0.700195 13.385 0.700195 14.1C0.700195 14.815 1.2852 15.4 2.0002 15.4C2.7152 15.4 3.3002 14.815 3.3002 14.1C3.3002 13.385 2.7152 12.8 2.0002 12.8Z" fill="currentColor"></path>
                                    </svg>
                                 </div>
                                 <div class="option-container" id="chatmenuToggleDiv" style="display:none">
                                    <div type="button" id="chatOff">돌아가기</div>
                                    <div class="option-item common-bg-hover">알림음 끄기</div>
                                    <div class="option-item common-bg-hover">대화상대 차단하기</div>
                                    <div class="option-item common-bg-hover">채팅방 나가기</div>
                                 </div>
                              </div>
                     </div>
                      <c:if test="${list.auction_no>0}"><a href="<c:url value="/board/auctionview.do"><c:param value="${list.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"></c:if>
                      <c:if test="${list.product_no>0}"><a href="<c:url value="/board/productview.do"><c:param value="${list.product_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"></c:if>
                        <div class="reserved-wrapper common-bg-hover" >
                           <c:forEach var="image" items="${images}" varStatus="loop">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}" style="width: 70px;">
                           </c:forEach>
                           <div class="reserved-main">
                           <div>${list.title}</div>
                           <div class="reserved-price">가격 : ${list.price}</div>
                           </div>
                           <div><span class="reserve-button closed">거래완료</span></div>
                        </div>
                     </a>
                     <c:forEach var="message" items="${message}" varStatus="loop">
                     <c:if test="${message.senduserno eq userno }" var="myuserno">
                        <div class='outgoing_msg'>
                           <div class='sent_msg'>
                              <p> ${message.chatcontent }<br/></p>
                              <span style='float: right;font-size: small; margin-top:5px;'>${message.sendtime }</span>
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
                           <p>${message.chatcontent }<br/></p></div>
                            <span style='float: left;font-size: small; margin-top:5px;'>${message.sendtime }</span>
                         </div>
                      </div>
                      </c:if>
                     </c:forEach>
                     
               </div>
            </div>
         </div>
            <div  class="type_msg" id="form" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${product_no}" name="product_no"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${wirteuserno}" name="wirteuserno"/></c:url>">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
               <div class="input_msg_write d-flex ">
                  <a href="#"><i class="bi bi-geo-alt m-1" style="float: left; font-size: 35px;"></i></a>
                  <a type="button" id="imgtoggle" onclick="onclick=document.all.customFile.click()"><i class="bi bi-plus-square m-1" style="float: left; font-size: 35px;"></i></a> 
                  <input type="file" id="customFile" style="display:none"> 
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
   //채팅
   var today = new Date();   
   
   var wsocket;
   //닉 네임 저장용
   var nickname='${userNickname.nickname }';
   //입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
   //$('#toggle').one('click',function(){
      wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/${roomno}'/>");//192.168.219.101//192.168.0.129
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
      appendMessage("<div style='text-align: center; margin-top:5px;'>"+today.toLocaleDateString()+"</div><br/>");
   }
   //서버에서 메시지를 받을때마다 호출되는 함수 
   function receive(e){//e는 message이벤트 객체
      //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
      if(e.data.substring(0, 12) ==='서버로부터받은 메시지:'){
         
         
         
         console.log(e.data);
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'></div>"
         +"<div class='received_msg'><div class='received_withd_msg'>"+nickname+"<p>"+e.data.substring(12)+"<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
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
   
      $('#send').on('click',function(){
         var form1 = $("#form").serialize();
         $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${product_no}" name="product_no"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${wirteuserno}" name="wirteuserno"/></c:url>',
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
         //기존 메시지 클리어      
         $('#chatcontent').val("");
         //포커스 주기
         $('#chatcontent').focus();
         $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      });
   //퇴장버튼 클릭시
   $('#exitBtn').one('click',function(){
      wsocket.send('서버로부터받은 메시지:'+nickname+'가(이) 퇴장했어요');//msg:KOSMO>>안녕
      wsocket.close();
   });
   
   
   $(function (){
      $("#chatmenutoggle").click(function (){
        $("#chatmenuToggleDiv").toggle();
     });
   
   });
   
   
   //채팅방
   
   
   
   
   
</script>