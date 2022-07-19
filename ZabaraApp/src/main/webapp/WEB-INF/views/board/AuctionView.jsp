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
                  <a href="<c:url value="/board/report.do"/>"><i class="bx bxs-angry" title="신고"></i></a>
               </div>
            </c:if>
            <div style="text-align: right;">
            <div>${list.nickName}</div>
               <i class="bi bi-calendar3"></i> ${list.postDate}
            </div>
            <div class="mb-4">${list.category}</div>
            <div class="mb-5">
               <p>시작가 : ${list.base_Price}\</p>
               <p>현재 최고가 : ${list.upper_Price}\</p>
            </div>
            <div class="mb-5">
               <p>${list.content}</p>
            </div>
            
            <c:if test="${isWriter}">
               <div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
                  <button class="btn btn-success btn-block" data-toggle="modal" data-target="#bidUI">경매종료 및 낙찰</button>
               </div>
            </c:if>
            <c:if test="${!isWriter}">
               <div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
                   <button class="btn btn-success btn-block" data-toggle="modal" data-target="#bidUI">입찰하기</button>
               </div>
            </c:if>
            
            <div style="text-align: center; font-size: 20px; margin-bottom: 15px;">
                <a href="#"><i class="bx bxs-like ml-3" ></i>${list.likes}</a>
            </div>
      
            <div class="text-center">
              <a href="<c:url value="/chat/chatting.do">
              <c:param value="${list.townlist_no == null ? 0 : list.townlist_no}" name="townlist_no"/>
              <c:param value="${list.auction_no == null ? 0 : list.auction_no}" name="auction_no"/>
              <c:param value="${list.product_no == null ? 0 : list.product_no}" name="product_no"/>
              <c:param value="${list.userNo}" name="wirteuserno"/><c:param value="${list.nickName}" name="wirtenickName"/></c:url>"><i class="bx bxs-chat mx-5" title="채팅" style="font-size: 50px"></i></a>
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
                     <input type="hidden" name="board" value="경매"/>
                     <input type="hidden" name="no" value="${param.no}"/>
                      </div>
                 </div>
               </div>
         </form>
      </div>
   </div>
   
   <!-- 채팅 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
    <!-- ======= Chat Details ======= -->
    <div class="neonborder m-5" id="chatUi">
       <div class="container">
         <div class="section-title">
              <h2>채팅</h2>
            </div>
         <div class="messaging ">
            <div class="inbox_msg">
               <div class="inbox_people">
                  <div class="css-1r0o66s">
                     <div class="chat-header-profile">
                        <img class="chat-header-image" src="https://ptetutorials.com/images/user-profile.png" alt="대화상대아이디">
                        <div class="main-title" >
                           <input type="hidden" id="nickname" name="nickname" value="${userNickname.nickname }"/>${userNickname.nickname }
                           <span class="temperature">37.6°C</span>
                        </div>
                     </div>
                  </div>
               </div>
         
         
               <div class="mesgs">
                  <div class="msg_history">
                     <div class="incoming_msg">
                        <div id="chatMessage">
                           <div class="css-1r0o66s">
                              <div class="chat-header-profile">
                                 <c:if test="${userNickname.nickname ne wirtenickName }" var="chatuser">
                                    <img class="chat-header-image" src="https://ptetutorials.com/images/user-profile.png" alt="대화상대아이디">
                                    <div class="main-title" id="usernicname"><span>${wirtenickName}</span>
                                       <span class="temperature">37.6°C</span>
                                    </div>
                                 </c:if>
                              </div>
                              <div class="css-1idbtsb" id="chatmenutoggle">
                                  <div class="more-button-wrapper common-bg-hover">
                              <svg width="4" height="16" viewBox="0 0 4 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 3.19998C2.7152 3.19998 3.3002 2.61498 3.3002 1.89998C3.3002 1.18498 2.7152 0.599976 2.0002 0.599976C1.2852 0.599976 0.700195 1.18498 0.700195 1.89998C0.700195 2.61498 1.2852 3.19998 2.0002 3.19998Z" fill="currentColor"></path>
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 6.70001C1.2852 6.70001 0.700195 7.28501 0.700195 8.00001C0.700195 8.71501 1.2852 9.30001 2.0002 9.30001C2.7152 9.30001 3.3002 8.71501 3.3002 8.00001C3.3002 7.28501 2.7152 6.70001 2.0002 6.70001Z" fill="currentColor"></path>
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M2.0002 12.8C1.2852 12.8 0.700195 13.385 0.700195 14.1C0.700195 14.815 1.2852 15.4 2.0002 15.4C2.7152 15.4 3.3002 14.815 3.3002 14.1C3.3002 13.385 2.7152 12.8 2.0002 12.8Z" fill="currentColor"></path>
                              </svg>
                              </div>
                                 <div class="option-container" id="chatmenuToggleDiv" style="display:none">
                                    <div type="button" id="chatOff">돌아가기</div>
                                    <div class="option-item common-bg-hover">알림음 끄기</div>
                                    <div class="option-item common-bg-hover">대화상대 차단하기</div>
                                    <div class="option-item common-bg-hover">채팅방 나가기</div>
                                 </div>
                              </div>
                           </div>
                            <a href="<c:url value="/board/productview.do"><c:param value="${auction_no}" name="no"/></c:url>" rel="lytebox[vacation]" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details">
                           
                           <div class="reserved-wrapper common-bg-hover" >
                              <img class="article-image" src="${pageContext.request.contextPath}/resources/assets/img/portfolio/portfolio-1.jpg" alt="제목">
                              <div class="reserved-main">
                                 <div>제목</div>
                                 <div class="reserved-price">가격</div>
                              </div>
                              <div><span class="reserve-button closed">거래완료</span></div>
                           </div>
                           
                           </a>
                        </div>
                     </div>
                  </div>
                  <form  class="type_msg" method="post" action="<c:url value="/chat/chatting.do"><c:param value="${auction_no}" name="auction_no"/><c:param value="${wirteuserno}" name="wirteuserno"/></c:url>">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                     <div class="input_msg_write d-flex ">
                        <a href="#"><i class="bi bi-geo-alt m-1" style="float: left; font-size: 35px;"></i></a>
                        <a type="button" id="imgtoggle" onclick="onclick=document.all.customFile.click()"><i class="bi bi-plus-square m-1" style="float: left; font-size: 35px;"></i></a> 
                        <input type="file" id="customFile" style="display:none"> 
                        <input type="text" class="write_msg" placeholder="메시지를 입력하세요" id="chatcontent" name="chatcontent"/>
                        <a href="#" id="send"><i class="bi bi-send" aria-hidden="true"  style="float: right; font-size: 35px;"></i></a>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   
