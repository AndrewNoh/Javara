<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="position: fixed;bottom: 12%; right: 3%;">
 <a href="<c:url value="/board/write.do"><c:param name="board" value="Auction"/> </c:url>">
  <img src="${pageContext.request.contextPath}/resources/assets/img/write_btn.png" 
       title="글쓰기" style="width: 80px; height: 80px"></a>
</div>
<div style="position: fixed;bottom: 5%; right: 3%;">
   <a href="#portfolio"><img src="${pageContext.request.contextPath}/resources/assets/img/scrollbar_btn.png" 
      title="위로가기" style="width: 80px; height: 80px"></a>
</div>


<button type="button" id="prev" style="position: absolute; font-size: 70px; left: 0px; top:50%; z-index: 5; background-color:transparent; color: white; border: 0px">
	&lt;
</button>
<button type="button" id="next" style="position: absolute;; right: 0px; font-size: 70px; top:50%;  z-index: 5; background-color:transparent; color: white; border: 0px">
	&gt;
</button>


<form action="<c:url value="/board/productlist.do"/>" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<div id="portfolio" class="portfolio  m-5">	
	    <div class="container" id="container">
			<!-- 제목 -->
			<div class="section-title" id="title">
                 <h2>자바라 경매</h2>
               <p style="margin-top: 10px">💰 ${address}의 경매게시판 입니다.</p>
               <h1 style="font-size: 18px">이웃의 상품을 구매하는 구매자, 판매하는 판매자로서 따뜻함을 나눠주세요.<br/>
            </h1>
         </div>
			<!-- 선택 메뉴 -->
			<div class="row">
              <div class="col-lg-12 d-flex justify-content-center">
                   <ul id="portfolio-flters">
                     <li data-filter="*" <c:if test="${category == '모두'}"> class="filter-active" </c:if>>전체보기</li>
                     <li data-filter=".filter-중고차" <c:if test="${category == '중고차'}"> class="filter-active" </c:if>>중고차</li>
                     <li data-filter=".filter-디지털기기" <c:if test="${category == '디지털기기'}"> class="filter-active" </c:if>>디지털기기</li>
                     <li data-filter=".filter-생활가전" <c:if test="${category == '생활가전'}"> class="filter-active" </c:if>>생활가전</li>
                     <li data-filter=".filter-가구인테리어" <c:if test="${category == '가구인테리어'}"> class="filter-active" </c:if>>가구/인테리어</li>
                     <li data-filter=".filter-유아동" <c:if test="${category == '유아동'}"> class="filter-active" </c:if>>유아동</li>
                     <li data-filter=".filter-유아도서" <c:if test="${category == '유아도서'}"> class="filter-active" </c:if>>유아도서</li>
                     <li data-filter=".filter-생활가공식품" <c:if test="${category == '생활가공식품'}"> class="filter-active" </c:if>>생활/가공식품</li>
                     <li data-filter=".filter-스포츠레저" <c:if test="${category == '스포츠레저'}"> class="filter-active" </c:if>>스포츠/레저</li>
                     <br/>                                          
                     <li data-filter=".filter-여성잡화" <c:if test="${category == '여성잡화'}"> class="filter-active" </c:if>>여성잡화</li>
                     <li data-filter=".filter-여성의류" <c:if test="${category == '여성의류'}"> class="filter-active" </c:if>>여성의류</li>
                     <li data-filter=".filter-남성패션잡화" <c:if test="${category == '남성패션잡화'}"> class="filter-active" </c:if>>남성패션/잡화</li>
                     <li data-filter=".filter-게임취미" <c:if test="${category == '게임취미'}"> class="filter-active" </c:if>>게임/취미</li>
                     <li data-filter=".filter-뷰티미용" <c:if test="${category == '뷰티미용'}"> class="filter-active" </c:if>>뷰티/미용</li>
                     <li data-filter=".filter-반려동물용품" <c:if test="${category == '반려동물용품'}"> class="filter-active" </c:if>>반려동물용품</li>
                     <li data-filter=".filter-도서티켓음반" <c:if test="${category == '도서티켓음반'}"> class="filter-active" </c:if>>도서/티켓/음반</li>
                     <li data-filter=".filter-식물" <c:if test="${category == '식물'}"> class="filter-active" </c:if>>식물</li>
                     <li data-filter=".filter-기타" <c:if test="${category == '기타'}"> class="filter-active" </c:if>>기타</li>
                   </ul>
              </div>
            </div>		
			<c:if test="${empty LISTS}" var="LIST">
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
					<c:forEach var="LIST" items="${LISTS}" varStatus="loop">
				    	<div class="col-lg-4 col-md-6 portfolio-item filter-${LIST.category}">
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
						        	<h4>${LIST.title}</h4>
						            <p>시작가 <fmt:formatNumber value="${LIST.base_Price}" pattern="#,###"/>원</p>
						            <p style="color:#FFC107">현재가 <fmt:formatNumber value="${LIST.upper_Price}" pattern="#,###"/>원</p>						            
						            <div class="portfolio-links">
						            	<a href="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[loop.index][0].imageName}?no=${loop.count}" data-gallery="portfolioGallery" class="portfolio-lightbox" id="img${loop.count}"><i class="bx bxs-photo-album"></i><span style="font-size: 12px; display: block;">사진</span></a>
						                <a href="<c:url value="/board/auctionview.do"><c:param value="${LIST.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" id="view${loop.count}" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bxs-detail"></i><span style="font-size: 12px; display: block;">상세보기</span></a>
						                <a href="javascript:void(0);" data-value="${LIST.auction_no}" name="like"><i class="bx bxs-heart" name="heartButton"></i><span style="font-size: 12px; display: block;">좋아요</span></a>
						            </div>
						            <p>종료예정일 ${LIST.endDate}</p>
						    	</div>
						    </div>
						</div>  
						        
					</c:forEach>
					
				</div>			        
				<!-- 게시글 한블럭 -->			
				<div class="row" id="more">
					<input type="hidden" value="모두" id="category"/>
					<input type="hidden" value="${nowpage}" id="nowpage" name="nowpage"/>
					<input type="hidden" value="${endpage}" id="endpage" name="nowpage"/>
				</div>				
			 </c:if>        
		</div>		      
	</div>
</form>


<script type="text/javascript">
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
				like.children().css("color", "#FFC107");
			} else {
				console.log("좋아요 해제")
				like.children().css("color", '');
			}
		});
		
	});
	
	$(document).ready(function(){		
		$.each(${likes}, function(index, value){
			console.log("좋아요 : " + value);
			$('a[data-value="'+value+'"]').children().css('color', '#FFC107');
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
	
	$(document).on("click", ".portfolio-lightbox", function(){
		$(".goverlay").css("background", "black").css("opacity","0.9");
	});
	
	$(document).on("click", ".portfolio-details-lightbox", function(){
		$(".goverlay").css("background", "black").css("opacity","1");
	});
	
	$(document).on("click", "#glightbox-slider > div.gslide.loaded.current > div > div > div > img", function(){
		console.log("클릭됨");
		console.log($(this).attr("src").split("=")[1]);
		var no = $(this).attr("src").split("=")[1];
		$("#glightbox-slider").trigger("click");
		console.log($("#glightbox-slider"));
		setTimeout(function(){$("#view"+no).get(0).click();}, 700);
		
	});
	
	//관리자페이지 css안먹게하기
    $("link#admin").prop('disabled', true);
    $("link#admin1").prop('disabled', true);
    $("link#admin2").prop('disabled', true);
    $("link#admin3").prop('disabled', true);
    $("link#admin4").prop('disabled', true);
    $("link#admin5").prop('disabled', true);
    $("link#admin6").prop('disabled', true);
    $("link#admin7").prop('disabled', true);
    $("link#admin8").prop('disabled', true);
    $("link#admin9").prop('disabled', true);
    $("link#admin10").prop('disabled', true);
    $("link#admin11").prop('disabled', true);
    $("link#admin12").prop('disabled', true);   	

</script>