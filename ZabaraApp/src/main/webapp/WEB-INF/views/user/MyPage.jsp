<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
#mapwrap {
   position: relative;
   overflow: hidden;
}

.category, .category * {
   margin: 0;
   padding: 0;
   color: #000;
}

.category {
   position: absolute;
   overflow: hidden;
   top: 10px;
   left: 10px;
   width: auto;
   height: 50px;
   z-index: 10;
   border: none;
   text-align: center;

}

.category button {
   list-style: none;
   float: left;
   width: 50px;
   height: 50px;
   padding-top: 5px;
   border-radius: 50%;
   font-size: 14px;
   color: #ffffff;
   cursor: pointer;

}

.category button {
   list-style: none;
   float: left;
   width: 50px;
   height: 50px;
   padding-top: 5px;
   border-radius: 50%;
   font-size: 14px;
   color: #ffffff;
   cursor: pointer;

}

.nav-link {
   color: #f9fafb;
}

.bAddr {
   color: black;
   width: 200px;
   height: 60px;
   padding: 5px;
}

#myPay {
   margin-left: 5px;  
   border: none;
   background: transparent;

}

.swal2-popup {
   font-size: 1.3rem !important;
}

.bi::before, [class^="bi-"]::before, [class*=" bi-"]::before{
color:#ffc107
}

.col-lg-5{
    display: flex;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: center;
}

</style>

