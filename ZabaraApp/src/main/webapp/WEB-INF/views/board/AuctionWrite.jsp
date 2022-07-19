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

</style>

<div id="portfolio-details" class="contact">
    
	<div class="container">

		<form action="<c:url value="/board/write.do"><c:param name="board" value="경매"/></c:url>" method="post" role="form" class="mt-4" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="row">
	        	<h2 class="portfolio-title"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title"></h2>
	        	<div class="col-lg-8 pb-3">
	        		<div class="portfolio-details-slider swiper" style="background-color: #ffffff21; text-align: center;">
						
						<div style="height: 400px; line-height: 400px;" id="previewImage">
							<p id="p">사진을 넣어주세요.</p>
						</div>
						<div style="height: 200px; line-height: 200px;" id="images">
							
						</div>
						
						<div class="custom-file mb-3">
							<input type="file" multiple="multiple" class="custom-file-input" id="customFile" name="filename"> 
							<label class="custom-file-label" for="customFile">파일 선택</label>
						</div>

	            	</div>
	          	</div>
	
	          	<div class="col-lg-4 custom-form " style="margin-bottom: 15px;">
	            	<div class="content">
	            		<h6>제품 카테고리</h6>
						<div class="custom-select form-group mt-0 mt-md-0 mb-3">
					 		<select name="category">
					    		<option selected value="기타">기타</option>
					    		<option value="가전">가전</option>
					    		<option value="가구">가구</option>
					    		<option value="생활용품">생활용품</option>
					  		</select>
						</div>
						
						<h6>경매 종료일</h6>
						<div class="custom-select form-group mt-0 mt-md-0">							
					 		<select name="enddate">					 			
					    		<option selected value="1">1일(24시간)</option>
					    		<option value="2">2일(48시간)</option>
					    		<option value="3">3일(72시간)</option>
					    		<option value="4">4일(96시간)</option>
					    		<option value="5">5일(120시간)</option>
					  		</select>
						</div>
						
						<div class="my-3">
							<p>가격</p>
							<input type="text" class="form-control" placeholder="가격을 입력하세요" name="price">
						</div>
						<div class="mt-3 mb-5">
							<p>내용</p>
							<textarea class="form-control" rows="5" name="content"></textarea>
						</div>
						<div class="text-center col ">
							<button class="col-4 m-2 btn btn-outline" type="submit">글쓰기</button>
							<button class="col-4 m-2 btn btn-outline"type="submit">목록</button>
						</div>
	          		</div>
	        	</div>
	      	</div>
		</form>
	</div>
</div>
<!-- End #main -->


</body>

<script type="text/javascript">
	
	
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
	

	
							
</script>