<div class="modal fade" id="bidUI" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="position: fixed; top:25%; color:black">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">입찰</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>        
         </div>
         <div class="modal-body">
            <div>
               <p id="upperPriceBid" title="${list.upper_Price}">현재 최고가 : ${list.upper_Price}\</p>               
            </div>
            
            
            <div>
               <label>입찰 가격 입력</label>
               <input type="text" id="inputBidPrice"/>
               
               <button type="button" id="doBid">입찰</button>
            </div>
            <br/>
            <!-- 
            <div>
               
               <button type="button" id="minus100">-100</button>
               <button type="button" id="minus1000">-1000</button>
               <button type="button" id="minus10000">-10000</button>
               <button type="button" id="plus10000">+10000</button>
               <button type="button" id="plus1000">+1000</button>
               <button type="button" id="plus100">+100</button>
               
            </div>
             -->
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
   
   $('#chatting').on("click", function(){
      $('#portfolio-details').hide();
      $('#editDiv').hide();
      $('#chatUi').show();
   });
   
   $('#chatOff').on("click", function(){
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
   
   $('#bid').on("click", function(){
      console.log("클릭됨")
      $('#bidUI').show();
   });
   
   $('#doBid').on("click", function() {
      upperprice = $('#upperPriceBid').attr('title');
      newprice = $('#inputBidPrice').val();
      console.log(upperprice - newprice)
      
      if(upperprice - newprice >= 0) {
         alert('입찰가격은 현재 최고가보다 높아야합니다.');
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
   
   
   //채팅
   var today = new Date();   
   
   var wsocket;
   //닉 네임 저장용
   var nickname='${userNickname.nickname }';
   //입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
   //$('#toggle').one('click',function(){
      wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chat-ws.do/${roomno}'/>");//192.168.219.101//192.168.0.129
      console.log('wsocket:',wsocket);
      //서버와 연결된 웹 소켓에 이벤트 등록
      wsocket.onopen = open;
      wsocket.onclose=function(){
         appendMessage("연결이 끊어 졌어요");
      };
      wsocket.onmessage=receive;
      wsocket.onerror=function(e){
         console.log('에러발생:',e)
      }
   //});
   //서버에 연결되었을때 호출되는 콜백함수
   function open(){
      appendMessage("<div style='text-align: center; margin-top:5px;'>"+today.toLocaleDateString()+"</div><br/>");
   }
   //서버에서 메시지를 받을때마다 호출되는 함수 
   function receive(e){//e는 message이벤트 객체
      //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
      if(e.data.substring(0, 12) ==='서버로부터받은 메시지:'){
         
         
         
         console.log(e.data);
         appendMessage("<div class='outgoing_msg'><div class='incoming_msg_img'><img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'></div>"
         +"<div class='received_msg'><div class='received_withd_msg'>"+nickname+"<p>"+e.data.substring(12)+"<br/></p></div><span style='float: left;font-size: small; margin-top:5px;'>"
         +today.toLocaleTimeString()+"</span></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
      }
         
   }
   function appendMessage(msg){
      
      $('#chatMessage').append(msg);
      $('#chatMessage').scrollTop($('#chatMessage').prop('scrollHeight'));
      $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
   }
   
   $('#chatcontent').on('keypress',function(e){
      if(e.keyCode===13){//엔터 입력
         $('#send').trigger("click");
         
      }
   });
   
      $('#send').on('click',function(){
         
         var form1 = $("#form").serialize();
         $.ajax({
            url: '<c:url value="/chat/chatting.do"><c:param value="${list.nickName}" name="wirtenickName"/><c:param value="${product_no}" name="product_no"/><c:param value="${townlist_no}" name="townlist_no"/><c:param value="${auction_no}" name="auction_no"/><c:param value="${wirteuserno}" name="wirteuserno"/></c:url>',
            data: {chatcontent:$('#chatcontent').val(),
                  senduserno:${userno},
                  unread_count:'1',
                  sendtime: today.toLocaleTimeString('en-US'),
                  '${_csrf.parameterName}':'${_csrf.token}'},
            type: 'POST',
            dataType: 'text',
            success: function (result) {
               console.log(result)
            },
            error: function () {
               console.log('error')
            }
            
         });
         
         
         console.log('보낸 메시지:',$('#chatcontent').val());
         wsocket.send('서버로부터받은 메시지:'+$('#chatcontent').val());//msg:KOSMO>>안녕
         //DIV(대화영역)에 메시지 출력
         
       
         appendMessage("<div class='outgoing_msg'><div class='sent_msg'><p>"
               +$('#chatcontent').val()+"<br/></p><span style='float: right;font-size: small; margin-top:5px;'>"
               +today.toLocaleTimeString()+"</span></div></div>");
         //기존 메시지 클리어      
         $('#chatcontent').val("");
         //포커스 주기
         $('#chatcontent').focus();
         $('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
      });
   //퇴장버튼 클릭시
   $('#exitBtn').one('click',function(){
      wsocket.send('서버로부터받은 메시지:'+nickname+'가(이) 퇴장했어요');//msg:KOSMO>>안녕
      wsocket.close();
   });
   
   
   $(function (){
      $("#chatmenutoggle").click(function (){
        $("#chatmenuToggleDiv").toggle();
     });
   
   });
   
   
   
</script>