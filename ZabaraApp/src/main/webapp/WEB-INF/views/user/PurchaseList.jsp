<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
<!-- ======= About Me ======= -->
<style>
i {
   font-size: 30px;
}
/* 

Designed & Developed by Bhimo Alkautsar
No license, 100% free to use.

*/
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@500;700&display=swap");
*,
*::before,
*::after {
  border: 0;
  margin: 0;
  padding: 0;
  outline: 0;
  box-sizing: border-box;
  font-size: 100%;
  font-style: inherit;
  font-weight: inherit;
  font-family: inherit;
}


.text-bold {
  font-weight: 700;
}

.wrapper {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  max-height: 600px;
  filter: blur(0.2px);
  height: 90vh;
  max-width: 500px;
  width: 90%;
}
.wrapper::before, .wrapper::after {
  content: "";
  position: absolute;
  filter: blur(1px);
  border-radius: 50%;
}
.wrapper::before {
  width: 150px;
  height: 150px;
  top: 45px;
  right: -30px;
  background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
}
.wrapper::after {
  width: 300px;
  height: 300px;
  bottom: -100px;
  left: -100px;
  background: linear-gradient(90deg, #FC466B 0%, #3F5EFB 100%);
}

.card {
  position: relative;
  padding: 48px 24px;
  z-index: 4;
  margin-left: 36%;
  height: auto;
  max-width: 500px;
  width: 90%;
  overflow-x: hidden;
  overflow-y: auto;
  border-radius: 20px;
  background:rgb(125 125 125 / 53%);
  box-shadow: 0 15px 35px rgb(181 179 179 / 50%);
  border: 2px solid rgba(255, 255, 255, 0.3);
}
.card .header {
  margin-bottom: 32px;
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card .header .title {
  font-size: 24px;
}
.card .header .rating {
  display: flex;
  align-items: center;
  flex-direction: row-reverse;
  gap: 2px;
}
.card .header .rating .fa-star {
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  opacity: 0.6;
  transition: 0.75s cubic-bezier(0.55, 0, 0.1, 1);
}
.card .header .rating .stars {
  width: 0;
  height: 0;
}
.card .header .rating .stars:checked + .fa-star,
.card .header .rating .stars:checked + .fa-star + .stars + .fa-star,
.card .header .rating .stars:checked + .fa-star + .stars + .fa-star + .stars + .fa-star,
.card .header .rating .stars:checked + .fa-star + .stars + .fa-star + .stars + .fa-star + .stars + .fa-star,
.card .header .rating .stars:checked + .fa-star + .stars + .fa-star + .stars + .fa-star + .stars + .fa-star + .stars + .fa-star {
  color: #f7bb00;
  opacity: 1;
  filter: drop-shadow(0 0 10px rgba(247, 255, 0, 0.5));
}
.card .content .input-group + .input-group {
  margin-top: 12px;
}
.card .content .input-group {
  position: relative;
  width: 100%;
}
.card .content .input-group .input-text, .card .content .input-group .textarea {
	font-size: 16px;
	position: relative;
	width: 100%;
	background: rgb(11 11 13 / 60%);
	border-radius: 8px;
	border: 2px solid transparent;
	color: #fff;
	transition: 0.75s ease;
	padding: 18px 12px;
}
.card .content .input-group .input-text:focus, .card .content .input-group .textarea:focus {
  border-color: #2f5dd7;
  filter: drop-shadow(0 0 2px #2f5dd7);
}
.card .content .input-group .input-text:focus + .input-placeholder,
.card .content .input-group .textarea:focus + .textarea-placeholder {
  top: 6px;
  font-size: 10px;
  color: #3597ec;
  transition: 0.1s ease;
  opacity: 1;
}
.card .content .input-group .input-text:valid + .input-placeholder,
.card .content .input-group .textarea:valid + .textarea-placeholder {
  opacity: 0;
  transition: 0.75s ease;
}
.card .content .input-group .input-placeholder, .card .content .input-group .textarea-placeholder {
  position: absolute;
  font-size: 14px;
  top: 20px;
  left: 14px;
  color: #fff;
  letter-spacing: 0.1mm;
  opacity: 0.8;
  transition: 0.1s ease;
  cursor: auto;
}
.card .content .input-group .textarea {
  height: 140px;
  resize: none;
  padding: 18px 12px;
}
.card .content .upload-submit {
  display: flex;
  align-items: center;
}
.card .content .upload-submit .file-upload {
  width: 65%;
  padding: 14px;
  letter-spacing: 0.4mm;
  font-size: 14px;
  background: rgba(15, 17, 23, 0.6);
  border: 2px solid transparent;
  border-radius: 8px;
  margin-right: 16px;
  cursor: pointer;
  justify-content: center;
}
.card .content .upload-submit .file-upload input {
  display: none;
}
.card .content .upload-submit .file-upload .custom-upload {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 12px;
  opacity: 0.8;
}
.card .content .upload-submit .file-upload .custom-upload .fa-camera {
  margin-top: 1px;
}
.card .content .upload-submit .file-upload:hover, .card .content .upload-submit .file-upload:focus {
  transition: 0.2s ease;
  border-color: #2f5dd7;
  filter: drop-shadow(0 0 2px #2f5dd7);
}
.card .content .upload-submit .file-upload:hover > .custom-upload, .card .content .upload-submit .file-upload:focus > .custom-upload {
  opacity: 1;
}
.card .content .upload-submit .btn-submit {
  display: flex;
  color: #fff;
  align-items: center;
  letter-spacing: 0.4mm;
  justify-content: space-between;
  background: #eec341;
  transition: 0.75s ease;
  border: 2px solid transparent;
  font-size: 14px;
  padding: 14px 20px;
  cursor: pointer;
  width: 27%;
  transition: 0.2s ease;
  border-radius: 8px;
  margin-left: 73%;
  margin-top: 10px;
}
.card .content .upload-submit .btn-submit:hover, .card .content .upload-submit .btn-submit:focus {
  filter: drop-shadow(0 0 4px #2f5dd7);
}
.card .content .upload-submit .btn-submit .fa-arrow-right {
  margin-top: 1px;
  animation: arrow-right 0.7s infinite;
}
.card .line-break {
  margin: 48px 0;
  width: 100%;
  height: 4px;
  border-radius: 2px;
  background: rgba(255, 255, 255, 0.3);
}
.card .other-review + .other-review {
  margin-top: 12px;
}
.card .other-review {
  position: relative;
  width: 100%;
  background: rgba(15, 17, 23, 0.6);
  padding: 28px 14px;
  border-radius: 10px;
  justify-content: space-between;
  display: flex;
  gap: 14px;
}
.card .other-review .profile-picture {
  position: relative;
  width: 45px;
  height: 45px;
  border-radius: 50%;
  overflow: hidden;
}
.card .other-review .profile-picture img {
  height: 45px;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
}
.card .other-review .review-detail {
  position: relative;
  flex: 1;
}
.card .other-review .review-detail .review-name {
  display: flex;
  justify-content: space-between;
  margin: 4px 0 2px 0;
}
.card .other-review .review-detail .review-name .full-name {
  max-width: 260px;
  font-size: 14px;
}
.card .other-review .review-detail .review-name .action .action-list-open {
  list-style: none;
}
.card .other-review .review-detail .review-name .action .action-list-open .fa-ellipsis-h {
  cursor: pointer;
  position: relative;
  z-index: 10;
}
.card .other-review .review-detail .review-name .action .action-list-open::-webkit-details-marker {
  display: none;
}
.card .other-review .review-detail .review-name .action .action-list {
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
  z-index: 9;
  right: 0;
  top: 25px;
  border-radius: 4px;
  position: absolute;
  width: 100px;
  background: rgba(15, 17, 23, 0.6);
  transform-origin: top right;
  display: flex;
  flex-direction: column;
  padding: 8px;
}
.card .other-review .review-detail .review-name .action .action-list-item {
  padding: 8px;
  display: block;
  border-radius: 2px;
  font-size: 12px;
  cursor: pointer;
}
.card .other-review .review-detail .review-name .action .action-list-item:hover:nth-child(1) {
  background: #2f5dd7;
  transition: 0.5s ease;
}
.card .other-review .review-detail .review-name .action .action-list-item:hover:nth-child(2) {
  background: #b84b95;
  transition: 0.5s ease;
}
.card .other-review .review-detail .review-name .action[open] .action-list {
  animation: scale 0.25s ease;
}
.card .other-review .review-detail .review-date {
  font-size: 12px;
  opacity: 0.7;
}
.card .other-review .review-detail .review-rating {
  margin: 6px 0 28px 0;
  display: flex;
  color: #fff;
  font-size: 10px;
  gap: 2px;
}
.card .other-review .review-detail .review-rating .yellow-star {
  color: #f7bb00;
  filter: drop-shadow(0 0 5px rgba(247, 255, 0, 0.5));
}
.card .other-review .review-detail .review-comment {
  font-size: 12px;
  max-width: 260px;
  line-height: 5mm;
}
.card .other-review .review-detail .review-image {
  margin-top: 28px;
  display: flex;
  gap: 14px;
  align-items: center;
  flex-wrap: wrap;
}
.card .other-review .review-detail .review-image .img-wrapper {
  cursor: pointer;
  position: relative;
  border-radius: 5px;
  width: 80px;
  height: 80px;
  overflow: hidden;
}
.card .other-review .review-detail .review-image .img-wrapper img {
  position: absolute;
  height: 80px;
  top: 50%;
  transform: translateY(-50%);
}

@keyframes arrow-right {
  0% {
    transform: translateX(0);
  }
  25% {
    transform: translateX(3px);
  }
  25% {
    transform: translateX(5px);
  }
  75% {
    transform: translateX(3px);
  }
  to {
    transform: translateX(0);
  }
}
@keyframes scale {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
::-webkit-scrollbar {
  width: 10px;
}

::-webkit-scrollbar-thumb {
  background: rgba(21, 20, 26, 0.55);
  border-top: 24px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 24px solid transparent;
  background-clip: padding-box;
}

.modal-backdrop.show{
	opacity: .7;
}
</style>
<div id="services" class="services neonborder m-5">
   <div class="container">

      <div class="section-title">
         <h2>나의 활동</h2>
         <p>구매내역</p>
      </div>

   
   <div id="portfolio" class="portfolio  m-5">   
         <c:if test="${empty record}" var="LIST">
            <!-- 게시글들 -->
              <div class="row portfolio-container">         
               <div class="col-12 portfolio-item filter-app">
                   <div class="portfolio-wrap d-flex justify-content-center">
                         <h4>게시글이 없습니다.</h4>
                    </div>
                </div>
             </div>
         </c:if>
               
         <c:if test="${!LIST}">
            <div class="row portfolio-container" id="list">
               <!-- 게시글 한블럭 -->
               <c:forEach var="record" items="${record}" varStatus="loop">
                   <div class="col-lg-4 col-md-6 portfolio-item filter-${record.category}">
                       <div class="portfolio-wrap">
                          <c:forEach var="i" begin="${loop.index}" end="${loop.index}">
                             <c:if test="${!empty imageList[i][0].imageName}" var="haveImage">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i][0].imageName}" style="width: 100%; height:100%;" class="img-fluid" alt="">
                           </c:if>
                           <c:if test="${! haveImage}">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/zabara.png" style="width: 100%; height:100%;" class="img-fluid" alt="">
                             </c:if>
                        </c:forEach>
                          <div class="portfolio-info">
                             <h4>${record.title}</h4>
                               <p>시작가 <fmt:formatNumber value="${record.base_Price}" pattern="#,###"/>원</p>
                              <p style="color:#FFC107">현재가 <fmt:formatNumber value="${record.upper_Price}" pattern="#,###"/>원</p>                                                                                 
                              <div class="portfolio-links">
                                 <a href="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[loop.index][0].imageName}" data-gallery="portfolioGallery" class="portfolio-lightbox"><i class="bx bxs-photo-album"></i><span style="font-size: 12px; display: block;">사진보기</span></a>
                                  <a href="<c:url value="/board/auctionview.do"><c:param value="${record.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bxs-detail"></i><span style="font-size: 12px; display: block;">상세보기</span></a>
                                  <a href="#" data-toggle="modal" onClick="review(${record.auction_no})"  data-target="#modalReview" ><i class="bi bi-brush" id="reviewWirte"></i><span style="font-size: 12px; display: block;">후기작성</span></a>
                              </div>
                              <p>종료예정일 ${record.endDate}</p>
                         </div>
                      </div>
                  </div>  
               </c:forEach>            
            </div>                 
            <!-- 게시글 한블럭 -->
            
            <!-- 거래후기 모달 -->
               <div class="modal" id="modalReview">
                        <div class="card">
                            <form >
                                <div class="header">
                                    <h1 class="title text-bold">거래후기</span></h1>
                                    <div class="rating">
                                        <input type="radio" name="stars" id="rate-5"  value="5" class="stars">
                                        <label style="font-size: 24px;" for="rate-5" class="fa fa-star"></label>
                                        <input type="radio" name="stars" id="rate-4"  value="4" class="stars">
                                        <label style="font-size: 24px;" for="rate-4" class="fa fa-star"></label> 
                                        <input type="radio" name="stars" id="rate-3"  value="3" class="stars">
                                        <label style="font-size: 24px;" for="rate-3" class="fa fa-star"></label> 
                                        <input type="radio" name="stars" id="rate-2"  value="2" class="stars">
                                        <label style="font-size: 24px;" for="rate-2" class="fa fa-star"></label> 
                                        <input type="radio" name="stars" id="rate-1"  value="1" class="stars">
                                        <label style="font-size: 24px;" for="rate-1" class="fa fa-star"></label> 
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="input-group">
                                        <textarea name="review" id="textarea" class="textarea" value="textarea" placeholder="후기를 입력하세요" required></textarea>
                                    </div>
                                    <div class="input-group upload-submit">
                                        <button type="button" class="btn-submit" id="formSubmit"><span class="text-bold">후기전송</span><span class="fa fa-arrow-right"></span></button>
                                    </div>
                                </div>
                            </form>
                   </div><!-- /.modal-dialog -->
              </div>
            <div class="row" id="more">
               <input type="hidden" value="모두" id="category"/>
               <input type="hidden" value="${nowpage}" id="nowpage" name="nowpage"/>
               <input type="hidden" value="${endpage}" id="endpage" name="nowpage"/>
            </div>
          </c:if>
   </div>
</div>
<script type="text/javascript">
   
   var ano;
   function review(auction_no){
      ano=auction_no;
      console.log(ano);
      $('textarea[name=review]').val('');
      $('input[name=stars]:checked').prop('checked',false);
      
   };
   //거래후기
   $("#formSubmit").click(function() {
      var text = $('textarea[name=review]').val();
      var star = $('input[name=stars]:checked').val();
       $.ajax(
               {
                  type : "POST",
                  url: '<c:url value="/mypage/review.do"/>',
                  data:{'${_csrf.parameterName}' : "${_csrf.token}",
                      'auctionNo': ano,
                      'text' : text,
                      'star' : star    
                  },
                  success: function(result){
                     if(result == 1){
                       const Toast = Swal.mixin({
                           toast : true,
                           position : 'center-center',
                           showConfirmButton : false,
                           timer : 1800,
                           timerProgressBar : true,
   
                        })
   
                        $('#reviewWirte').trigger("click");
                        $(".modal-backdrop").remove();
                        
                        Toast.fire({
                           icon : 'success',
                           title : '후기작성이 완료되었습니다.'
                        })
                     }
                  }
               }
            )
    });



   $('#portfolio-flters > li').on("click", function(){
      $('#category').val($(this).text());
   });
   
   $('#next').on("click", function(){
      var nowpage = parseInt($('#nowpage').val());
      var endpage = parseInt($('#endpage').val());
      
      if(nowpage != endpage){
         nowpage++;
         
         $('#nowpage').val(nowpage);
         console.log($('#nowpage').val());
         $('form').submit();
      }
      
      console.log($('#nowpage').val());
                  
   });
   
   $('#prev').on("click", function(){
      if($('#nowpage').val() != 1){
         $('#nowpage').val($('#nowpage').val() - 1);
         console.log('이전페이지');
         $('form').submit();
      }
      
      console.log('이전페이지');
   });
   
   $('[name=like]').on("click", function(){
      var like = $(this);
      $.ajax({
         url :'<c:url value="/board/likeUp.do"/>',
         type:'POST',
         dataType: "text",
         data:{'${_csrf.parameterName}':'${_csrf.token}', no:$(this).data("value"), board:"경매"},
      }).done(function(data){
         if (data != 1) {
            like.children().css("color", "#18d26e");
         } else {
            console.log("좋아요 해제")
            like.children().css("color", '');
         }
      });
      
   });
   
   $(document).ready(function(){      
      $.each(${likes}, function(index, value){
         console.log("좋아요 : " + value);
         $('a[data-value="'+value+'"]').children().css('color', '#18d26e');
      });
      
      var nowpage = parseInt($('#nowpage').val());
      var endpage = parseInt($('#endpage').val());
      
      if(nowpage == 1){
         $('#prev').hide();
      }
      
      if(nowpage == endpage){
         $('#next').hide()   
      }
      
   });
   
</script>