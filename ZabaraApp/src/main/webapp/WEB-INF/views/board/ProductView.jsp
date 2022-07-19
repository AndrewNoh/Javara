<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- ======= Portfolio Details ======= -->
  
<style>
.contact .php-email-form{
    background: rgb(255 255 255 / 0%);
}
</style>
   <div id="portfolio-details" class="portfolio-details contact">
      <div class="container">

        <div class="row">

          <div class="col-lg-8">
            <h2 class="portfolio-title">${list.title}</h2>

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
                  <a href="javascript:void(0);" id="edit"><i class="bx bxs-edit" title="수정"></i></a>
                  <a href="javascript:void(0);" id="delete"><i class="bx bxs-trash " title="삭제"></i></a>
                  <a href="<c:url value="/board/auctuonlist.do"/>"><i class="bx bxs-angry" title="신고"></i></a>
               </div>
            </c:if>
            <c:if test="${isWriter}">
	            <div style="float:right;">
	            	<span>
						<select name="status">
							<option value="END" <c:if test="${list.status == 'END'}">selected</c:if>>판매 완료</option>
							<option value="RESERVE" <c:if test="${list.status == 'RESERVE'}">selected</c:if>>예약</option>
							<option value="SALE" <c:if test="${list.status == 'SALE'}">selected</c:if>>판매중</option>
						</select>
					</span>
					<button id="statusChange">확인</button>
            	</div>				
				<br/>
			</c:if>
			
            <div  style="text-align: right;">
            <div>${list.nickName}</div>
               <i class="bi bi-calendar3"></i> ${list.postDate}
            </div>
            <div class="mb-4">${list.category}</div>
            <div class="mb-5">
               <p>가격 : ${list.price}\</p>
            </div>
            <div class="mb-5">
               <p>${list.content}</p>
            </div>
            <div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
                <a href="#"><i class="bx bxs-like ml-3" ></i>${list.likes}</a>
            </div>
      
            <div class="text-center">
              <a href="<c:url value="/board/productedit.do"/>"><i class="bx bx-list-ul" title="리스트보기" style="font-size: 50px"></i></a>
              <a href="<c:url value="/chat/chatting.do">
               <c:param value="${list.townlist_no == null ? 0 : list.townlist_no}" name="townlist_no"/>
               <c:param value="${list.auction_no == null ? 0 : list.auction_no}" name="auction_no"/>
               <c:param value="${list.product_no == null ? 0 : list.product_no}" name="product_no"/>
               <c:param value="${list.userNo}" name="wirteuserno"/><c:param value="${list.nickName}" name="wirtenickName"/>
               </c:url>"><i class="bx bxs-chat mx-5" title="채팅" style="font-size: 50px"></i></a>
              <a href="#"style="font-size: 50px"><i class="bx bxs-book-heart ml-3" ></i></a>
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
      
                   <div class="col-lg-4 portfolio-info ">
                     <div class="content">
                     <div class="custom-select form-group mt-3 mt-md-0">
                         <select name="category">
                            <option selected value="기타">제품카테고리</option>
                            <option value="가전">가전</option>
                            <option value="가구">가구</option>
                            <option value="생활용품">생활용품</option>
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
                        <button class="col-4 m-2 btn btn-outline" type="button" id="submit">수정</button>
                        <button class="col-4 m-2 btn btn-outline" type="button" id="cancle">취소</button>
                     </div>
                     <input type="hidden" name="board" value="중고물품"/>
                     <input type="hidden" name="no" value="${param.no}"/>
                      </div>
                 </div>
               </div>
         </form>
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
      
      
   });
   
   $('#edit').on("click", function(){
      $('#portfolio-details').hide();
      $('#editDiv').show();
      
   });   
   
   $('#cancle').on("click", function(){
      $('#portfolio-details').show();
      $('#editDiv').hide();
   });   
   
   $('#goList').on("click", function(){
      parent.location.reload();
   });   
   
   $('#submit').on("click", function(){
      var formData = new FormData($('#editForm')[0]);
      $.ajax({
         type: "POST",
         enctype: 'multipart/form-data',   // 필수
         url: '<c:url value="/board/edit.do"/>',
         data: formData,      // 필수
         processData: false,   // 필수
         contentType: false,   // 필수
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
             alert("이미지는 5장까지만 등록 가능합니다.");
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
   
   $('#statusChange').on("click", function(){
		var value = $('[name=status]').val();
		
		$.ajax({
			url : '<c:url value="/board/changeStatus.do" />',
			type:'POST',
			dataType: "text",
			data:{'${_csrf.parameterName}':'${_csrf.token}', product_no:${list.product_no}, board:"중고물품", status:value},
		}).done(function(data){
			console.log(data + " : " + value)
			if(data == 1){
				console.log("들어감")
			}			
		});
	});
</script>