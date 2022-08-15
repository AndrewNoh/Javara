<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					        <div class="col-lg-4 col-md-6 portfolio-item filter-${LIST.category}" name="data">
					          <div class="portfolio-wrap">
					            <img src="${pageContext.request.contextPath}/resources/assets/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
					            <div class="portfolio-info">
					              <h4>${LIST.title}</h4>
					              <p>${LIST.price}\</p>
					              <div class="portfolio-links">
					                <a href="${pageContext.request.contextPath}/resources/assets/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
					                <a href="<c:url value="/board/productview.do"><c:param value="${LIST.product_no}" name="no"/></c:url>" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bx-link"></i></a>
					                <a href="#" ><i class="bx bx-like"></i></a>
					                <a href="#" ><i class="bx bxs-book-heart"></i></a>
					              </div>
					            </div>
					          </div>
					        </div>  
					        
				        </c:forEach>
			        </div>
		        </c:if>
		        <script>
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