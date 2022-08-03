<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
  <!-- ======= Portfolio Details ======= -->
  
<style>
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
            <h2 class="portfolio-title" style="font-family: GmarketSansBold">${list.title}</h2>
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
					<div  style="text-align: right; font-size: 20px;">
						<a href="javascript:void(0);" id="edit"><i class="bx bxs-edit" style="font-size: 30px" title="수정"></i></a>
						<a href="javascript:void(0);" id="delete"><i class="bx bxs-trash " style="font-size: 30px" title="삭제"></i></a>
						<a href="javascript:void(0);" id="report" title="0"><i class="bx bxs-angry" style="font-size: 30px" title="신고"></i></a>
					</div>
				</c:if>
				<c:if test="${isWriter}">
					<button id="statusChange" style="float: right; font-size: 16px; color: #fff; background-color: #85adad" class="btn" title="${list.status == 'END' ? 'SALE' : 'END'}">${list.status == 'END' ? '낙찰취소' : '낙찰하기'}</button>
					<br>
					<br>
				</c:if>
				
				<div style="text-align: right;">				
				
					<div>${list.nickName}</div>
						<i class="bi bi-calendar3"></i> ${list.postDate}
					</div>
				<div class="mb-4" style="color: #85adad">${list.category}</div>
				<div class="mb-5" style="font-size: 20px;">
			
					<p id="startPrice" title="${list.base_Price}">시작가 <strong style="font-size: 30px; margin-left: 10px"><fmt:formatNumber value="${list.base_Price}" pattern="#,###" />원</strong></p>
					<p id="upperPrice" title="${list.upper_Price}">현재 최고가 <strong style="color: #85adad; margin-left: 10px; font-size: 35px;"><fmt:formatNumber value="${list.upper_Price}" pattern="#,###" />원</strong></p>
				</div>
				<div class="mb-5">
					<p style="font-size: 20px">${fn:replace(list.content, replaceChar, "<br/>")}</p>
				</div>		
				
				<c:if test="${!isWriter}">
					<div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
						 <button class="btn" style="background-color: #85adad; color: #fff" data-toggle="modal" data-target="#bidUI">입찰하기</button>
					</div>
				</c:if>
				
				<div style="text-align: center; font-size: 20px; margin-bottom: 20px; ">
					 <a href="#" ><i class="bx bxs-like ml-3" ></i>${list.likes}</a>
				</div>
				
				<c:if test="${!isWriter}">
					<div class="text-center">
						<a href="<c:url value="/chat/chatting.do">
						<c:param value="${list.townlist_no == null ? 0 : list.townlist_no}" name="townlist_no"/>
						<c:param value="${list.auction_no == null ? 0 : list.auction_no}" name="auction_no"/>
						<c:param value="${list.userNo}" name="writeuserno"/><c:param value="${list.nickName}" name="wirtenickName"/></c:url>"><i class="bx bxs-chat mx-5" title="채팅" style="font-size: 50px"></i></a>
						<a href="#"style="font-size: 50px"><i class="bx bxs-book-heart ml-3" ></i></a>
					</div>
				</c:if>
				
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
		        	<h2 class="portfolio-title"><input type="text" value="${list.title}" class="form-control" placeholder="제목을 입력하세요" name="title" required="required"></h2>
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
		
		          	<div class="col-lg-4 custom-form " style="margin-bottom: 15px;">
		            	<div class="content">
		            		<h6 style="font-weight: bold; color:#000">카테고리</h6>
							<div class="custom-select form-group mt-0 mt-md-0 mb-3">
						 		<select name="category">
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
									maxlength="11" class="form-control" placeholder="가격을 입력하세요" name="price" pattern="[1-9][0-9]{0,}0" title="금액은 0으로 시작할 수 없습니다.\n금액은 최소 10원단위 입니다." required="required">
							</div>
							<div class="mt-3 mb-5">
								<p style="font-weight: bold; margin-bottom: 7px; color:#000">내용</p>
								<textarea class="form-control" rows="10" name="content" required="required" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="text-center col ">
								<button class="col-4 m-2 btn btn-outline" type="submit">글쓰기</button>
								<button class="col-4 m-2 btn btn-dark" id="goList" style="border: 0; padding: 10px 30px; color: #fff; transition: 0.4s; border-radius: 4px;" type="button">목록</button>
							</div>
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
				<p style="text-align: center; font-weight: bold; color: #85adad; margin-top: 10px" id="upperPriceBid" title="${list.upper_Price}">현재 최고가는  <fmt:formatNumber value="${list.upper_Price}" pattern="#,###" />원 입니다</p>					
			</div>				
			<div style="margin-bottom: 20px">
				<h1 style="font-size: 14px; font-weight: bold; text-align:center; ">입찰하기
				<input type="text" id="inputBidPrice" class="input" style="margin-left: 3px"/> 원</h1>
			</div>		
			<div class="modal-footer">
					<button type="button" class="btn" style="background-color: #85adad; color: #fff; margin-bottom: -30px; margin-left: 10px" id="doBid">등록</button>
				</div>
				<br/>
				<!--<div>
					<button type="button" id="minus100">-100</button>
					<button type="button" id="minus1000">-1000</button>
					<button type="button" id="minus10000">-10000</button>
					<button type="button" id="plus10000">+10000</button>
					<button type="button" id="plus1000">+1000</button>
					<button type="button" id="plus100">+100</button>					
				</div> -->
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
	   /*
	   $.ajax({
			url : '<c:url value="/board/report.do" />',
			type:'POST',
			dataType: "text",
			data:{'${_csrf.parameterName}':'${_csrf.token}', auction_no:${list.auction_no}},
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
		});
	   
	   */
	   var isreport = $(this).attr("title");
	   
	   console.log(isreport)
	   if(isreport == 0){
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
		   
		   $(this).attr("title", 1);
		   
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

   });
</script>
