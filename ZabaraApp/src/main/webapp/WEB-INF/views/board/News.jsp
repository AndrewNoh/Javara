<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
.title {
	font-size: 20pt;
	height: 60px;
	width: 70%;
	margin-bottom: 10px;
}

table tr {
	text-align: center;
	width: 70%;
}

.big {
	width: 60%;
	margin: auto;
	align: center;
	margin-top: 20px;
	border-radius: 15px;
}

div {
	text-align: center;
}

td {
	border-collapse: separate;
	border-spacing: 1px;
	border-bottom: 3px solid #f9fafb61;
	width: 70%;
	align: center;
	height: 60px;
	text-align: center;
}

h3 {
	text-align: center;
}

.newsTitle {
	font-size: 47px;
}

a {
	color: #f9fafb;
}

img {
	float: right;
}
</style>
<div class="container mt-5">
	<div class="mt-5">
		<div class="container">
			<div class="section-title" style="text-align: left;">
				<h2>우리동네 날씨</h2>
			</div>
			<div class="mt-5"
				style="display: flex; align-items: center; justify-content: center;">
				<div style="flex: 3">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/${info}"
						class="mr-5"
						style="object-fit: contain; width: 400px; height: 400px">
				</div>
				<div style="font-size: 32px; flex: 2; text-align: left;" class="m-5">
					<strong>${simpleAddress}의 날씨 </br> ${temperate}
					</strong>
				</div>
				${slash}
			</div>
		</div>
	</div>
	<div class="container mt-3">
		<div class="section-title" style="text-align: left;">
			<h2>우리동네 뉴스</h2>
		</div>
		<table class="big">
			<tr class="title">
				<th colspan="2" class="newsTitle">${simpleAddress}뉴스</th>
			</tr>
			<tbody>
				<tr>
					<c:forEach var="url" items="${urls}" varStatus="status" begin="0"
						end="${titles.size()-1}">

						<tr class="text-center" style="width: 200px">
							<td style="font-weight: bold;"><a href="${url}">${titles[status.index]}</a></td>
							<c:if test="${img[status.index]!=''}" var="haveImg">
								<td><img src="${img[status.index]}"
									style="width: 200px; height: 180px;"></td>
							</c:if>
							<c:if test="${!haveImg}">
								<td><img src="${pageContext.request.contextPath}/resources/assets/img/sampleImg.png"
									style="width: 200px; height: 180px;"></td>
							</c:if>
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
	var length = $('.text-center').length;

	console.log(length);
</script>