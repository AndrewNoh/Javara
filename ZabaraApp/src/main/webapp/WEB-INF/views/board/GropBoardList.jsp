<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- ======= 동내 Section ======= -->
 <style>
.form-group{
background:  rgb(0 0 0 / 0%);
border-radius: 10px;
}

.contents {
	background-color: rgb(20 19 17/ 70%);
	border-radius: 15px;
	width: 60%;
	margin: auto;
}
</style> 
<div style="position: fixed;bottom: 50px; right: 30px;">
   <a href="<c:url value="/board/write.do"><c:param name="board" value="GropBoard"/> </c:url>">
  <img src="${pageContext.request.contextPath}/resources/assets/img/write_btn.png" 
       title="글쓰기" style="width: 80px; height: 80px"></a>
</div>
<div style="position: fixed;bottom: 110px; right: 30px;">
   <a href="#portfolio"><img src="${pageContext.request.contextPath}/resources/assets/img/scrollbar_btn.png" 
       title="위로가기" style="width: 80px; height: 80px"></a>
</div>
  <div id="board" class="container mt-5">

      <div class="section-title">
        <h2>동네생활</h2>
        <p>👫🏻 우리가 함께라면, 건강하고 따뜻한 동네생활을 만들 수 있어요 </p>
        <h1 style="font-size: 18px">동네생활은 이웃과 함께 정보를 공유하고, 이야기를 나누는 공간이에요.<br/>

      이웃에게 물어보면, 이웃들이 친절하게 진짜 정보를 알려줄거에요.<br/>

      자바라는 당신의 따뜻한 동네생활을 기대해요!

      정이 넘치는, 서로 존중하는 동네 문화를 함께 만들어가요 :)</h1>
      </div>

      <div class="row mt-2">

      <form action="forms/contact.php" method="post" role="form"
			class="php-email-form mt-4">
			<c:forEach var="LIST" items="${LISTS}" varStatus="loop">
				<div class="contents p-3" style="display: flex; flex-direction: column;">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="row mx-1"style="display: flex; justify-content: space-between; align-items:flex-end; border-bottom: 1px solid;">
						<div class="col-md-5 form-group mb-3" style="display: flex; align-items:center;">
							<img style="border-radius: 50%; width: 50px; height: 50px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/zabaraDefaultProfile.png"/>
							<div style="padding: 10px 15px;" >${LIST.nickName}</div>
						</div>
						<div class="col-md-5 form-group mb-3" style="display: block;">
							<div style="padding: 10px 15px; text-align: end; "><span class="p-2" style="background: black;border-radius: 20px;">${LIST.category}</span></div>
						</div>
					</div>
					<div class="form-group mb-3" style="padding: 10px 15px;">
						<div style="font-size: 23px;font-weight: bold;">${LIST.title}</div>
					</div>
					
					<div class="form-group mt-2" >
						<div style="padding: 10px 18px;">${LIST.content}</div>
					</div>
						<c:forEach var="i" begin="${loop.index}" end="${loop.index}">
							<c:if test="${!empty imageList[i][0].imageName}" var="haveImage">
								<div class="mt-3" style="padding: 10px 10px; display: flex; justify-content: center;" >
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i][0].imageName}"
										style="width: 100%; border-radius: 15px;" class="img-fluid" alt="">
								</div>
							</c:if>
						</c:forEach>
					<div class="text-center mt-3" style="display: flex; justify-content:flex-end; align-items:center; border-top:1px solid;">
						<a><i class="bx bi-heart mx-2" style="font-size: 38px"></i></a>
						<a><i class="bi bi-card-text mx-2" style="font-size: 40px"></i></a>
						 <a href="<c:url value="/chat/chatting.do">
						<c:param value="${LIST.townlist_no == null ? 0 : LIST.townlist_no}" name="townlist_no"/>
						<c:param value="${LIST.auction_no == null ? 0 : LIST.auction_no}" name="auction_no"/>
						<c:param value="${LIST.userNo}" name="writeuserno"/><c:param value="${LIST.nickName}" name="wirtenickName"/></c:url>">
						<i class="bx bxs-chat mx-1" title="채팅" style="font-size: 44px"></i></a>
					</div>
					
					
				</div>

	<div class="text-center mt-3 pd-4">
		<c:set var="session_id">
			<sec:authentication property="principal.username" />
		</c:set>
		<c:if test="${userno ==LIST.userNo }">

			<a
				href="<c:url value="/board/update.do">
        		<c:param name="townlist_no" value="${LIST.townlist_no }"/></c:url>"
				class="btn btn-warning" style="color: #fff">수정 </a>


			<a
				href="<c:url value="/board/deleteTown.do">
        		<c:param name="townlist_no" value="${LIST.townlist_no }"/>
        		<c:param name="auction_no" value="0"/>
        		<c:param name="product_no" value="0"/>
        		</c:url>"
				class="btn btn-dark" style="color: #fff">삭제 </a>

		</c:if>
	</div>

	<br />
	</c:forEach>
	</form>
	</div>
	 
  </div><!-- End 동내 Section -->