<!-- ======= About Me ======= -->
<div class="neonborder m-5">
   <div class="about-me container">

      <div class="section-title">
         <h2>나의 자바라</h2>
      </div>

      <div class="row">
         <div class="col-lg-5 box" data-aos="fade-right">
            <div>
               <img
                  src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}"
                  class="img-fluid profile-photo" alt=""
                  style="object-fit: cover; width:400px; max-height: 400px; border-radius: 50%"> <input
                  class="file-upload" type="file" accept=".jpg, .png, .jpeg"
                  name="profileimg" id="profileimg" style="display: none;" />
            </div>
            <div id="changeProfileBtn" class="text-center"
               style="display: none;">
               <button class="w-btn w-btn-gray"
                  style="border-radius: 0.5em; padding: 5px 20px;"
                  saveBtn" onclick="saveChangedProfile()">저장</button>
               <button class="w-btn w-btn-gray"
                  style="border-radius: 0.5em; padding: 5px 20px;"
                  reset" id="cancelBtn">취소</button>
            </div>
         </div>
         <div class="col mb-3">
            <div class="col-lg-8 pt-3 pt-lg-0 content" data-aos="fade-left">
               <div class="row m-2">
                  <div class="col" style="padding: 0%;">
                     <h3 class="mt-2" style="margin-left: 15px;">
                        <strong>${nickname}</strong>
                     </h3>
                  </div>
                  <div class="col-7 ml-6" style="padding: 0%;">
                     <a href="<c:url value="/userinfo/editmember.do"/>"
                        class="setting"> <i class="bi bi-gear"
                        style="color: white; font-size: 1.3rem;"></i></a>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-7">
                  <p>
                     <strong>Email:</strong> <span>${email}</span>
                  </p>
                  <p>
                     <strong>Phone:</strong> <span>${phonenumber}</span>
                  </p>
                  <p>
                     <strong>Address</strong> <span id="myAddress">${address}</span>
                  </p>
               </div>
            </div>

            <div class="counts container">

               <div class="row">
                  <div class="col-lg-4 col-md-1">
                     <a class="nav-link" href="<c:url value="/userinfo/selllist.do"/>">
                        <div class="count-box" style="padding: 10px 0;">
                           <i class="bi bi-emoji-smile"></i> <span
                              data-purecounter-start="0" data-purecounter-end="12"
                              data-purecounter-duration="1" class="purecounter"></span>
                           <p>판매내역</p>
                        </div>
                     </a>
                  </div>

                  <div class="col-lg-4 col-md-1 ">
                     <a class="nav-link"
                        href="<c:url value="/userinfo/purchaselist.do"/>">
                        <div class="count-box" style="padding: 10px 0;">
                           <i class="bi bi-journal-richtext"></i> <span
                              data-purecounter-start="0" data-purecounter-end="29"
                              data-purecounter-duration="1" class="purecounter"></span>
                           <p>구매내역</p>
                        </div>
                     </a>
                  </div>

                  <div class="col-lg-4 col-md-1">
                     <a class="nav-link" href="<c:url value="/userinfo/selllist.do"/>">
                        <div class="count-box" style="padding: 10px 0;">
                           <i class="bi bi-heart"></i> <span data-purecounter-start="0"
                              data-purecounter-end="12" data-purecounter-duration="1"
                              class="purecounter"></span>
                           <p>관심목록</p>
                        </div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- End Skills -->
 <div class="row">
         <div class="col-5">
            <div class="pay container ">
               <div class="section-title">
                  <h2>자바라 페이</h2>
               </div>
               <div class="mb-5 mt-4">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/pay_logo.png" style="height: 70px"/>
                   <input style="color:white; font-size: 30px; margin-top: 10px" type="text" id="myPay" readonly="readonly">  
                   <div style="float: right;">
                      <select class="btn btn-outline-dark btn-s my-2"  
                              style="font-size: 12px; font-weight: bold; color: #000; margin-top: 10px" data-toggle="dropdown;" id="pay" >
                          <option value="5000">5,000 원</option>
                          <option value="10000">10,000 원</option>
                          <option value="20000">20,000 원</option>
                          <option value="30000">30,000 원</option>
                          <option value="40000">40,000 원</option>
                          <option value="50000">50,000 원</option>
                      </select>                     
                      <button onclick="payService()" type="button" class="btn btn-dark my-2" style="width: auto;  margin-left:10px; font-size: 12px">충전하기</button>
                      <button onclick="payWithdraw()" type="button" class="btn btn-dark my-2" style="width: auto;  margin-left:10px; font-size: 12px">출금하기</button>
                   </div>
                </div>      
            </div>
         </div>
         <!-- ======= Skills  ======= -->
         <div class="col-7">
            <div class="interests container">

               <div class="section-title">
                  <h2 style="margin-bottom: 30px;">나의 활동</h2>
               </div>

               <div class="row">
                  <div class="row">
                     <div class="col-lg-4 col-md-4 ">
                        <div class="icon-box" id="MapToggle">
                           <i class="ri-store-line" style="color: #ffbb2c;"></i>
                           <h3>동네 설정</h3>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4 mt-4 mt-md-0">
                        <div class="icon-box" id="ChatToggle" >
                           <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                           <h3>채팅</h3>

                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4 mt-4 mt-md-0">
                        <div class="icon-box" id="KeyToggle">
                           <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                           <h3>키워드 알림</h3>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-4 col-md-4 mt-4 ">
                        <div class="icon-box" id="LikeToggle">
                           <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                           <h3>모아보기</h3>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4 mt-4">
                        <div class="icon-box" id="AccountBookToggle">
                           <i class="ri-database-2-line" style="color: #47aeff;"></i>
                           <h3>당근가계부</h3>
                        </div>
                     </div>
                     <div class="col-lg-4 col-md-4 mt-4">
                        <div class="icon-box" id="CategoryToggle">
                           <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                           <h3>관심 카테고리</h3>
                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>
         <!--동네인증하기-->
         <div class="col mt-3" id="KeyToggleDiv" style="display: none">
            <div class="interests container">

               <div class="section-title">
                  <h2 style="margin-bottom: 30px;">키워드 자바라</h2>
               </div>

               <div class="row">
                  <div class="col-lg-12 col-md-6 mt-4">
                     <div class="icon-box">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>키워드</h3>
                        <h2>&nbsp;&nbsp;on/off</h2>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-lg-12 col-md-6 mt-4 ">
                        <div class="icon-box">
                           <i class="ri-calendar-todo-line" style="color: #ffbb2c;"></i>
                           <h3>키워드 설정</h3>
                           <div class="col-10 content">
                              <ul>
                                 <li><i class="bi bi-chevron-right"></i> <strong>컴퓨터</strong>
                                 </li>
                                 <li><i class="bi bi-chevron-right"></i> <strong>핸드폰</strong>
                                 </li>
                                 <li><i class="bi bi-chevron-right"></i> <strong>가방</strong>
                                 </li>
                              </ul>
                              <input placeholder="키워드를 입력하세요">
                           </div>
                        </div>
                     </div>
                  </div>

               </div>

            </div>
         </div>
         <!--키워드알림-->
         <div class="col mt-3" id="AccountBookToggleDiv" style="display: none">
            <div class="interests container">

               <div class="section-title">
                  <h2 style="margin-bottom: 30px;">가계부 자바라</h2>
               </div>

               <div class="row">
                  <div class="row">
                     <div class="col-lg-12 col-md-6 mt-4 ">
                        <div class="icon-box">
                           <i class="ri-store-line" style="color: #ffbb2c;"></i>
                           <h3>판매건수</h3>
                           <h2>&nbsp;&nbsp;12건</h2>
                        </div>
                     </div>
                     <div class="col-lg-12 col-md-6 mt-4">
                        <div class="icon-box">
                           <i class="ri-store-line" style="color: #ffbb2c;"></i>
                           <h3>판매 금액</h3>
                           <h2>&nbsp;&nbsp;134800원</h2>
                        </div>
                     </div>
                  </div>

               </div>

            </div>
         </div>
         <!--가계부-->
         <div class="col mt-3" id="MapToggleDiv" style="display: none">
            <form id="simpleChangeAddr" method="post"
               action="<c:url value="/userinfo/simpleChangeAddr.do"/>">
               <sec:csrfInput />
               <input id="myPageAddr" name="myPageAddr" type="hidden" value="">
            </form>
            <div class="interests container">
               <div class="section-title">
                   <div class="section-title">
                        <h2 style="margin-bottom: 30px;">동네 인증</h2>
                     </div>
                  자바라마켓은 우리 동네 이웃과 교류할 수 있는 서비스입니다. <br /> 자바라마켓 서비스를 이용하려면 동네 이웃임을
                  확인하기 위해 동네인증을 꼭 해주셔야 해요. <br /><br/>
                  <div id="mapwrap">
                     <div id="map" style="width: 1200px; height: 800px;"></div>
                     <div class="category">
                        <ul>
                         <button onclick="search_map()" type="button" class="btn btn-dark" style="margin-right:10px; width: 80px">검색</button>
                          <button onclick="nowGeo()" type="button" class="btn btn-dark" style="margin-right:10px; width: 80px">현위치</button>
                          <button onclick="saveMarkerPosition()" type="button" class="btn btn-dark" style=" width: 80px">동네 인증</button>
                        </ul>
                     </div>
                  </div>
               </div>
               </div>
             </div>
               <!--지도-->
               <div class="col mt-3" id="ChatToggleDiv" style="display: none">
                  <div class="interests container">
                     <div class="section-title">
                        <h2 style="margin-bottom: 30px;">나의 채팅</h2>
                         </div>
                           
                       
                        
                        </div>            
                     <div class="col mt-3" id="CategoryToggleDiv" style="display: none">
                     <form id="simpleChangeAddr" method="post"
                        action="#">
                        <sec:csrfInput />
                        <input id="myPageAddr" name="myPageAddr" type="hidden" value="">
                     </form>
                     <div class="interests container">
                        <div class="section-title">
                            <div class="section-title">
                                 <h2 style="margin-bottom: 30px;">관심 카테고리</h2>
                              </div>
                     </div>
                    </div>
                   </div>
                   </div>
               <!--카테고리-->
               <div class="col mt-3" id="LikeToggleDiv" style="display: none">
                     <form id="" method="post"
                        action="#">
                        <sec:csrfInput />
                        <input id="" name="" type="hidden" value="">
                     </form>
                     <div class="interests container">
                        <div class="section-title">
                            <div class="section-title">
                                 <h2 style="margin-bottom: 30px;">모아보기</h2>
                              </div>
                     </div>
                    </div>
                   </div>
               <!--카테고리-->
           
         <!-- End Counts -->
         <!-- End Interests -->
         <!-- ======= Testimonials ======= -->
        <div class="testimonials container mt-3">
         <div class="section-title">
           <h2>채팅</h2>
         </div>
         <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
           <div class="swiper-wrapper">
             <c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
             <div class="swiper-slide">
             <a href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.product_no}" name="product_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="writeuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
               <div class="testimonial-item">
                 <p style="height: 200px;">
                     <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                     ${chatlist.chatcontent} <i
                        class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                  <img
                     src="${pageContext.request.contextPath}/resources/assets/img/profile/"
                     class="testimonial-img" alt="">
                  <h3>
                     <c:if
                        test="${userNickname.nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
                     <c:if
                        test="${userNickname.nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>
                  </h3>
                  <h4>${chatlist.sendtime}</h4>
               </div>
               </a>
             </div><!-- End testimonial item -->
               </c:forEach>
           </div>
           <div class="swiper-pagination"></div>
         </div>
         <div class="owl-carousel testimonials-carousel"></div>
       </div><!-- End Testimonials  -->
   </div>
