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
                     <img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}" >
                     <div class="main-title" >
                     <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>
                             ${userNickname.nickname }
                     <span class="temperature">37.6°C</span>
                     </div>
                     </div>
                     </div>
            <div class="inbox_chat">
               <c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
               <div class="chat_list active_chat">
                  <div class="chat_people">
                     <a href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.product_no}" name="product_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="wirteuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
                        <div class="chat_img">
                           <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.senduserprofileimg}" alt="sunil"></c:if>
                           <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"><img class="chat-header-image" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.writeuserprofileimg}" alt="sunil"></c:if>
                        </div>
                        <div class="chat_ib" >
                           <h5>
                           <c:if test="${userNickname.nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
                           <c:if test="${userNickname.nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>    
                           <span class="chat_date">${chatlist.sendtime}</span>
                           </h5>
                           <p>${chatlist.chatcontent}</p>
                        </div>
                     </a>
                  </div>
               </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>
</div>
</div>


   
   
</script>