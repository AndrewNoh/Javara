<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- ======= 동내 Section ======= -->
 
<div style="position: fixed;bottom: 50px; right: 30px;">
  <a href="<c:url value="/board/write.do"><c:param name="board" value="GropBoard"/></c:url>"><i class="bx bx-plus-circle" title="글쓰기" style="font-size: 50px"></i></a>
  </div>
  <div style="position: fixed;bottom: 110px; right: 30px;">
  <a href="#portfolio"><i class="bx bxs-caret-up-circle" title="위로가기" style="font-size: 50px"></i></a>
</div>
 
  <div id="board" class="contact">
    <div class="container">

      <div class="section-title">
        <h2>동내생활</h2>
        <p>동내사람들과 이모저모</p>
      </div>

      <div class="row mt-2">

      <form action="forms/contact.php" method="post" role="form" class="php-email-form mt-4">
      <c:forEach var="LIST" items="${LISTS}" varStatus="loop">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="row">
          <div class="col-md-6 form-group" >
           <div style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;">${LIST.nickName} ?</div>
          </div>
          <div class="col-md-6 form-group mt-3 mt-md-0" >
            <div style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;">${LIST.category }</div>
          </div>
        </div>
        <div class="form-group mt-3" style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;">
          <div>${LIST.title}</div>
        </div>
        <div class="form-group mt-3" style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 30px;">
          <div>${LIST.content}</div>
          <c:forEach var="i" begin="${loop.index}" end="${loop.index}">
			<c:if test="${!empty imageList[i][0].imageName}" var="haveImage">
				<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i][0].imageName}" style="width: 40%; height:40%;" class="img-fluid" alt="">
			</c:if>
			<c:if test="${! haveImage}">
				<img src="${pageContext.request.contextPath}/resources/assets/img/zabara.png" style="width: 40%; height:40%;" class="img-fluid" alt="">
			</c:if>
		</c:forEach>
        </div>
        
        <div class="my-3">
          <div class="loading">Loading</div>
          <div class="error-message"></div>
          <div class="sent-message">Your message has been sent. Thank you!</div>
        </div>
        <div class="text-center mt-3 pd-4">
        	<c:set var="session_id"><sec:authentication property="principal.username"/></c:set>
        	<c:if test="${userno ==LIST.userNo }">
        	<button>
        	<a href="<c:url value="/board/update.do">
        		<c:param name="townlist_no" value="${LIST.townlist_no }"/></c:url>" class="btn btn-white">수정
        	</a>
        	</button>
        	<button>
        	<a href="<c:url value="/board/deleteTown.do">
        		<c:param name="townlist_no" value="${LIST.townlist_no }"/>
        		<c:param name="auction_no" value="0"/>
        		<c:param name="product_no" value="0"/>
        		</c:url>" class="btn btn-white">삭제
        	</a>
        	</button>
        	</c:if>
        </div>
        
        <br/>
        </c:forEach>
      </form>

    </div>
  </div><!-- End 동내 Section -->