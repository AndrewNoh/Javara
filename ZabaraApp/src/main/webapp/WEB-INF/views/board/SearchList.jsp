<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="position: fixed;bottom: 5%; right: 3%;">
 <a href="<c:url value="/board/write.do"><c:param name="board" value="Auction"/> </c:url>">
  <img src="${pageContext.request.contextPath}/resources/assets/img/write_btn.png" 
       title="글쓰기" style="width: 80px; height: 80px"></a>
</div>
<!-- 
<div style="position: fixed;bottom: 110px; right: 30px;">
  <a href="#portfolio"><i class="bx bxs-caret-up-circle" title="위로가기" style="font-size: 50px"></i></a>
</div>
 
<button type="button" id="prev" style="position: absolute; font-size: 70px; left: 0px; top:50%; z-index: 5; background-color:transparent; color: white; border: 0px">
	&lt;
</button>
<button type="button" id="next" style="position: absolute;; right: 0px; font-size: 70px; top:50%;  z-index: 5; background-color:transparent; color: white; border: 0px">
	&gt;
</button>
-->

<form action="<c:url value="/board/productlist.do"/>" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<div id="portfolio" class="portfolio  m-5">	
	    <div class="container" id="container">
			<!-- 제목 -->
			<div class="section-title" id="title">
			   	<h2>검색 목록</h2>
			   	<p>${address}의 검색결과 입니다.</p>
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
				<c:choose>
					<c:when test="${LISTS[0].auction_no != null}">
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
						
					</c:when>
					
					<c:when test="${LISTS[0].product_no != null}">
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
								            <p>가격 : ${LIST.price}\</p>
								            <div class="portfolio-links">
								            	<a href="${pageContext.request.contextPath}/resources/assets/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bxs-photo-album"></i><span style="font-size: 18px; display: block;">사진보기</span></a>
								                <a href="<c:url value="/board/productview.do"><c:param value="${LIST.product_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bxs-detail"></i><span style="font-size: 18px; display: block;">상세보기</span></a>
								                <a href="javascript:void(0);" data-value="${LIST.product_no}" name="like"><i class="bx bxs-book-heart"></i><span style="font-size: 18px; display: block;">찜</span></a>
							                </div>
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
					</c:when>
					
					<c:otherwise>
						
					</c:otherwise>
				
				</c:choose>				
				
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