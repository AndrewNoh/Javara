<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
  <!-- ======= Portfolio Details ======= -->
  
<style>

textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
.contact .php-email-form{
    background: rgb(255 255 255 / 0%);
}
.select-items div, .select-selected{
background: #dee2e6
}

#previewImage > img{
height: 100%
}
#images > img{
height: 100%
}
.contents{
background-color: #ffffff21;
border-radius: 15px;
}
.input[id=inputBidPrice]{
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
    <div id="portfolio-details" class="portfolio-details contact">
      <div class="container">

        <div class="row">

         <div class="col-lg-8">
           <div class="mb-2" style="color: #ffc107; font-size: 20px">${list.category}</div>
            <h2 class="portfolio-title" >${list.title}</h2>
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">
              	<c:forEach var="image" items="${images}" varStatus="loop">
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}">
					</div>					
				</c:forEach>

              </div>
            </div>
          </div>

          <div class="col-lg-4 portfolio-info">
            <div class="content">
            	<c:if test="${userno == list.userNo}" var="isWriter">
                  <div  style="text-align: right; font-size: 20px; font-size: 20px; position: relative; bottom: 40px">
                     <button href="javascript:void(0);" id="edit" class="btn" style=" color: #fff"><img src="${pageContext.request.contextPath}/resources/assets/img/edit.png" class="bx bxs-edit" style="font-size: 30px" title="수정"></button>
                     <button href="javascript:void(0);" id="delete" class="btn" style=" color: #fff"><img src="${pageContext.request.contextPath}/resources/assets/img/delete.png" class="bx bxs-trash " style="font-size: 30px" title="삭제"></button>                  
                  </div>
               </c:if>
               <c:if test="${!isWrite}">
                  <button class="btn" style="float: right; color: #fff" data-toggle="modal" data-target="#reportUI" id="reportOpen"><img src="${pageContext.request.contextPath}/resources/assets/img/alert_sign.png" class="" style="font-size: 30px;" title="신고"/></button>
               </c:if>
				
				<div style="text-align: right;">				
				
					<div>${list.nickName}</div>
						<!-- <i class="bi bi-calendar-check"></i> -->
						${list.postDate}
					</div>
				
				<div class="mb-5">
			
					<p id="startPrice" title="${list.base_Price}">시작가 <strong style="font-size: 30px; margin-left: 10px"><fmt:formatNumber value="${list.base_Price}" pattern="#,###" />원</strong></p>
					<p id="upperPrice" title="${list.upper_Price}">현재 최고가 <strong style="color: #ffc107; margin-left: 10px; font-size: 35px;"><fmt:formatNumber value="${list.upper_Price}" pattern="#,###" />원</strong></p>
				
				</div>
				<div class="mb-5"  style="background-color: rgb(255 229 207 / 80%); height: 280px; border-radius: 10px 5%; padding: 10px 20px">
					<p style="font-size: 20px; ">${fn:replace(list.content, replaceChar, "<br/>")}</p>
				</div>		
				
				<div style="display: flex; justify-content:space-around; flex-direction: row-reverse;">
				<c:if test="${isWriter}">
					<div style="text-align: center; font-size: 20px; ">
						<button id="statusChange" style="float: right; font-size: 16px; color: #fff; background-color: #ffc107; width: 120px" class="btn" title="${list.status == 'END' ? 'SALE' : 'END'}">${list.status == 'END' ? '낙찰취소' : '낙찰하기'}</button>
					</div>
				</c:if>
				
				<c:if test="${list.status eq 'SALE'}" var="isSale">
					<c:if test="${!isWriter}">
						<c:if test="${userno == 0}" var="isZero">
							<div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
								 <a href="<c:url value="/location/login.do"/>"><button class="btn" style="background-color: #ffc107; color: #fff" >로그인하기</button></a>
							</div>
						</c:if>	
						<c:if test="${!isZero}">
							<div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
								 <button class="btn" style="background-color: #ffc107; color: #fff" data-toggle="modal" data-target="#bidUI">입찰하기</button>
							</div>
						</c:if>
					</c:if>
				</c:if>
				
					
				<c:if test="${!isSale}">
					<div class="text-center">
						<a href="<c:url value="/chat/chatting.do">
						<c:param value="${list.townlist_no == null ? 0 : list.townlist_no}" name="townlist_no"/>
						<c:param value="${list.auction_no == null ? 0 : list.auction_no}" name="auction_no"/>
						<c:param value="${list.userNo}" name="writeuserno"/><c:param value="${list.nickName}" name="wirtenickName"/></c:url>"><button class="btn" style="background-color: #ffc107; color: #fff" >채팅하기</button></a>
					</div>
				</c:if>
				</div>
				<div style="text-align: center; font-size: 25px; float: left;">
					 <i class="bx bxs-heart ml-3" style="color: #ffc107" ></i>
					 ${list.likes}
				</div>
				

				
			</div>
          </div>

        </div>

      </div>
    </div><!-- End Portfolio Details -->
    
    <div id="editDiv" class="contact" style="display:none;">    
		<div class="container">	
			<form action="" id="editForm" method="post" role="form" class="mt-4" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="row">
	        	<h2 class="portfolio-title"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" required="required" value="${list.title}"></h2>
	        	<div class="col-lg-8 pb-3">
	        		<div class="portfolio-details-slider swiper contents" style="text-align: center; ">
						
						<div style="height: 400px; line-height: 400px;" id="previewImage" class="contents mb-5">
							<c:forEach var="image" items="${images}" varStatus="editimgloop">
								<c:if test="${fn:length(images)-1 eq editimgloop.index}" var="eqIndex">
									<img id="${editimgloop.index}" src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}" style="width: auto; height: 100%;">
								</c:if>
								<c:if test="${!eqIndex}">
								<img id="${editimgloop.index}" src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}" style="width: auto; height: 100%; display: none;">
								</c:if>
							</c:forEach>
						</div>
						<div style="height: 200px; line-height: 200px;" id="images" class="contents mb-5">
							<c:forEach var="image" items="${images}" varStatus="editloop">
								<img id="${editloop.index}" src="${pageContext.request.contextPath}/resources/assets/img/product_img/${image.imageName}" style="height: auto; width: 20%;">				
							</c:forEach>
						</div>
						
						<div class="custom-file mb-3">
							<input type="file" multiple="multiple" class="custom-file-input" id="customFile" name="filename"> 
							<label class="custom-file-label" for="customFile">파일 선택</label>
						</div>

	            	</div>
	          	</div>
	
	          	<div class="col-lg-4 custom-form " style="padding: 5px">
	            	<div class="content">
	            		<h6>제품 카테고리</h6>
						<div class="custom-select form-group mt-0 mt-md-0 mb-3">
							<select name="category" >
						   		<option selected value="기타">기타</option>
						   		<option value="중고차">중고차</option>
						   		<option value="디지털기기">디지털기기</option>
						   		<option value="생활가전">생활가전</option>
						   		<option value="가구인테리어">가구/인테리어</option>
						   		<option value="유아동">유아동</option>
						   		<option value="유아도서">유아도서</option>
						   		<option value="가공식품">가공식품</option>
						   		<option value="스포츠레저">스포츠/레저</option>
						   		<option value="여성잡화">여성잡화</option>
						   		<option value="여성의류">여성의류</option>
						   		<option value="남성패션잡화">남성패션/잡화</option>
						   		<option value="게임취미">게임/취미</option>
						   		<option value="뷰티미용">뷰티/미용</option>
						   		<option value="반려동물용품">반려동물용품</option>
						   		<option value="도서티켓음반">도서티켓음반</option>
						   		<option value="식물">식물</option>
							</select>
						</div>
						
						<h6 style="font-weight: bold; color:#000">경매 종료일</h6>
						<div class="custom-select form-group mt-0 mt-md-0 mb-3">							
					 		<select name="enddate">					 			
					    		<option selected value="1">1일(24시간)</option>
					    		<option value="2">2일(48시간)</option>
					    		<option value="3">3일(72시간)</option>
					    		<option value="4">4일(96시간)</option>
					    		<option value="5">5일(120시간)</option>
					  		</select>
						</div>
						
						<h6 style="font-weight: bold; color:#000">판매주소 선택</h6>
						<div class="form-group">
							<input type="text" name="address" class="form-style" style="border:none; solid: 1px gray; padding: 10px; width: 360px"
									onmousedown="daumAddress()" placeholder="내 동네 이름(동,읍,면으로 검색)" id="address" autocomplete="off" readonly>
							
							<input type="hidden" name="latitude" id="latitude" value="not">
							<input type="hidden" name="longitude" id="longitude" value="not">											
						</div>
						
						<div class="my-3">
							<p style="font-weight: bold; margin-bottom: 7px; color:#000">가격</p>
							<input type="text" style="margin-bottom: 10px"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								maxlength="11" class="form-control" placeholder="가격을 입력하세요" value="${list.base_Price}" name="price" pattern="[1-9][0-9]{0,}0" title="금액은 0으로 시작할 수 없습니다.\n금액은 최소 10원단위 입니다." required="required">
						</div>
						<div class="mt-3 mb-5">
							<p style="font-weight: bold; margin-bottom: 7px; color:#000">내용</p>
							<textarea class="form-control" rows="10" name="content" required="required" placeholder="내용을 입력하세요">${list.content}</textarea>
						</div>
						<div class="text-center col ">
							<button class="col-4 m-2 btn" style="background-color: #ffc107; color: #fff" type="button" id="submit">수정</button>
							<button class="col-4 m-2 btn btn-dark" type="button" id="cancle">취소</button>
						</div>
						<input type="hidden" name="board" value="경매"/>
						<input type="hidden" name="auction_no" value="${param.no}"/>
		          	</div>
		        </div>
		    </div>
			</form>
	</div>
