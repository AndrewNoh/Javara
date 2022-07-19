<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style="position: fixed;bottom: 50px; right: 30px;">
  <a href="<c:url value="/board/write.do"><c:param name="board" value="Product"/> </c:url>"><i class="bx bx-plus-circle" title="글쓰기" style="font-size: 50px"></i></a>
  </div>
  <div style="position: fixed;bottom: 110px; right: 30px;">
  <a href="#portfolio"><i class="bx bxs-caret-up-circle" title="위로가기" style="font-size: 50px"></i></a>
</div>

<button type="button" id="prev" style="position: absolute; font-size: 70px; left: 70px; top:50%; z-index: 5; background-color:transparent; color: white; border: 0px">
	&lt;
</button>
<button type="button" id="next" style="position: absolute;; right: 70px; font-size: 70px; top:50%;  z-index: 5; background-color:transparent; color: white; border: 0px">
	&gt;
</button>

<form action="<c:url value="/board/productlist.do"/>" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div id="portfolio" class="portfolio neonborder m-5">
	    <div class="container" id="container">			
			<!-- 제목 -->
			<div class="section-title" id="title">
			   	<h2>중고거래</h2>
			   	<p>${address}의 중고거래게시판 입니다.</p>
			</div>
			<!-- 선택 메뉴 -->
			<div class="row">
	        	<div class="col-lg-12 d-flex justify-content-center">
	          		<ul id="portfolio-flters">
			            <li data-filter="*" <c:if test="${category == '모두'}"> class="filter-active" </c:if>>모두</li>
			            <li data-filter=".filter-가전" <c:if test="${category == '가전'}"> class="filter-active" </c:if>>가전</li>
			            <li data-filter=".filter-가구" <c:if test="${category == '가구'}"> class="filter-active" </c:if>>가구</li>
	            		<li data-filter=".filter-생활용품" <c:if test="${category == '생활용품'}"> class="filter-active" </c:if>>생활용품</li>
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
						            <p>${LIST.price}\</p>
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
						
	});
	
	$('#prev').on("click", function(){
		if($('#nowpage').val() != 1){
			$('#nowpage').val($('#nowpage').val() - 1);
			console.log('이전페이지');
			form.submit();
		}
	});
	
	$('[name=like]').on("click", function(){
		var like = $(this);
		$.ajax({
			url :'<c:url value="/board/likeUp.do"/>',
			type:'POST',
			dataType: "text",
			data:{'${_csrf.parameterName}':'${_csrf.token}', no:$(this).data("value"), board:"중고물품"},
		}).done(function(data){
			if (data != 1) {
				like.children().css("color", "#18d26e");
			} else {
				console.log("좋아요 해제")
				like.children().css("color", "white");
			}
		});
		
	});
	
	$(document).ready(function(){		
		$.each(${likes}, function(index, value){
			console.log("좋아요 : " + value);
			$('a[data-value="'+value+'"]').children().css('color', 'green');
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