<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
a:hover {
  color: #fff;
  text-decoration: none;
}
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
        <p style="margin-top:10px">👫🏻 우리가 함께라면, 건강하고 따뜻한 동네생활을 만들 수 있어요 </p>
        <h1 style="font-size: 18px">동네생활은 이웃과 함께 정보를 공유하고, 이야기를 나누는 공간이에요.<br/>

      이웃에게 물어보면, 이웃들이 친절하게 진짜 정보를 알려줄거에요.<br/>

      자바라는 당신의 따뜻한 동네생활을 기대해요!

      정이 넘치는, 서로 존중하는 동네 문화를 함께 만들어가요 :)</h1>
      </div>

     <div class="row mt-2">
      <form action="javascript:void(0);" method="post" role="form" enctype="multipart/form-data"
			class="php-email-form mt-4">
			<c:forEach var="LIST" items="${LISTS}" varStatus="loop">
				<div class="contents p-3" style="display: flex; flex-direction: column;">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="row mx-1"style="display: flex; justify-content: space-between; align-items:flex-end; border-bottom: 0.5px solid #ffffff80;">
						<div class="col-md-5 form-group mb-3" style="display: flex; align-items:center;">
							<img style="border-radius: 50%; width: 50px; height: 50px;" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${LIST.profile_img}"/>
							<div style="padding: 10px 15px;" >${LIST.nickName}</div>
						</div>
						<c:set var="session_id">
							<sec:authentication property="principal.username" />
						</c:set>
						<div class="col-md-5 form-group mb-3" style="display: flex; justify-content: flex-end; align-items: center;">
							<c:if test="${userno ==LIST.userNo }">
							<!-- 
								<a href="<c:url value="/board/update.do">
					        		<c:param name="townlist_no" value="${LIST.townlist_no }"/></c:url>"id="edit">
					        		<i class="bx bxs-edit p-2" style="font-size: 25px" title="수정"></i></a>
					        -->
							
								<a href="<c:url value="/board/deleteTown.do">
					        		<c:param name="townlist_no" value="${LIST.townlist_no }"/>
					        		<c:param name="auction_no" value="0"/>
					        		<c:param name="product_no" value="0"/>
					        		</c:url>" id="delete">
					        		<i class="bx bxs-trash p-2" style="font-size: 20px" title="삭제"></i></a>
							</c:if>
							<div style="padding: 10px 10px; text-align: end; "><span class="p-2" style="background: #85adad;border-radius: 20px;">${LIST.category}</span></div>
						</div>
					</div>
					<div class="form-group " style="padding: 10px 15px;">
						<div style="font-size: 18px;font-weight: bold; color: #ffc107">${LIST.title}</div>
					</div>
					
					<div class="form-group" >
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
						
						<div class="text-center mt-3" style="display: flex; justify-content:flex-end; align-items:center; border-top:.1px solid #ffffff80;">
						<i class="bi bi-heart-fill" id="likeval${LIST.townlist_no }" style="color: #ffc107; font-size: 20px; margin-right: 1100px; margin-top: 10px;">${LIST.likes}</i>

						<div  style="margin-right:30px;margin-top: 10px">
							<a class="like" style="font-size: 16px" data-value="${LIST.townlist_no}" name="${LIST.title}:${LIST.userNo }"><i class="bi bi-heart-fill" style="font-size: 20px; text-align: center; "data-value="${LIST.townlist_no}"></i></a>
							<a class="comment" title="${LIST.townlist_no}" style="margin-left: 10px; font-size: 16px"><i class="bi bi-chat-left-dots" style="font-size: 20px; text-align: center;" ></i></a>
						</div>	
					</div>
					<div class="search row comments" style="display: none;" >

						<div class="comment_box">
							<div id="commentList${LIST.townlist_no}">
							
			                </div>			
			               								
						</div>
							<div class="write_cmt"  style="text-align: center;">
		                        <div class="stylish-input-group" > 
		                           <input type="text" onkeyup="enterkey(${LIST.townlist_no})" placeholder="댓글을 입력하시오" id="comment_content${LIST.townlist_no}" data-value="ct${LIST.townlist_no }" class="search-bar" style="border:none; width: 1200px">
		                              <span class="input-group-addon" id="cCnt${LIST.townlist_no}">			                             
		                           	  </span>
		                        	  <button type="button" class="send" style="background-color: transparent; border:none" title="${LIST.townlist_no}" name="${LIST.title}:${LIST.userNo }">
		                                 <i class="bi bi-check2-circle" aria-hidden="false" style="font-size: 25px; color: #fff;"></i>
			                          </button>   
		                        </div>
                    		 </div>
						</div>
					</div>
				<br/>
			</c:forEach>
		</form>
	</div>
 </div>
 
