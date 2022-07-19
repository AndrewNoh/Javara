<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>


</style>
<div id="portfolio-details" class="contact">
    
    <div class="container">

     
      <form action="forms/contact.php" method="post" role="form" class="php-email-form mt-4">
	  <div class="row">
          <h2 class="portfolio-title"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title"></h2>
          <div class="col-lg-8 pb-3">
            <div class="portfolio-details-slider swiper" style="background-color: #ffffff21; text-align: center;">
				<img style="height: 600px; line-height: 600px; " id="previewImage">사진을 넣어주세요</img>
					<div class="custom-file mb-3">
					<input type="file" class="custom-file-input" id="customFile" name="filename"> 
						<label class="custom-file-label" for="customFile">사진을 넣어주세요</label>
	                  <script type="text/javascript">
	                     function readImage(input) {
	                         if (input.files && input.files[0]) {
	                             const reader = new FileReader();
	                             
	                             reader.onload = (e) => {
	                                 const previewImage = document.getElementById('previewImage');
	                                 previewImage.src = e.target.result;
	                             }
	                             reader.readAsDataURL(input.files[0]);
	                         }
	                     }
	                     document.getElementById('customFile').addEventListener('change', (e) => {
	                         readImage(e.target);
	                     })
	                  </script>
					</div>
            </div>
          </div>

          <div class="col-lg-4 portfolio-info ">
            <div class="content">
				<div class="custom-select form-group mt-3 mt-md-0">
				  <select>
				    <option selected>제품카테고리</option>
				    <option value="volvo">가전</option>
				    <option value="fiat">가구</option>
				    <option value="audi">생활용품</option>
				  </select>
				</div>
				<div class="mt-3 mb-5">
					<p>내용</p>
					<textarea class="form-control" rows="5" name="content"></textarea>
				</div>
				<div class="text-center col ">
					<button class="col-4 m-2 btn btn-outline" type="submit">수정</button>
					<button class="col-4 m-2 btn btn-outline"type="submit">취소</button>
				</div>
          </div>
        </div>
      </div>
      </form>
    </div>
<!-- End #main -->



</body>