</div>
      <!-- End Testimonials  -->

      <script type="text/javascript">
         $(function() {
            $("#AccountBookToggle").click(function() {
               $("#AccountBookToggleDiv").toggle(1000);
               if ($("#KeyToggleDiv").style === '')
                  $("#KeyToggleDiv").toggle(1000);
            });
            $("#KeyToggle").click(function() {
               $("#KeyToggleDiv").toggle(1000);
               if ($("#AccountBookToggleDiv").style === '')
                  $("#AccountBookToggleDiv").toggle(1000);
            });
            $("#MapToggle").click(function() {
                $("#MapToggleDiv").toggle(1000);
                setTimeout(function() {
             	   map.relayout();            	  
                   myAddressMap($("#myAddress").text());                  
                }, 1000);   
                setTimeout(function(){
                	console.log(addresslat);
                	console.log(addresslng);
               	   panTo(addresslat,addresslng);
                  },1200);
                
             });
            $("#ChatToggle").click(function() {
               $("#ChatToggleDiv").toggle(1000);
            });
            $('#CategoryToggle').click(function() {
               $("#CategoryToggleDiv").toggle(1000);
            });
            $('#LikeToggle').click(function() {
                $("#LikeToggleDiv").toggle(1000);
             });
         });

         var readURL = function(input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function(e) {
                  $('.profile-photo').attr('src', e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
         }

         var readURL = function(input) {
             if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                   $('.profile-photo').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
             }
          }

          var nowProfile = $(".profile-photo").attr('src');

          $("#profileimg").change(function() {
             var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
             if (!$('#profileimg').val().match(fileForm)) {
                $('#profileimg').val(null);
                const Toast = Swal.mixin({
                   toast : true,
                   position : 'center-center',
                   showConfirmButton : false,
                   timer : 3000,
                   timerProgressBar : true,
                })

                Toast.fire({
                   icon : 'error',
                   title : 'jpg,jpeg,png타입으로만 설정 가능합니다.'
                })
                $("#changeProfileBtn").hide();
             } else
                $("#changeProfileBtn").show();
             readURL(this);
          });

          $(".profile-photo").click(function() {
             $("#profileimg").click();

          });

          // 취소 클릭 시 원래 프로필사진으로 변경후 버튼 숨기기
          $('#cancelBtn').click(function() {
             $('.profile-photo').attr('src', nowProfile);
             $("#changeProfileBtn").hide();
          });

          $('#saveBtn').click(function() {
             $("#changeProfileBtn").hide();
          })

          function saveChangedProfile() {
             var profileimg = new FormData();
             profileimg.append("profileimg", $("#profileimg")[0].files[0]);
             profileimg.append("${_csrf.parameterName}", "${_csrf.token}");

             $.ajax({
                url : '<c:url value="/userinfo/changeProfilePic.do"/>',
                type : "POST",
                processData : false,
                contentType : false,
                data : profileimg,
                dataType : "text",
                success : function(result) {
                   if (result == "success") {
                      $("#changeProfileBtn").hide();
                      nowProfile = $(".profile-photo").attr('src')
                      const Toast = Swal.mixin({
                         toast : true,
                         position : 'center-center',
                         showConfirmButton : false,
                         timer : 1800,
                         timerProgressBar : true,

                      })

                      Toast.fire({
                         icon : 'success',
                         title : '프로필이 변경되었습니다.'
                      })
                   }
                }

             });

          }

       // 마이페이지 동네인증
          function saveMarkerPosition() {
                   $.ajax({
                      type : 'POST',
                      url : '<c:url value="/userinfo/myPageSimpleAddressChange.do"/>',
                      data : {
                         nowAddress : nowAddress,
                         markerlat : markerlat,
                         markerlng : markerlng,
                         '${_csrf.parameterName}' : '${_csrf.token}'
                      },
                      dataType : "text",
                      success : function(result) {
                         if (result == 1) {
                            const Toast = Swal.mixin({
                               toast : true,
                               position : 'center-center',
                               showConfirmButton : false,
                               timer : 1800,
                               timerProgressBar : true,
                            })

                            Toast.fire({
                               icon : 'success',
                               title : '주소가 변경되었습니다.'
                            })
                            addresslat=markerlat;
                            addresslng=markerlng;
                            $('#myAddress').text(nowAddress);
                         }

                      }
                   });

          }

          var addresslat=${latitude};
          var addresslng=${longitude};
          var markerlat;
          var markerlng;
          var detailAddr;
          var nowAddress = "";
          var geocoder = new daum.maps.services.Geocoder();
          var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
          var options = { 
             center : new kakao.maps.LatLng(${latitude}, ${longitude}), // 지도의 중심좌표
             level : 3         
          };
          var kakaomarker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
          infowindow = new daum.maps.InfoWindow({zindex : 1});
              
          var map = new daum.maps.Map(container, options);
          

          // 내 위치로 이동
          function nowGeo() {
             if (navigator.geolocation) { // 브라우저의 Geolocation 지원 여부 판단
                // 현재 위치 정보를 한 번만 얻기
                navigator.geolocation
                      .getCurrentPosition(function(position) {
                   	   markerlat=37.478745014709745;
                   	   markerlng=126.8787909892446;
                   	   setCenter(37.478745014709745, 126.8787909892446);
                         showKakaoMap(37.478745014709745, 126.8787909892446);
                         
                      });
             }
          }

          // 마이페이지 내 주소로 지도열기
          function myAddressMap(addr) {
             geocoder.addressSearch(addr, function(results, status) {
                if (status === daum.maps.services.Status.OK) {
                   var result = results[0];                  
                   showKakaoMap(result.y, result.x);
                }
             });
          }

          // 주소 검색
          function search_map() {
             new daum.Postcode({
                oncomplete : function(data) {
                   var addr = data.address; // 최종 주소 변수
                   console.log(addr);
                   // 주소 정보를 해당 필드에 넣는다.
                   document.getElementById("myPageAddr").value = addr;
                   // 주소로 상세 정보를 검색
                   geocoder.addressSearch(data.address, function(results,
                         status) {
                      // 정상적으로 검색이 완료됐으면
                      if (status === daum.maps.services.Status.OK) {
                         var result = results[0]; // 첫번 째 결과의 값을 활용
                         // 지도를 보여준다 
                         setCenter(result.y, result.x);
                         showKakaoMap(result.y, result.x);
                      }
                   });
                }
             }).open();
          }

          // 카카오 지도
          function showKakaoMap(lat, lng) {
                        
             var coords = new daum.maps.LatLng(lat, lng);
             searchDetailAddrFromCoords(coords,
                   function(result, status) {
                      if (status === daum.maps.services.Status.OK) {
                         detailAddr = '<div>지번 주소 : '
                               + result[0].address.address_name
                               + '</div>';
                         content = '<div class="bAddr">' + detailAddr
                               + '</div>';

                         // 불러온 지도에 중심에 마커표시 
                         kakaomarker.setPosition(coords);
                         kakaomarker.setMap(map);

                         // 인포윈도우에 이동한 마커위치에 주소정보를 표시
                         infowindow.setContent(content);
                         infowindow.open(map, kakaomarker);
                         console.log('showKakaoMap:'
                               + result[0].address.address_name);
                         nowAddress = result[0].address.address_name;                        
                      }
                   });

             // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
             daum.maps.event
                   .addListener(
                         map,
                         'click',
                         function(mouseEvent) {
                            searchDetailAddrFromCoords(
                                  mouseEvent.latLng,
                                  function(result, status) {
                                     if (status === daum.maps.services.Status.OK) {
                                        detailAddr = '<div>지번 주소 : '
                                              + result[0].address.address_name
                                              + '</div>';
                                        content = '<div class="bAddr">'
                                              + detailAddr
                                              + '</div>';

                                        // 마커를 클릭한 위치에 표시합니다 
                                        kakaomarker
                                              .setPosition(mouseEvent.latLng);
                                        kakaomarker.setMap(map);
   									   panTo(mouseEvent.latLng.getLat(),mouseEvent.latLng.getLng());
                                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                        infowindow
                                              .setContent(content);
                                        infowindow
                                              .open(map, kakaomarker);
                                        console
                                              .log('click:'
                                                    + result[0].address.address_name);
                                        nowAddress = result[0].address.address_name;
                                        markerlat = mouseEvent.latLng.getLat();
                                        markerlng = mouseEvent.latLng.getLng();
                                     }
                                  });
                         });

             function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(),
                      callback);
             }
          }

          //지도 이동
          function setCenter(latitude,longitude) {                    	     
         	    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);        	            	    
         	    map.setCenter(moveLatLon);
         	}

          //지도 이동 가까운거리 애니메이션 효과
       	 function panTo(latitude,longitude) {
       	     var moveLatLon = new kakao.maps.LatLng(latitude, longitude);        	            	    
       	     map.panTo(moveLatLon);            
            }
         

         // 자바라페이 잔액 
         $.ajax({
	       	  type: 'POST',
		      url : '<c:url value="/pay/balance.do"/>',
		      data : {
		       		'deposit' : 0,
		       		'withdraw' : 0,
                 	'${_csrf.parameterName}' : '${_csrf.token}'
                  	},
              dataType : "text",
		      success : function(result){
		       		$('#myPay').val(result+'원')
		       		}
	       	  	});      
         
         // 자바라페이 출금
         function payWithdraw() {
        	  var amount = $('#pay option:selected').val();
        	  if($('#myPay').val() < amount) {
        		  const Toast = Swal.mixin({
                      toast : true,
                      position : 'center-center',
                      showConfirmButton : false,
                      timer : 1000,
                      timerProgressBar : true,
                   })

                   Toast.fire({
                      icon : 'error',
                      title : '출금 금액이 잔액보다 많습니다.'
                   })
        	  }
        	  else{
	        	  $.ajax({
	 	       	  		type: 'POST',
	 		       	 	url : '<c:url value="/pay/balance.do"/>',
	 		       		data : {
	 		       		      'deposit' : 0,
	 		       		      'withdraw' : amount,
	                        '${_csrf.parameterName}' : '${_csrf.token}'
	                   	},
	                   	dataType : "text",
	 		       		success : function(result){
	 		       		console.log(result);
	 		       			$('#myPay').val(result+'원')
	 		       			console.log(result);
	 		       		}
	                   	
	 	       	  	});  
        	  }
         }
         

         // 자바라페이 잔액 충전
         var IMP = window.IMP;
         IMP.init('imp74932749'); 

         function payService() {
        	 var amount = $('#pay option:selected').val();
        	 var email = '${email}';
        	 var nickname = '${nickname}';
        	 var address = '${address}';
        	 var phonenumber = '${phonenumber}';
        	 
        	 console.log(amount);
        	
             IMP.init('imp74932749');
             IMP.request_pay(
                         {
                            pg : "inicis", // 사용 시스템
                            pay_method : "card", // 결제 수단
                            merchant_uid : 'merchant_'
                                  + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
                            name : '자바라 페이', // 주문명
                            amount : amount, // 결제 금액 
                            buyer_email : email, // 주문자 이메일
                            buyer_name : nickname, // 주문자명
                            buyer_tel : phonenumber, // 주문자 연락처
                            buyer_addr : address, // 주문자 주소
                         }, function(rsp) {
                            if (rsp.success) { 
                            	const Toast = Swal.mixin({
                                    toast : true,
                                    position : 'center-center',
                                    showConfirmButton : false,
                                    timer : 1000,
                                    timerProgressBar : true,

                                 })

                                 Toast.fire({
                                    icon : 'success',
                                    title : '충전이 완료되었습니다.'
                                 })
                               console.log(amount);
                               $.ajax({
               	       	  		type: 'POST',
               		       	 	url : '<c:url value="/pay/balance.do"/>',
               		       		data : {
               		       		      'deposit' : amount,
               		       		      'withdraw' : 0,
                                      '${_csrf.parameterName}' : '${_csrf.token}'
                                 	},
                                 	dataType : "text",
               		       		success : function(result){
               		       		console.log(result);
               		       			$('#myPay').val(result+'원')
               		       			console.log(result);
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
                                    title : '결제 실패하였습니다.'
                                 })
                               
                            }
                         })
          			}
      </script>