<script>

	function enterkey(value) {
		if (window.event.keyCode == 13) {
	    	// 엔터키가 눌렸을 때
	    	// console.log('엔터키');
	    	console.log(value);
	    	// console.log($(this).val()); // undefined
	    	// console.log($(this).data('no')); // undefined
	    	$('.send[title='+value+']').trigger('click');
	    }
	}
	

	  // 댓글: 댓글창 오픈
	  // 댓글 데이터 가져오기
	  var comment = $('a[name=comment]');
	  var nickName = '${LIST.nickName}';

	  $(document).on("click", '.comment', function(e){
		  var comments = document.querySelectorAll('.comments');
		  var comment = document.querySelectorAll('.comment');
		  var townlistNo = $(this).attr('title');
		  
		  for(var i=0; i<comments.length;i++){
	    	  if(this===comment[i]){
	    	 	 // console.log(comment[i]);
		           $(comments[i]).toggle();
	    	  }
	      }
		      $.ajax({
		    	  type: 'POST',
		      	  url: '<c:url value="/comment/list.do"/>',
		      	  dataType: 'json', 
		      	  data:{
		      		'${_csrf.parameterName}':'${_csrf.token}',
		      		 townlist_no: townlistNo,
		      		 
		      	  },
		      		 success: function(data){
		      			 var html = "";	
		      			 var cCnt = data.length;
		      			 if(data.length > 0){
		      				 for(i=0; i<data.length; i++){
		      					 var date = new Date(data[i].comment_postdate);
		      					 html += "<div style='margin-bottom: 10px'>"; 
		      					 html += "<img style='border-radius: 50%; width: 40px; height: 40px;' src='${pageContext.request.contextPath}/resources/assets/img/zabaraImg/"+data[i].profile_img+"'/>";
		                         html += "<strong style='margin-left: 10px; color: #85adad'>"+data[i].nickname+"</strong>"+"<span style='margin-left: 10px'>"+data[i].comment_content +"</span>" + "<tr></tr>" +"<span style='float: right'>"+date.toLocaleString()+"</span>";
		                         html += "</div>";
		      				 }
		      			 } else {
			      				html += "<div>";
			                    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                    html += "</table></div>";
			                    html += "</div>";
		      			 }		      			
		      			  // $('#cCnt'+townlistNo).html(cCnt);
		                  $('#commentList'+townlistNo).html(html);
		                 
		      		 },////success
		      	     
		      		 error: (error) => {
		                 console.log(JSON.stringify(error));
		      		 }////error
		      		
		      	  })	
	  		});
	 
      // 댓글: 댓글 작성
	  $(document).on("click", '.send', function(e){
		  var townlistNo = $(this).attr('title');
		  var WriteUserNO = $(this).attr('name');
		  var comment_content = $('#comment_content'+townlistNo).val(); // 댓글 내용
			$.ajax({
				url: '<c:url value="/comment/write.do"/>',
				type: 'POST',
				dataType: 'text',
				data: {
					'${_csrf.parameterName}':'${_csrf.token}',
					townlist_no: townlistNo,
					comment_content: comment_content
				},
					success: function(result){
						console.log('result',result);
						if(result == 1){
							location.reload(); 
						}
						
						 wsocket.send('동네:townlist_no,WriteUserNO:'+WriteUserNO.split(/[:]/)[1]+',townlist_title:'+WriteUserNO.split(/[:]/)[0]);
						 console.log('동네:townlist_no,WriteUserNO:'+WriteUserNO.split(/[:]/)[1]+',townlist_title:'+WriteUserNO.split(/[:]/)[0]);
						
					},
					error: (error) => { 
						console.log(JSON.stringify(error)); 
					}
				})	
		  	});
	  
		  
  
  // 좋아요
  var like = $('a[name=like]');
  $(document).on("click", '.like', function(e){
	  var WriteUserNO = $(this).attr('name');
	   // console.log('클릭이벤트');
	   var like = $(this);
		$.ajax({
			url :'<c:url value="/board/likeUp.do"/>',
			type:'POST',
			dataType: "text",
			data:{'${_csrf.parameterName}':'${_csrf.token}', no:$(this).data("value"), board:"우리동네"},
		}).done(function(data){
			if (data != 1) {
			 	// console.log('좋아요');
				wsocket.send('동네:like,WriteUserNO:'+WriteUserNO.split(/[:]/)[1]+',townlist_title:'+WriteUserNO.split(/[:]/)[0]);
				 console.log('동네:like,WriteUserNO:'+WriteUserNO.split(/[:]/)[1]+',townlist_title:'+WriteUserNO.split(/[:]/)[0]);
				like.children().css("color", "#ffc107");
			} else {
				// console.log("좋아요 해제");
				like.children().css("color", '');
			}
			
			// console.log(like.data("value"))
			
			
			   // 좋아요: 실시간 반영
				$.ajax({	
					url :'<c:url value="/board/liveLikeUp.do"/>',
					type:'POST',
					dataType: "text",
					data:{
						'${_csrf.parameterName}':'${_csrf.token}', 
						 no: like.data("value")
					}
					}).done(function(data){
						$('#likeval'+like.data("value")).text(data);
						
		  			});//////
	  			});//////
	  });
  	$(document).ready(function(){		
		$.each(${likes}, function(index, value){
			// console.log("좋아요 : " + value);
			$('a[data-value="'+value+'"]').children().css('color', '#ffc107');
		});
		
  	});
  	
  </script>