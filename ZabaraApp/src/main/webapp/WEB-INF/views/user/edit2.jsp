<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ======= About Me ======= -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
input {
	font-family: "CookieRunOTF-Bold", sans-serif;
	width: 250px;
	text-align: center;
}

.interests, .skills, .counts, .form-control {
	background: rgba(0, 0, 0, 0);
}

button {
	background: none;
	border: none;
}

.mt-1 {
	margin-top: 0.8rem !important;
}

.count-box {
	width: 100px;
}

.container {
	width: 70%;
	height: 80%;
}

.profile-pic {
	width: 250px;
	max-height: 250px;
	display: inline-block;
}

.file-upload {
	display: none;
}

.submit {
	width: 50px;
}
</style>
<div class="about-me container d-flex justify-content-center">


	<h4>About</h4>



	<div class="col-lg-4 box" data-aos="fade-right">
		<form action="<c:url value="/userinfo/editmember.do"/>" method="post"
			role="form" class=" " enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="loading"></div>
			<div class="error-message"></div>
			<div class="sent-message"></div>
			<div class=" justify-content-center">
				<div class="row gy-3 justify-content-center">
					<div class="form-group" id="fifthSignup">
						<div class="form-group">
							<img class="profile-pic"
								src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}">
							<input class="file-upload" type="file" accept=".jpg, .png, .jpeg"
								name="profileimg" id="profileimg"/>
							<div>&nbsp</div>
						</div>
					</div>
					<div class="form-group">
						<h5 class="">NICKNAME</h5>
						<input type="text" class="form-style" name="nickname"
							id="nickname" value="${nickname}">
					</div>
					<div class="col-md-12 form-group">
						<h5 class="">PASSWORD</h5>
						<input type="password" name="password" class="form-style" id="password"
							required value="${password}">
					</div>
					<div class="col-md-12 form-group">
						<h5 class="">EMAIL</h5>
						<input type="text" name="email" class="form-style" id="email"
							required value="${email}">
					</div>
					<div class="col-md-12 form-group">
						<h5 class="">ADRESS</h5>
						<input type="text" onclick="daumAddress()" class="form-style"
							name="fulladdress" id="fulladdress" required
							value="${FULLADDRESS}">

					</div>
					<div class="col-md-5 mt-0 form-group">
						<input type="submit" class="submit mt-3" value="완료">
					</div>
				</div>
			</div>
	</div>

	<div class="owl-carousel testimonials-carousel"></div>

</div>
</form>
<script>
	function daumAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				document.getElementById("fulladdress").value = addr;
				$('#nextBtn').focus();
			}
		}).open();
	}

	//프로필사진관련
	var readURL = function(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.profile-pic').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#profileimg").change(function() {
		var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
		if (!$('#profileimg').val().match(fileForm)) {
			addMessage('jpg,jpeg,png타입만 선택 가능합니다.', $('#profileimg'));
			$('#profileimg').val(null);
		}
		readURL(this);
			
	});

	$(".profile-pic").click(function() {
		$("#profileimg").click();
	});
</script>