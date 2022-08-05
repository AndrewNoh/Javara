<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.chatContainer{
    background: rgb(20 19 17 / 50%);
    padding: 10px;
    border-radius: 10px;
}
.testimonials .testimonial-item p {
margin: none;
}
.col-lg-4{
width: 30%;
}
.chatroom{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap
    }
</style>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
    <!-- ======= Chat Details ======= -->
      <div class=" m-5">
      <div class="container">
   <div class="section-title">
        <img src="${pageContext.request.contextPath}/resources/assets/img/title_chat.png" style="width: 50px" />
      </div>
   <div class="messaging " style="margin-top: 10px">
      <div class="inbox_msg">
         <div class="inbox_people" style=" width: 100%; justify-content: center;">
         <div class="css-1r0o66s" style="justify-content: center;">
            <div class="chat-header-profile">
	            <img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}" >
	            <div class="main-title" >
		            <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>
		                     ${userNickname.nickname }
		            <span class="temperature">37.6°C</span>
	            </div>
            </div>
       	</div>
       	<div class="chatroom">
       	
			             <c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
                  <div class="testimonials chatContainer col-lg-4 col-md-6 my-2 mx-2">
			         <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
			             <div class="swiper-slide">
			             <a href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.product_no}" name="product_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="writeuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
			               <div class="testimonial-item">
			                 <p style="height: 200px; display: flex; align-items: center; justify-content: center;">
			                     <i class="bx bxs-quote-alt-left quote-icon-left"></i>
			                     ${chatlist.chatcontent} <i
			                        class="bx bxs-quote-alt-right quote-icon-right"></i>
			                  </p>
			                  <c:forEach var="unreadcount" items="${unreadcount}" varStatus="loop">
								<c:if test="${chatlist.roomno eq  unreadcount.roomno}"> 
								<c:if test="${unreadcount.unreadcount >0}">
									<span class="badge badge-light" style="float: right; border-radius:20%; background-color: red; text-align: center; margin: 10px 20px;" >${unreadcount.unreadcount}</span></c:if>
								</c:if> 
							</c:forEach>
			                  <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"><img class="testimonial-img" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.senduserprofileimg}" alt="sunil"></c:if>
                           	  <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"><img class="testimonial-img" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.writeuserprofileimg}" alt="sunil"></c:if>
			                  <h4><fmt:formatDate value="${chatlist.sendtime}" pattern="yyyy년 MM월 dd일"/></h4>
			                  <h3>
			                     <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
                           		 <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>   
			                  </h3>
			               </div>
			               </a>
			             </div><!-- End testimonial item -->
			         </div>
			       </div><!-- End Testimonials  -->
			               </c:forEach>
       	
       	
       	
       	</div>
            <!-- <div class="inbox_chat">
               <c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
               <div class="chat_list active_chat">
                  <div class="chat_people">
                     <a href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.product_no}" name="product_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="writeuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
                        <div class="chat_img">
                           <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.senduserprofileimg}" alt="sunil"></c:if>
                           <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.writeuserprofileimg}" alt="sunil"></c:if>
                        </div>
                        <div class="chat_ib" >
                           <h5>
                           <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
                           <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>    
                           <span class="chat_date"><fmt:formatDate value="${chatlist.sendtime}" pattern="yyyy년 MM월 dd일"/></span>
                           
                           </h5>
                           <p>${chatlist.chatcontent}</p>
                           <c:forEach var="unreadcount" items="${unreadcount}" varStatus="loop">
								<c:if test="${chatlist.roomno eq  unreadcount.roomno}"> 
								<c:if test="${unreadcount.unreadcount >0}">
									<span class="badge badge-light" style="float: right;">${unreadcount.unreadcount}</span></c:if>
								</c:if> 
							</c:forEach>
                        </div>
                     </a>
                  </div>
               </div>
               </c:forEach>
            </div> -->
         </div>
      </div>
   </div>
</div>
</div>

<script>

 $(function() {

	timer = setInterval( function () {

		$.ajax({
			url: '<c:url value="/chat/chattingroom.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${writeuserno}" name="writeuserno"/></c:url>',
			data: {'${_csrf.parameterName}':'${_csrf.token}'},
			type: 'get',
			dataType: 'text',
			async:false, 
			success: function (result) {
				//console.log(result)
			},
			error: function () {
				//console.log('error')
			}
		});
		
	    }, 1000);

	}); 
</script>