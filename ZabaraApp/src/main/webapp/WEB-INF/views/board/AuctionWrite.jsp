<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
</style>

<div id="portfolio-details" class="contact">
    
	<div class="container">

		<form action="<c:url value="/board/write.do"><c:param name="board" value="경매"/></c:url>" method="post" role="form" class="mt-4" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="row">
	        	<h2 class="portfolio-title"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" required="required"></h2>
	        	<div class="col-lg-8 pb-3">
	        		<div class="portfolio-details-slider swiper contents" style="text-align: center; ">
						
						<div style="height: 400px; line-height: 400px; border-radius: 15px;" id="previewImage" class="contents mb-5">
							<p id="p">사진을 넣어주세요.</p>
						</div>
						<div style="height: 200px; line-height: 200px; border-radius: 15px;" id="images" class="contents my-3">
							
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
						
						<h6 style="font-weight: bold; color:#000">판매주소 선택(선택사항)</h6>
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
<!-- End #main -->


</body>

<script src="${pageContext.request.contextPath}/resources/assets/js/LSscript.js"></script>
<script type="text/javascript">

var geocoder = new daum.maps.services.Geocoder();
	
	function readMultipleImage(input) {	
		const previewImage = $('#previewImage');
		const images = document.getElementById('images');
				
	    if(input.files) {
	    	const fileArr = Array.from(input.files);
	    	var i = $('#previewImage > img').length;
	    	
	    	if(fileArr.length > 5){
	    		alert("이미지는 5장까지만 등록 가능합니다.");
	    		return;
	    	}	    	
	    	
			fileArr.forEach((file, index) => {
				const reader = new FileReader();
				const img = document.createElement('img');
				const little = document.createElement('img');
				
				previewImage.append(img);
				
				$('#previewImage > img:eq('+i+')').css("width", "auto").css("height", "100%");
				
				
				
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
				
				$('#images > img:eq('+i+')').css("height", "auto");
				$('#images > img:eq('+i+')').css("width", "20%");
				
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
	
	$('#previewImage').on("click", function(){
		$('#customFile').trigger("click");
	});
	
	$('#goList').on("click", function(){
		 window.location.href = "<c:url value='/board/auctionlist.do'/>";
	});
	
	function daumAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            geocoder.addressSearch(addr, function(results, status) {
	                if (status === daum.maps.services.Status.OK) {
	                   var result = results[0];
	                   $('#latitude').val(result.y);
	                   $('#longitude').val(result.x);                   
	                }
	             });
	           	 document.getElementById("address").value = addr;
	            $('#nextBtn').focus();
	        }
	    }).open();
	}
</script>