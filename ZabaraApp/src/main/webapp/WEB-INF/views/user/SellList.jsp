<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ======= About Me ======= -->
<style>
i {
	font-size: 30px;
}
</style>
<div id="services" class="services neonborder m-5">
	<div class="container">

		<div class="section-title">
			<h2>나의 활동</h2>
			<p>판매내역</p>
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
						            <p>시작가 ${record.base_Price}\</p>
						            <p>현재가 ${record.upper_Price}\</p>						            
						            <div class="portfolio-links">
						            	<a href="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[loop.index][0].imageName}" data-gallery="portfolioGallery" class="portfolio-lightbox"><i class="bx bxs-photo-album"></i><span style="font-size: 18px; display: block;">사진보기</span></a>
						                <a href="<c:url value="/board/auctionview.do"><c:param value="${record.auction_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bxs-detail"></i><span style="font-size: 18px; display: block;">상세보기</span></a>
						                <a href="javascript:void(0);" data-value="${record.auction_no}" name="like"><i class="bx bxs-book-heart" name="heartButton"></i><span style="font-size: 18px; display: block;">찜</span></a>
						            </div>
						            <p>종료예정일 ${record.endDate}</p>
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