</div>
	
<div class="modal fade" id="bidUI" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="position: fixed; top:25%; color:black">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" style="color: black; font-size: 20px; font-weight: bold; ">입찰</h5>
			</div>	
			<div class="modal-body">
			<div class="modal-body">
				<p style="text-align: center; font-weight: bold; color: #ffc107; margin-top: 10px" id="upperPriceBid" title="${list.upper_Price}">현재 최고가는  <fmt:formatNumber value="${list.upper_Price}" pattern="#,###" />원 입니다</p>					
			</div>				
			<div style="margin-bottom: 20px">
				<h1 style="font-size: 14px; font-weight: bold; text-align:center; ">입찰하기
				<input type="text" id="inputBidPrice" class="input" style="margin-left: 3px"/> 원</h1>
			</div>		
			<div class="modal-footer">
					<button type="button" class="btn" style="background-color: #ffc107; color: #fff; margin-bottom: -30px; margin-left: 10px" id="doBid">등록</button>
				</div>
				<br/>
				<div id="dialog-message" title="입찰 확인" style='display:none'>
				  	입찰하시겠습니까?<br/>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reportUI" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="position: fixed; top:25%; color:black">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" style="color: black; font-size: 20px; font-weight: bold; font-align: center ">신고</h5>
			</div>	
			<div class="modal-body">
				<div style="margin-bottom: 20px;  ">
					<h1 style="font-size: 14px; font-weight: bold;">'${list.title}' 게시글을 신고하는 이유를 선택해주세요.</h1>
					<div>
						<select id="reportCategory" style="padding: 5px">
							<option selected value="기타">기타</option>
							<option value="부적절한 내용">부적절한 내용</option>
							<option value="허위 매물">허위 매물</option>
							<option value="판매 금지물품">판매 금지물품</option>
							<option value="중복 판매글">중복 판매글</option>
						</select>
					</div>
					<h1 style="font-size: 14px; font-weight: bold; margin-top: 10px">신고 상세 내용을 정확하게 기재해주세요.</h1>
					<div>
						<textarea id="reportContent" ></textarea>
					</div>
				</div>
					
				<div class="modal-footer">
					<button type="button" class="btn" style="background-color: #ffc107; color: #fff; margin-bottom: -30px; margin-left: 10px" id="report">등록</button>
				</div>
				<br/>
			</div>
		</div>
	</div>
