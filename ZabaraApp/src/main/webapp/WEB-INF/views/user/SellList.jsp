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
			<h2>Zabara</h2>
			<p>판매내역</p>
		</div>

		<div class="row portfolio-container" id="list">
				<c:if test="${empty record || record==null}">
				<h3 class="mb-3">아직 판매한 내역이 없습니다</h3>
				</c:if>
				<c:forEach var="record" items="${record}" varStatus="loop">
					<div
						class="col-lg-4 col-md-6 portfolio-item filter-${record.category}">
						<div class="portfolio-wrap">
						
							<c:forEach var="i" begin="${loop.index}" end="${loop.index}">
								<c:if test="${!empty imageList[i][0].imageName}" var="haveImage">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/product_img/${imageList[i][0].imageName}"
										style="width: 100%; height: 100%;" class="img-fluid" alt="">
								</c:if>
								<c:if test="${! haveImage}">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/zabara.png"
										style="width: 100%; height: 100%;" class="img-fluid" alt="">
								</c:if>
							</c:forEach>
							<div class="portfolio-info">
								<h4>${record.title}</h4>
								<p>${record.price}\</p>
								<div class="portfolio-links">
									<a
										href="${pageContext.request.contextPath}/resources/assets/img/portfolio/portfolio-1.jpg"
										data-gallery="portfolioGallery" class="portfolio-lightbox"
										title="App 1"><i class="bx bx-plus"></i></a> <a
										href="<c:url value="/board/productview.do"><c:param value="${record.product_no}" name="no"/></c:url>"
										rel="lyteframe" data-gallery="portfolioDetailsGallery"
										data-glightbox="type: external"
										class="portfolio-details-lightbox" title="Portfolio Details"><i
										class="bx bx-link"></i></a> <a
										href="<c:url value="/board/likeUp.do"><c:param value="${record.product_no}" name="no"/></c:url>"><i
										class="bx bx-like"></i></a> <a
										href="<c:url value="/board/bookMark.do"><c:param value="${record.product_no}" name="no"/></c:url>"><i
										class="bx bxs-book-heart"></i></a>
								</div>
							</div>
						</div>
					</div>
					</c:forEach> 	
		
		</div>
	</div>
</div>
