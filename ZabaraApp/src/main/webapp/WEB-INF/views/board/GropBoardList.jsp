<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- ======= 동내 Section ======= -->
 <style>
.form-group{
background:  rgb(0 0 0 / 13%);
border-radius: 10px;
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
        <p>👩🏻‍🤝‍👨🏽 우리가 함께라면, 건강하고 따뜻한 동네생활을 만들 수 있어요 </p>
        <h1 style="font-size: 18px">동네생활은 이웃과 함께 정보를 공유하고, 이야기를 나누는 공간이에요.<br/>

      이웃에게 물어보면, 이웃들이 친절하게 진짜 정보를 알려줄거에요.<br/>

      자바라는 당신의 따뜻한 동네생활을 기대해요!

      정이 넘치는, 서로 존중하는 동네 문화를 함께 만들어가요 :)</h1>
      </div>

      <div class="row mt-2">

      <form action="forms/contact.php" method="post" role="form" class="php-email-form mt-4">
      <c:forEach var="LIST" items="${LISTS}" varStatus="loop">
      <div class="container">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="row mx-1" style="display: flex; align-items: center; justify-content: space-between;">
          <div class="col-md-5 form-group mr-1" >
           <div style="padding: 10px 15px;">${LIST.nickName}</div>
          </div>
          <div class="col-md-5 form-group ml-1" >
            <div style="padding: 10px 15px;">${LIST.category}</div>
          </div>
        </div>
        <div class="form-group mt-3" style="padding: 10px 15px;">
          <div>${LIST.title}</div>
        </div>
        <div class="form-group mt-3" style=" padding: 10px 30px;">
          <div>${LIST.content}</div>
          <c:forEach var="i" begin="${loop.index}" end="${loop.index}">
			<c:if test="${!empty imageList[i][0].imageName}" var="haveImage">
				<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i][0].imageName}" style="width: 40%; height:40%;" class="img-fluid" alt="">
			</c:if>
			<c:if test="${! haveImage}">
				<img src="${pageContext.request.contextPath}/resources/assets/img/zabara.png" style="width: 40%; height:40%;" class="img-fluid" alt="">
			</c:if>
			</div>
			</div>
		</c:forEach>
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