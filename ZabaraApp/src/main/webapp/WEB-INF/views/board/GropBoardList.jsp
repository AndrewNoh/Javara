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
	width: 100%;
	margin: auto;
}

.write_cmt input{     
   border: 2px solid rgb(255 255 255 / 0%);
    border-radius: 4px;
    width: 100%; 
    padding:2px 0 4px 6px; 
    background:#ffffff00;
    border-bottom: 1px solid white;  
    color: white;  
    
    }
    
.write_cmt .input-group-addon button {
  background: transparent;
  border: medium none;
  padding: 0;
  color: bl;
  font-size: 18px;
}
.write_cmt .input-group-addon { margin: 0 0 0 -33px;}
.comment_box{
	border-bottom: 0.5px solid #ffffff80;
	    margin: 20px;
    width: 97.5%;
}
.comment_info_date{
	float: right;}
</style> 
<div style="position: fixed;bottom: 12%; right: 3%;">
   <a href="<c:url value="/board/write.do"><c:param name="board" value="GropBoard"/> </c:url>">
  <img src="${pageContext.request.contextPath}/resources/assets/img/write_btn.png" 
       title="글쓰기" style="width: 80px; height: 80px"></a>
</div>
<div style="position: fixed;bottom: 5%; right: 3%;">
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
					<div class="row mx-1"style="display: flex; justify-content: space-between; align-items:flex-end; border-bottom: 0.5px solid #ffffff80;">
						<div class="col-md-5 form-group mb-3" style="display: flex; align-items:center;">
							<img style="border-radius: 50%; width: 50px; height: 50px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/zabaraDefaultProfile.png"/>
							<div style="padding: 10px 15px;" >${LIST.nickName}</div>
						</div>
						<c:set var="session_id">
							<sec:authentication property="principal.username" />
						</c:set>
						<div class="col-md-5 form-group mb-3" style="display: flex; justify-content: flex-end; align-items: center;">
							<c:if test="${userno ==LIST.userNo }">
								<a href="<c:url value="/board/update.do">
					        		<c:param name="townlist_no" value="${LIST.townlist_no }"/></c:url>"id="edit">
					        		<i class="bx bxs-edit p-2" style="font-size: 30px" title="수정"></i></a>
								<a href="<c:url value="/board/deleteTown.do">
					        		<c:param name="townlist_no" value="${LIST.townlist_no }"/>
					        		<c:param name="auction_no" value="0"/>
					        		<c:param name="product_no" value="0"/>
					        		</c:url>" id="delete">
					        		<i class="bx bxs-trash p-2" style="font-size: 30px" title="삭제"></i></a>
							</c:if>
							<div style="padding: 10px 15px; text-align: end; "><span class="p-2" style="background: #85adad;border-radius: 20px;">${LIST.category}</span></div>
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
										style="width: 60%; border-radius: 15px;" class="img-fluid" alt="">
								</div>
							</c:if>
						</c:forEach>
					<div class="text-center mt-3" style="display: flex; justify-content:flex-end; align-items:center; border-top:0.5px solid #ffffff80;">
						<div  style="margin-right:30px;margin-top: 10px">
							<a class=""><i class="bx bi-heart mx-3" style="font-size: 38px; text-align: center;"></i>좋아요</a>
							<a class="comment" ><i class="bi bi-card-text mx-3" style="font-size: 40px; text-align: center;" ></i>댓글</a>
						</div>	
					</div>
					<div class="search row comments" style="display: none;" >
							<h5 class="comment_title">댓글</h5>
						<div class="comment_box">
									<div class="comment_nick_box mb-4">
										<img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77"
											alt="프로필 사진" width="30" height="30"> 
											<a id="" class="comment_nickname">아이디1</a>
									</div>
									<div class="comment_text_box m-2" style="display: flex; justify-content: space-between;">
										<div class="comment_text_view">
											<span class="text_comment ">댓글 댓글<br></span>
										</div>
										<span class="comment_info_date" style="font-size: 13px;">2020.08.03. 20:23</span>
									</div>
						</div>
							<div class="write_cmt" style="text-align: center;">
								<div class="stylish-input-group">
									<input type="text" placeholder="댓글을 입력해보세요" name="title"
										class="search-bar"> <span class="input-group-addon">
										<button id="modal-open" data-toggle="modal"
											data-target="#myModal" type="button"
											style="margin-left: -10px; vertical-align: -0.3em;">
											<i class="bi bi-card-text" aria-hidden="false"
												style="font-size: 25px; color: white;"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
				</div>

	<br />
	</c:forEach>
	</form>
	</div>
	 
  </div><!-- End 동내 Section -->
  <script>
  var comment = $('a[name=comment]');
  $(document).on("click", '.comment', function(e){
	  var comments = document.querySelectorAll('.comments');
	  var comment = document.querySelectorAll('.comment');
      for(var i=0; i<comments.length;i++){
    	  if(this===comment[i]){
    	 	 console.log(comment[i]);
	           $(comments[i]).toggle();
    	  }
      }
  });
  </script>