</div>


    
<script type="text/javascript">
	$('#delete').on("click", function(){
		
		$.ajax({
			url :'<c:url value="/board/delete.do"/>',
			type:'POST',
			dataType: "text",
			data:{auction_no : ${empty list.auction_no ? 0 : list.auction_no}, product_no:${empty list.product_no ? 0 : list.product_no}, townlist_no:${empty list.townlist_no ? 0 : list.townlist_no}, '${_csrf.parameterName}':'${_csrf.token}'},
		}).done(function(data){
			parent.location.reload();
		});
	});
	
	$(document).ready(function(){
		var i = true;
		var reload = 0;
		
		$('#navbar').hide();
		$('#chatUi').hide();
		$('#chatbot').hide();
		
		if('${goChat}' == 'Y'){
			console.log("채팅으로 가")
			window.open("<c:url value='/chat/chattingroom.do'/>");
		} else {
			console.log("채팅으로 가지마")
		}
	});
	
	$(document).on("load", function(){
		
	});
	
	$('#edit').on("click", function(){
		$('#portfolio-details').hide();
		$('#chatUi').hide();
		$('#editDiv').show();
		
	});	
	
	$('#cancle').on("click", function(){
		$('#portfolio-details').show();
		$('#editDiv').hide();
		$('#chatUi').hide();
	});	
		
	$('#goList').on("click", function(){
		parent.location.reload();
	});	
	
	$('#submit').on("click", function(){
		var formData = new FormData($('#editForm')[0]);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',	// 필수
			url: '<c:url value="/board/edit.do"/>',
			data: formData,		// 필수
			processData: false,	// 필수
			contentType: false,	// 필수
			cache: false,
			success: function (result) {
				console.log(result)
				if(result != 0){
					location.reload();
					reload = 1;
				} else {
					parent.location.reload();
				}
			},
			error: function (e) {
				parent.location.reload();
			}
		});
		
	});
	
	
	
	function readMultipleImage(input) {	
		const previewImage = $('#previewImage');
		const images = document.getElementById('images');
				
	    if(input.files) {
	    	const fileArr = Array.from(input.files);
	    	var i = $('#previewImage > img').length;
	    	
	    	if(fileArr.length > 5){
	    		const Toast = Swal.mixin({
			    	toast : true,
			        position : 'center-center',
			        showConfirmButton : false,
			        timer : 1000,
			        timerProgressBar : true,
			    })

			    Toast.fire({
			        icon : 'error',
			        title : '이미지는 5장까지만 등록이 가능합니다.'
			    });
	    		
	    		return;
	    	}	    	
	    	
			fileArr.forEach((file, index) => {
				const reader = new FileReader();
				const img = document.createElement('img');
				const little = document.createElement('img');
				
				previewImage.append(img);
				
				
				
				little.id = i;
				images.appendChild(little);
				
				reader.onload = e => {
					img.src = e.target.result;
					little.src = e.target.result;
				}
				
				$('#images > img:eq('+i+')').on("click", function(){
					var id = $(this).attr('id');
					console.log(id);
					$('#previewImage > img').hide();
					$('#previewImage > img:eq('+id+')').show();
				});
				
				i++;
				
				reader.readAsDataURL(file);
			});
			
			var image = $('#previewImage > img');
			$.each(image, function(index){
				if(index != image.length-1){
					$('#previewImage > img:eq('+index+')').hide();
				}
			});			

			$('#p').remove();
			
		}
	}
							
	// 이벤트 리스너
	$('#customFile').on("change", function(e){
		$('img').remove();
		readMultipleImage(e.target);	
	});
	
	$('#bid').on("click", function(){
		console.log("클릭됨")
		$('#bidUI').show();
	});
	
	$('#doBid').on("click", function() {
		upperprice = $('#upperPriceBid').attr('title');
		newprice = $('#inputBidPrice').val();
		console.log(upperprice - newprice)
		

		
		if(confirm("입찰하려는 가격은 " + newprice + "원 입니다.") == true) {
			if(upperprice - newprice >= 0) {
				const Toast = Swal.mixin({
			    	toast : true,
			        position : 'center-center',
			        showConfirmButton : false,
			        timer : 1000,
			        timerProgressBar : true,
			    })
	
			    Toast.fire({
			        icon : 'error',
			        title : '입찰 가격은 현재 최고가보다 높아야합니다.'
			    });
			} else {
				//wsocket.send('경매 upperuserno${list.upper_user_no},userNo${list.userNo},email${email}:'+"${list.title}의 최고가가 갱신되었어요");
				console.log('경매 upperuserno${list.upper_user_no},userNo${list.userNo},email${email}:'+"${list.title}의 최고가가 갱신되었어요");
				$.ajax({
					url :'<c:url value="/board/newUpperPrice.do"/>',
					type:'POST',
					dataType: "text",
					data:{'${_csrf.parameterName}':'${_csrf.token}', upperprice:upperprice, newprice:newprice, auction_no:${list.auction_no}},
				}).done(function(data){
					console.log(data)
					if(data == 1){
						window.location.href = '<c:url value="/board/auctionview.do"><c:param value="${param.no}" name="no"/></c:url>';
					}
				});
				
			}
		} else {
			const Toast = Swal.mixin({
		    	toast : true,
		        position : 'center-center',
		        showConfirmButton : false,
		        timer : 1000,
		        timerProgressBar : true,
		    })

		    Toast.fire({
		        icon : 'error',
		        title : '입찰을 취소했습니다.'
		    });
		}
	});
	
	
   $('#statusChange').on("click", function(){
		var value = $('#statusChange').attr("title");
		var start = $('#startPrice').attr("title");
		var upper = $('#upperPrice').attr("title");
		
		console.log(start);
		console.log(upper);
		
		if ((upper - start) > 0) {
			$.ajax({
				url : '<c:url value="/board/changeStatus.do" />',
				type:'POST',
				dataType: "text",
				data:{'${_csrf.parameterName}':'${_csrf.token}', auction_no:${list.auction_no}, board:"경매", status:value},
			}).done(function(data){
				console.log(data + " : " + value)
				var text = value == 'END' ? '낙찰취소' : '낙찰하기';
				$('#statusChange').text(text);
				$('#statusChange').attr("title", "SALE");

				if(value == 'END'){
					const Toast = Swal.mixin({
				    	toast : true,
				        position : 'center-center',
				        showConfirmButton : false,
				        timer : 1000,
				        timerProgressBar : true,
				    })

				    Toast.fire({
				        icon : 'success',
				        title : '낙찰하였습니다.'
				    });
					wsocket.send('낙찰 upperuserno${list.upper_user_no},userNo${list.userNo},email${email}:'+"${list.title}가 낙찰되었어요");
					console.log('낙찰 upperuserno${list.upper_user_no},userNo${list.userNo},email${email}:'+"${list.title}가 낙찰되었어요"); 
					 var today = new Date();
					 if('${roomno}'===""){
						   $.ajax({
					           url: '<c:url value="/chat/chatting.do"><c:param value="${list.upper_user_no}" name="upperuserno"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="0" name="townlist_no"/><c:param value="${list.auction_no}" name="auction_no"/><c:param value="${userno}" name="writeuserno"/></c:url>',
					           data: {chatcontent:'축하합니다.낙찰되셨습니다.',
					        	   img:'낙찰되셨습니다.png',
					                 senduserno:'${userno}',
					                 unread_count:'1',
					                 sendtime: today.toLocaleTimeString('en-US'),
					                 '${_csrf.parameterName}':'${_csrf.token}'},
					           type: 'get',
					           dataType: 'text',
					           success: function (result) {
					        	   console.log('get낙찰채팅')
					           },
					           error: function () {
					        	   console.log('get낙찰채팅x')
					           }
					        });
					   }
					 $.ajax({
				           url: '<c:url value="/chat/chatting.do"><c:param value="${list.upper_user_no}" name="upperuserno"/><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="0" name="townlist_no"/><c:param value="${list.auction_no}" name="auction_no"/><c:param value="${userno}" name="writeuserno"/></c:url>',
				           data: {chatcontent:'축하합니다.낙찰되셨습니다.',
				        	   	 img:'낙찰되셨습니다.png',
				                 senduserno:'${userno}',
				                 unread_count:'1',
				                 sendtime: today.toLocaleTimeString('en-US'),
				                 '${_csrf.parameterName}':'${_csrf.token}'},
				           type: 'POST',
				           dataType: 'text',
				           success: function (result) {
				        	   console.log('post낙찰채팅')
				           },
				           error: function () {
				        	   console.log('post낙찰채팅x')
				           }
				        });
						   
					   
					
				} else {
					const Toast = Swal.mixin({
				    	toast : true,
				        position : 'center-center',
				        showConfirmButton : false,
				        timer : 1000,
				        timerProgressBar : true,
				    })

				    Toast.fire({
				        icon : 'success',
				        title : '낙찰을 취소했습니다.'
				    });
					
				}
			});
		} else {
			const Toast = Swal.mixin({
		    	toast : true,
		        position : 'center-center',
		        showConfirmButton : false,
		        timer : 1000,
		        timerProgressBar : true,
		    })

		    Toast.fire({
		        icon : 'error',
		        title : '낙찰하려면 시작가보다 최고가가 높아야합니다.'
		    });
		}
	});

   
   $('#report').on("click", function(){
	   $.ajax({
			url : '<c:url value="/board/report.do" />',
			type:'POST',
			dataType: "text",
			data:{'${_csrf.parameterName}':'${_csrf.token}', auction_no:${list.auction_no}, category:$('#reportCategory').val(), content:$('#reportContent').val()}
		}).done(function(data){
			if(data == 1){
				const Toast = Swal.mixin({
			    	toast : true,
			        position : 'center-center',
			        showConfirmButton : false,
			        timer : 1000,
			        timerProgressBar : true,
			    })

			    Toast.fire({
			        icon : 'success',
			        title : '신고되었습니다.'
			    }); 
			} else {
				const Toast = Swal.mixin({
			    	toast : true,
			        position : 'center-center',
			        showConfirmButton : false,
			        timer : 1000,
			        timerProgressBar : true,
			    })

			    Toast.fire({
			        icon : 'error',
			        title : '신고는 1회만 가능합니다.'
			    });
			}
			
			$('#reportOpen').trigger("click");
		});
   });
</script>
