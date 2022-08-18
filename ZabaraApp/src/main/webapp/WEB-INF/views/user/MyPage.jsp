<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c555a840bf745a014ceca0ca9d9dd35&libraries=services"></script>
<script
	src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ChatingStyle.css">
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

.bi::before, [class^="bi-"]::before, [class*=" bi-"]::before {
	
}

.col-lg-5 {
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.msg-bubble {
	max-width: 450px;
	padding: 15px;
	border-radius: 15px;
	background: var(- -left-msg-bg);
}

.right-msg .msg-bubble {
	background: var(- -right-msg-bg);
	color: #fff;
	border-bottom-right-radius: 0;
}

/* 

Designed & Developed by Bhimo Alkautsar
No license, 100% free to use.

*/
@import
	url("https://fonts.googleapis.com/css2?family=Inter:wght@500;700&display=swap")
	;

*, *::before, *::after {
	border: 0;
	margin: 0;
	padding: 0;
	outline: 0;
	box-sizing: border-box;
	font-size: 100%;
	font-style: inherit;
	font-weight: inherit;
	font-family: inherit;
}

.text-bold {
	font-weight: 700;
}

.wrapper {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	max-height: 600px;
	filter: blur(0.2px);
	height: 90vh;
	max-width: 500px;
	width: 90%;
}

.wrapper::before, .wrapper::after {
	content: "";
	position: absolute;
	filter: blur(1px);
	border-radius: 50%;
}

.wrapper::before {
	width: 150px;
	height: 150px;
	top: 45px;
	right: -30px;
	background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
}

.wrapper::after {
	width: 300px;
	height: 300px;
	bottom: -100px;
	left: -100px;
	background: linear-gradient(90deg, #FC466B 0%, #3F5EFB 100%);
}

.card {
  position: relative;
  padding: 48px 24px;
  z-index: 4;
  margin-left: 36%;
  height: auto;
  max-width: 500px;
  width: 90%;
  overflow-x: hidden;
  overflow-y: auto;
  border-radius: 20px;
  background:rgb(125 125 125 / 53%);
  box-shadow: 0 15px 35px rgb(181 179 179 / 50%);
  border: 2px solid rgba(255, 255, 255, 0.3);
}

.card .header {
	margin-bottom: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card .header .title {
	font-size: 24px;
}

.card .header .rating {
	display: flex;
	align-items: center;
	flex-direction: row-reverse;
	gap: 2px;
}

.card .header .rating .fa-star {
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	opacity: 0.6;
	transition: 0.75s cubic-bezier(0.55, 0, 0.1, 1);
}

.card .header .rating .stars {
	width: 0;
	height: 0;
}

.card .header .rating .stars:checked+.fa-star, .card .header .rating .stars:checked+.fa-star+.stars+.fa-star,
	.card .header .rating .stars:checked+.fa-star+.stars+.fa-star+.stars+.fa-star,
	.card .header .rating .stars:checked+.fa-star+.stars+.fa-star+.stars+.fa-star+.stars+.fa-star,
	.card .header .rating .stars:checked+.fa-star+.stars+.fa-star+.stars+.fa-star+.stars+.fa-star+.stars+.fa-star
	{
	color: #f7bb00;
	opacity: 1;
	filter: drop-shadow(0 0 10px rgba(247, 255, 0, 0.5));
}

.card .content .input-group+.input-group {
	margin-top: 12px;
}

.card .content .input-group {
	position: relative;
	width: 100%;
}

.card .content .input-group .input-text, .card .content .input-group .textarea
	{
	font-size: 16px;
	position: relative;
	width: 100%;
	background: rgb(11 11 13 / 60%);
	border-radius: 8px;
	border: 2px solid transparent;
	color: #fff;
	transition: 0.75s ease;
	padding: 18px 12px;
}

.card .content .input-group .input-text:focus, .card .content .input-group .textarea:focus
	{
	border-color: #2f5dd7;
	filter: drop-shadow(0 0 2px #2f5dd7);
}

.card .content .input-group .input-text:focus+.input-placeholder, .card .content .input-group .textarea:focus+.textarea-placeholder
	{
	top: 6px;
	font-size: 10px;
	color: #3597ec;
	transition: 0.1s ease;
	opacity: 1;
}

.card .content .input-group .input-text:valid+.input-placeholder, .card .content .input-group .textarea:valid+.textarea-placeholder
	{
	opacity: 0;
	transition: 0.75s ease;
}

.card .content .input-group .input-placeholder, .card .content .input-group .textarea-placeholder
	{
	position: absolute;
	font-size: 14px;
	top: 20px;
	left: 14px;
	color: #fff;
	letter-spacing: 0.1mm;
	opacity: 0.8;
	transition: 0.1s ease;
	cursor: auto;
}

.card .content .input-group .textarea {
	height: 140px;
	resize: none;
	padding: 18px 12px;
}

.card .content .upload-submit {
	display: flex;
	align-items: center;
}

.card .content .upload-submit .file-upload {
	width: 65%;
	padding: 14px;
	letter-spacing: 0.4mm;
	font-size: 14px;
	background: rgba(15, 17, 23, 0.6);
	border: 2px solid transparent;
	border-radius: 8px;
	margin-right: 16px;
	cursor: pointer;
	justify-content: center;
}

.card .content .upload-submit .file-upload input {
	display: none;
}

.card .content .upload-submit .file-upload .custom-upload {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 12px;
	opacity: 0.8;
}

.card .content .upload-submit .file-upload .custom-upload .fa-camera {
	margin-top: 1px;
}

.card .content .upload-submit .file-upload:hover, .card .content .upload-submit .file-upload:focus
	{
	transition: 0.2s ease;
	border-color: #2f5dd7;
	filter: drop-shadow(0 0 2px #2f5dd7);
}

.card .content .upload-submit .file-upload:hover>.custom-upload, .card .content .upload-submit .file-upload:focus>.custom-upload
	{
	opacity: 1;
}

.card .content .upload-submit .btn-submit {
	display: flex;
	color: #fff;
	align-items: center;
	letter-spacing: 0.4mm;
	justify-content: space-between;
	background: #eec341;
	transition: 0.75s ease;
	border: 2px solid transparent;
	font-size: 15px;
	padding: 14px 22px;
	cursor: pointer;
	width: 24%;
	transition: 0.2s ease;
	border-radius: 8px;
	margin-left: 77%;
	margin-top: 10px;
}

.card .content .upload-submit .btn-submit:hover, .card .content .upload-submit .btn-submit:focus
	{
	filter: drop-shadow(0 0 4px #2f5dd7);
}

.card .content .upload-submit .btn-submit .fa-arrow-right {
	margin-top: 1px;
	animation: arrow-right 0.7s infinite;
}

.card .line-break {
	margin: 48px 0;
	width: 100%;
	height: 4px;
	border-radius: 2px;
	background: rgba(255, 255, 255, 0.3);
}

.card .other-review+.other-review {
	margin-top: 12px;
}

.card .other-review {
	position: relative;
	width: 100%;
	background: rgba(15, 17, 23, 0.6);
	padding: 28px 14px;
	border-radius: 10px;
	justify-content: space-between;
	display: flex;
	gap: 14px;
}

.card .other-review .profile-picture {
	position: relative;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	overflow: hidden;
}

.card .other-review .profile-picture img {
	height: 45px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

.card .other-review .review-detail {
	position: relative;
	flex: 1;
}

.card .other-review .review-detail .review-name {
	display: flex;
	justify-content: space-between;
	margin: 4px 0 2px 0;
}

.card .other-review .review-detail .review-name .full-name {
	max-width: 260px;
	font-size: 14px;
}

.card .other-review .review-detail .review-name .action .action-list-open
	{
	list-style: none;
}

.card .other-review .review-detail .review-name .action .action-list-open .fa-ellipsis-h
	{
	cursor: pointer;
	position: relative;
	z-index: 10;
}

.card .other-review .review-detail .review-name .action .action-list-open::-webkit-details-marker
	{
	display: none;
}

.card .other-review .review-detail .review-name .action .action-list {
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
	z-index: 9;
	right: 0;
	top: 25px;
	border-radius: 4px;
	position: absolute;
	width: 100px;
	background: rgba(15, 17, 23, 0.6);
	transform-origin: top right;
	display: flex;
	flex-direction: column;
	padding: 8px;
}

.card .other-review .review-detail .review-name .action .action-list-item
	{
	padding: 8px;
	display: block;
	border-radius: 2px;
	font-size: 12px;
	cursor: pointer;
}

.card .other-review .review-detail .review-name .action .action-list-item:hover:nth-child(1)
	{
	background: #2f5dd7;
	transition: 0.5s ease;
}

.card .other-review .review-detail .review-name .action .action-list-item:hover:nth-child(2)
	{
	background: #b84b95;
	transition: 0.5s ease;
}

.card .other-review .review-detail .review-name .action[open] .action-list
	{
	animation: scale 0.25s ease;
}

.card .other-review .review-detail .review-date {
	font-size: 12px;
	opacity: 0.7;
}

.card .other-review .review-detail .review-rating {
	margin: 6px 0 28px 0;
	display: flex;
	color: #fff;
	font-size: 10px;
	gap: 2px;
}

.card .other-review .review-detail .review-rating .yellow-star {
	color: #f7bb00;
	filter: drop-shadow(0 0 5px rgba(247, 255, 0, 0.5));
}

.card .other-review .review-detail .review-comment {
	font-size: 12px;
	max-width: 260px;
	line-height: 5mm;
}

.card .other-review .review-detail .review-image {
	margin-top: 28px;
	display: flex;
	gap: 14px;
	align-items: center;
	flex-wrap: wrap;
}

.card .other-review .review-detail .review-image .img-wrapper {
	cursor: pointer;
	position: relative;
	border-radius: 5px;
	width: 80px;
	height: 80px;
	overflow: hidden;
}

.card .other-review .review-detail .review-image .img-wrapper img {
	position: absolute;
	height: 80px;
	top: 50%;
	transform: translateY(-50%);
}

@keyframes arrow-right {
  0% {
    transform: translateX(0);
  }
  25% {
    transform: translateX(3px);
  }
  25% {
    transform: translateX(5px);
  }
  75% {
    transform: translateX(3px);
  }
  to {
    transform: translateX(0);
  }
}
@keyframes scale {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
::-webkit-scrollbar {
	width: 10px;
}

::-webkit-scrollbar-thumb {
	background: rgba(21, 20, 26, 0.55);
	border-top: 24px solid transparent;
	border-right: 4px solid transparent;
	border-bottom: 24px solid transparent;
	background-clip: padding-box;
}

body {
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

body::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.modal-backdrop.show{
    opacity: .8;	
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
					<img id="profileImgTag"
						src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}"
						class="img-fluid profile-photo" alt="이미지"
						style="object-fit: cover; width: 400px; max-height: 400px; border-radius: 50%">
					<input class="file-upload" type="file" accept=".jpg, .png, .jpeg"
						name="profileimg" id="profileimg" style="display: none;" />
				</div>
				<div id="changeProfileBtn" class="text-center m-2"
					style="display: none;">
					<a class="btn btn-light"
						style="border-radius: 0.5em; padding: 5px 20px;"
						saveBtn" onclick="saveChangedProfile()">저장</a> <a
						class="btn btn-light"
						style="border-radius: 0.5em; padding: 5px 20px;"
						reset" id="cancelBtn">취소</a>
				</div>
			</div>
			<div class="col mb-3">
				<div class="col-lg-12 pt-3 pt-lg-0 content" data-aos="fade-left">
					<div class="row m-2">
						<div class="col" style="padding: 0%;">
							<h3 class="mt-2" style="font-size: 35px;">
								<strong>${nickname}</strong>
							</h3>
						</div>
						<div class="col-8" style="padding: 0%;">
							<a href=" " data-target="#editModal" data-toggle="modal" id="modal-open"
								class="setting"><img style="width: 23px; margin-top:14px;"src="${pageContext.request.contextPath}/resources/assets/img/pencil1.png" ></a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-7">
						<p style="font-weight: bold;">
							<i class="bi bi-envelope"
								style="font-size: 18px; margin-left: 10px; color: #ffc107;"></i>
							&nbsp; <span>${email}</span>
						</p>
						<p style="font-weight: bold;">
							<i class="bi bi-telephone"
								style="font-size: 18px; margin-left: 10px; color: #ffc107;"></i>
							&nbsp; <span>${phonenumber}</span>
						</p>
						<p style="font-weight: bold;">
							<i class="bi bi-house"
								style="font-size: 18px; margin-left: 10px; color: #ffc107;"></i>
							&nbsp; <span id="myAddress">${address}</span>
						</p>
					</div>
				</div>

				<div class="counts container">

					<div class="row">
						<div class="col-lg-4 col-md-1" style="padding: 0px;">
							<a class="nav-link" href="<c:url value="/userinfo/selllist.do"/>">
								<div class="count-box" style="padding: 10px 0;">
									<i class="bi bi-emoji-smile" style="color: #ffedb8;"></i> <span
										data-purecounter-start="0" data-purecounter-end="${sellCount}"
										data-purecounter-duration="1" class="purecounter"></span>
									<p style="font-size: 15px;">판매내역</p>
								</div>
							</a>
						</div>

						<div class="col-lg-4 col-md-1 " style="padding: 0px;">
							<a class="nav-link"
								href="<c:url value="/userinfo/purchaselist.do"/>">
								<div class="count-box" style="padding: 10px 0;">
									<i class="bi bi-journal-richtext" style="color: #86bcf6;"></i>
									<span data-purecounter-start="0"
										data-purecounter-end="${buyCount}"
										data-purecounter-duration="1" class="purecounter"></span>
									<p style="font-size: 15px;">입찰내역</p>
								</div>
							</a>
						</div>

						<div class="col-lg-4 col-md-1" style="padding: 0px;">
							<a class="nav-link" href="<c:url value="/userinfo/likelist.do"/>">
								<div class="count-box" style="padding: 10px 0;">
									<i class="bi bi-heart" style="color: #ff4141;"></i> <span
										data-purecounter-start="0" data-purecounter-end="${likeCount}"
										data-purecounter-duration="1" class="purecounter"></span>
									<p style="font-size: 15px;">좋아요</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 회원수정 모달 -->
	<div id="editModal" class="modal" style="justify-content: center;">
		<div class="card">
           <form action="<c:url value="/userinfo/editmember.do"/>" method="post"
			role="form" class="" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="loading"></div>
			<div class="error-message"></div>
			<div class="sent-message"></div>
                <div class="header">
                    <h1 class="title text-bold">회원수정</h1>
                </div>
                <div class="content">
       					<div class="form-group" style="justify-content:center;">
							<img id="editImgTag" class="profile-photo" 
								src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${profileimage}" style="object-fit: cover; width: 300px; height: 300px;border-radius: 50%; margin-left: 80px;">
							<input class="file-upload" type="file" accept=".jpg, .png, .jpeg"
								name="editprofileimg" id="editprofileimg" style="display:none;"/>
							<div class="mb-4">&nbsp</div>
						</div>
                    <div class="input-group">
                        <input style="text-align: center;" type="text" name="nickname" id="editnickname" class="input-text" value="${nickname}" required>
                    </div>
                    <div class="input-group">
                        <input style="text-align: center;" type="password" name="password" id="editpassword" class="input-text" value="${pwd}" required>
                    </div>                 
                    <div class="input-group">
                        <input style="text-align: center;" type="text" name="email" id="editemail" class="input-text" value="${email}" required readonly>
                    </div> 
                    <div class="input-group">
                        <input style="text-align: center;" type="text" onclick="daumAddress()" name="fulladdress" id="editfulladdress" class="input-text" value="${address}" required>
                        <input type="hidden" name="latitude" id="latitude" value="${latitude}">
						<input type="hidden" name="longitude" id="longitude" value="${longitude}">
                    </div> 
                    <div class="input-group upload-submit">
                        <button style="text-align: center;" type="submit" class="btn-submit"><span class="text-bold">수정</span><span class="fa fa-arrow-right"></span></button>
                    </div>
                </div>
            </form>
        </div>
	</div>
		<!-- End Skills -->
		<!-- 자바라 페이 -->
		<div class="row">
			<div class="col-5">
				<div class="pay container"
					style="display: flex; flex-direction: column;">
					<div class="section-title">
						<h2>자바라 페이</h2>
					</div>
					<div class="mt-3 mb-3">
						<img
							src="${pageContext.request.contextPath}/resources/assets/img/pay_logo.png"
							style="height: 60px; margin-right: 10px" /> <span id="myPay"
							style="color: #fff; font-size: 35px; vertical-align: bottom"></span>
						<div style="float: right; margin-top: 45px">
						
							<button type="button" class="btn btn-dark my-2" data-bs-toggle="modal" data-bs-target="#payModal" style="width: 100px; float: right; font-size: 12px; position: relative; top: 20px">충전하기</button>

						</div>
					</div>
				</div>
			</div>
			<!-- 자바라 페이 -->
			<!-- 자바라 페이 충전하기 모달 -->
            <div id="payModal" class="modal fade">
             <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header" style="justify-content: center;">  
                               <h1 class="modal-title" style="color: black; font-size: 18px; font-weight: bold; ">자바라하는 새로운 방법, 자바라 페이</h1>
                               
                           </div>
                             <div class="modal-body">
								 <h1 style="font-size: 12px; text-align:center; margin-top: 10px; font-weight: bold ">자바라페이는 선불머니를 충전하고 이용할 수 있는 간편 결제/송금 서비스예요. </h1>
                      	         <h1 style="font-size: 12px; text-align:center; margin-top: 10px; font-weight: bold ">중고 및 경매거래 자바라페이로 해보세요! </h1>
                              <form class="form-horizontal" role="form" method="POST" action="#" style="text-align: center;">                     
                                  <sec:csrfInput/>
                                  <select class="btn btn-outline-warning btn-s my-2" style="font-size: 12px; font-weight: bold; color: #000; margin-top: 10px" data-toggle="dropdown;" id="pay" name="pay">
	                                 <option value="" >이용하기</option>
	                                 <!-- 
	                                 <option value="5000">충전 금액 5,000 원</option>
	                                 <option value="10000">충전 금액 10,000 원</option>
	                                 <option value="20000">충전 금액 20,000 원</option>
	                                 <option value="30000">충전 금액 30,000 원</option>
	                                 <option value="40000">충전 금액 40,000 원</option>
	                                 <option value="50000">충전 금액 50,000 원</option>
	                                 -->
	                                 <option value="direct">금액입력</option>
                           		  </select>
                                   <input type="text"  class="input" id="payboxDirect" name="payboxDirect" style="font-size: 14px; margin-left: 10px; border: 0.5px solid gray; border-radius: 30px; padding: 5px; width: 100px; text-align: center;" placeholder="원"> 
                                
                              </form>
                        </div>
                           <div class="modal-footer">
                             <button type="button" class="btn btn-dark" style="color:#fff; font-size: 12px;" data-dismiss="modal"  onclick="payService()">결제하기</button>
                           </div>
                       </div><!-- /.modal-content -->
                   </div><!-- /.modal-dialog -->
               </div><!-- /.modal -->
			


			<!-- 나의 활동 -->
			<div class="col-7">
				<div class="interests container">
					<div class="section-title">
						<h2 style="margin-bottom: 30px;">나의 활동</h2>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 mt-4 mt-md-1">
							<div class="icon-box" id="MapToggle">
								<i class="bi bi-map" style="color: #46a111;"></i>
								<h3>동네 인증</h3>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 mt-4 mt-md-1">
							<div class="icon-box" id="KeyToggle">
								<i class="bi bi-bell-fill" style="color: #4c85fc;"></i>
								<h3>&nbsp;&nbsp;알 림</h3>
							</div>
						</div>

						<div class="col-lg-4 col-md-4 mt-4 mt-md-1">
							<div class="icon-box" id="AccountBookToggle">
								<i class="bi bi-calculator-fill" style="color: #de83d3;"></i>
								<h3>&nbsp;가계부</h3>
							</div>
						</div>
						<span style="margin-bottom: 20px;"></span>
					</div>
					<div class="row">
						
						<div class="col-lg-4 col-md-4">
							<div class="icon-box" id="temperatureToggle">
								<i class="bi bi-star" style="color: #ffbb2c;"></i>
								<h3>&nbsp;&nbsp;후 기</h3>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="icon-box" id="ChatToggle">
								<i class="bi bi-chat-left-dots" style="color: #9cbeff;"></i>
								<h3>&nbsp;&nbsp;채 팅</h3>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 ">
							<div class="icon-box" id="ALlToggle">
								<i class="ri-gradienter-line" style="color: #ffa76e;"></i>
								<h3>모두 닫기</h3>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 나의 활동 -->

			<div class="col-12 mt-3" id="KeyToggleDiv" style="display: none">
				<div class="interests container">
					<div class="section-title">
						<h2 style="margin-bottom: 30px;">알림 자바라</h2>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-6 mt-4 ">
							<div class="icon-box">
								<div class="col" style="display: flex; align-items: center; flex-wrap:wrap;">
									<i class="ri-calendar-todo-line" style="color: #ffbb2c;"></i>
									<h3>알림 내역</h3>
								</div>
								<div class="col-10 content" style="display: flex;flex-direction:column;">
									<div class="col">
										<div class="section-title">
											<h2 style="margin-bottom: 30px;">채팅 알림</h2>
										</div>
										<c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
											<a
												href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="writeuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
												<c:forEach var="unreadcount" items="${unreadcount}"
													varStatus="loop">
													<c:if test="${chatlist.room_no eq  unreadcount.room_no}">
														<c:if test="${unreadcount.unreadcount >0}">
															<h3 class="mb-2">
																<i class="bi bi-chevron-right"
																	style="color: yellow; font-size: 15px;"></i>
																<c:if test="${nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
																<c:if test="${nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>
																님께 채팅이 왔어요
															</h3>
														</c:if>
													</c:if>
												</c:forEach>
											</a>
										</c:forEach>
									</div>
									<div class="col mt-3">
										<div class="section-title">
											<h2 style="margin-bottom: 30px;">경매 알림</h2>
										</div>
										<c:forEach var="participationList"
											items="${participationList}" varStatus="loop">
											<c:if test="${participationList.status eq  'END'}">
												<a
													href="<c:url value="/board/auctionview.do"><c:param value="${participationList.auction_no}" name="no"/></c:url>"
													rel="lyteframe" data-gallery="portfolioDetailsGallery"
													id="view${loop.count}" data-glightbox="type: external"
													class="portfolio-details-lightbox"
													title="Portfolio Details">
													<h3 class="mb-2">
														<i class="bi bi-chevron-right"
															style="color: #00d4ff; font-size: 15px;"></i>
														${participationList.title}이(가) 낙찰되었어요
													</h3>
												</a>
											</c:if>
										</c:forEach>
										<c:forEach var="mypageAuctionList"
											items="${mypageAuctionList}" varStatus="loop">
											<c:if test="${mypageAuctionList.status eq  'SALE'}">
											<c:if test="${(mypageAuctionList.upper_Price - mypageAuctionList.base_Price)>0}">
													<a
														href="<c:url value="/board/auctionview.do"><c:param value="${mypageAuctionList.auction_no}" name="no"/></c:url>"
														rel="lyteframe" data-gallery="portfolioDetailsGallery"
														id="view${loop.count}" data-glightbox="type: external"
														class="portfolio-details-lightbox"
														title="Portfolio Details">
														<h3 class="mb-2">
															<i class="bi bi-chevron-right"
																style="color: #00d4ff; font-size: 15px;"></i>
															${mypageAuctionList.title}이의 최고가 ${mypageAuctionList.upper_Price}원으로 갱신되었어요
														</h3>
													</a>
												</c:if>
												<c:if test="${mypageAuctionList.likes>0}">
													<a
														href="<c:url value="/board/auctionview.do"><c:param value="${mypageAuctionList.auction_no}" name="no"/></c:url>"
														rel="lyteframe" data-gallery="portfolioDetailsGallery"
														id="view${loop.count}" data-glightbox="type: external"
														class="portfolio-details-lightbox"
														title="Portfolio Details">
														<h3 class="mb-2">
															<i class="bi bi-chevron-right"
																style="color: #00d4ff; font-size: 15px;"></i>
															${mypageAuctionList.title}에 ${mypageAuctionList.likes}개의 좋아요가 눌렸어요
														</h3>
													</a>
												</c:if>
											</c:if>
										</c:forEach>
									</div>
									<div class="col mt-3">
										<div class="section-title">
											<h2 style="margin-bottom: 30px;">동네생활 알림</h2>
										</div>
										<c:forEach var="comments" items="${comments}" varStatus="loop">
												<h3 class="mb-2">
													<i class="bi bi-chevron-right"
														style="color: #f27474; font-size: 15px;"></i>
													${comments.title}에 ${comments.likes }개의 좋아요와 ${comments.count}개의 댓글이 달렸어요
												</h3>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 가계부 시작 -->
			<div class="col mt-3" id="AccountBookToggleDiv" style="display: none">
				<div class="interests container">
					<div class="section-title">
						<h2 style="margin-bottom: 30px;">가계부 자바라</h2>
					</div>
					<div class="row">
						<div class="row">
							<div class="col-lg-12 col-md-6 mt-4 ">
								<div class="accountBook"
									style="display: flex; justify-content: start;">
									<span><i class="bi bi-graph-up-arrow"
										style="color: #d77566; font-size: 3rem;"></i></span>&nbsp;&nbsp; <span
										style="font-size: 25px; margin-top: 10px">판매건수</span>&nbsp;&nbsp;&nbsp;
									<div class="items" style="font-size: 25px;"></div>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 mt-4">
								<div class="accountBook"
									style="display: flex; justify-content: start;">
									<span><i class="bi bi-currency-dollar"
										style="color: #ffd500; font-size: 3rem;"></i></span>&nbsp;&nbsp; <span
										style="font-size: 25px; margin-top: 10px">판매금액</span>&nbsp;&nbsp;&nbsp;
									<div class="total" style="font-size: 25px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 가계부 끝 -->

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
						확인하기 위해 동네인증을 꼭 해주셔야 해요. <br /> <br />
						<div id="mapwrap">
							<div id="map" style="width: 1200px; height: 800px;"></div>
							<div class="category">
								<button onclick="search_map()" type="button"
									class="btn btn-dark" style="margin-right: 10px; width: 80px">검색</button>
								<button onclick="nowGeo()" type="button" class="btn btn-dark"
									style="margin-right: 10px; width: 80px">현위치</button>
								<button onclick="saveMarkerPosition()" type="button"
									class="btn btn-dark" style="width: 80px">동네 인증</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 후기 -->
			<div class="col mt-3" id="temperatureToggleDiv" style="display: none">
				<div class="row">
					<div class="skills container col"  >
						<div class="section-title" >
							<h2>나의 후기</h2>
						</div>
						<div style="display: flex">
							<div class="col starResult" style="padding: 10px 0px 20px 0px; flex:1;text-align: center;">
								<div>
									<h4 class="title text-bold" >평 점</h4>
								</div>
								<div class="col header" style="margin-top:50px;">
									<div class="rating col mt-1">
										<label for="rate-5" class="fa fa-star" id="1" style="font-size: 30px;"></label> <label
											for="rate-4" class="fa fa-star" id="2" style="font-size: 30px;"></label> <label
											for="rate-3" class="fa fa-star" id="3" style="font-size: 30px;"></label> <label
											for="rate-2" class="fa fa-star" id="4" style="font-size: 30px;"></label> <label
											for="rate-1" class="fa fa-star" id="5" style="font-size: 30px;"></label>
									</div>
								</div>
							</div>
							<div class="col" style="flex:2; text-align: center;">
								<div class="testimonial-item row" id="reviewContent" style="margin-top:8px;">
									<div>
										<h4 class="title text-bold">후기</h4>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
			</div>

			<div class="col-12 mt-3" id="ChatToggleDiv" style="display: none">
				<div class="testimonials container mt-3">
					<div class="section-title">
						<h2 style="margin-bottom: 30px;">나의 채팅</h2>
					</div>
					<div class="testimonials-slider swiper" data-aos="fade-up"
						data-aos-delay="100">
						<div class="swiper-wrapper">
							<c:forEach var="chatlist" items="${chatlist}" varStatus="loop">
								<div class="swiper-slide">
									<a
										href="<c:url value="/chat/chatting.do"><c:param value="${chatlist.townlist_no}" name="townlist_no"/><c:param value="${chatlist.product_no}" name="product_no"/><c:param value="${chatlist.auction_no}" name="auction_no"/><c:param value="${chatlist.userno}" name="writeuserno"/><c:param value="${chatlist.nickname}" name="wirtenickName"/></c:url>">
										<div class="testimonial-item">
											<p
												style="height: 200px; display: flex; align-items: center; justify-content: center;">
												<i class="bx bxs-quote-alt-left quote-icon-left"></i>
												${chatlist.chatcontent} <i
													class="bx bxs-quote-alt-right quote-icon-right"></i>
											</p>
											<c:if test="${nickname eq chatlist.writeusernickname }">
												<img class="testimonial-img"
													src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.senduserprofileimg}"
													alt="sunil">
											</c:if>
											<c:if test="${nickname ne chatlist.writeusernickname }">
												<img class="testimonial-img"
													src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/${chatlist.writeuserprofileimg}"
													alt="sunil">
											</c:if>
											<h3>
												<c:if test="${nickname eq chatlist.writeusernickname }"> ${chatlist.sendusernickname} </c:if>
												<c:if test="${nickname ne chatlist.writeusernickname }"> ${chatlist.writeusernickname} </c:if>
											</h3>
											<h4>
												<fmt:formatDate value="${chatlist.sendtime}"
													pattern="yyyy년 MM월 dd일" />
											</h4>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-pagination"></div>
					</div>
					<div class="owl-carousel testimonials-carousel"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>



<!-- 토글 클릭 이벤트 -->
<script type="text/javascript">
      $(function() {
          $("#AccountBookToggle").click(function() {
             $("#AccountBookToggleDiv").toggle(1000);
             if ($("#KeyToggleDiv").style === '')
                $("#KeyToggleDiv").toggle(1000);
             $.ajax(
                     {
                        type : "POST",
                        url: '<c:url value="/userinfo/accountbook.do"/>',
                        data:{'${_csrf.parameterName}' : "${_csrf.token}"},
                        success: function(result){
                        	var re = JSON.parse(result);
                        	console.log(re.items);
                        	console.log(re.total);
                        		$('.items').html(re.items+"건").css("margin-top", "10px");
                        		$('.total').html(re.total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원").css("margin-top", "10px");
                        }
                     }
                  )
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
            $('#ALlToggle').click(function() {
            	$("#AccountBookToggleDiv").hide(1000);
            	$("#KeyToggleDiv").hide(1000);
            	$("#ChatToggleDiv").hide(1000);
            	$("#MapToggleDiv").hide(1000);
            	$("#temperatureToggleDiv").hide(1000);
            });
            $('#LikeToggle').click(function() {
                $("#LikeToggleDiv").toggle(1000);
             });
            $('#temperatureToggle').click(function() {
                $("#temperatureToggleDiv").toggle(1000);
                $.ajax(
                        {
                           type : "POST",
                           url: '<c:url value="/mypage/review_return.do"/>',
                           data:{'${_csrf.parameterName}' : "${_csrf.token}",
                              'userno' : ${userno}  
                           },
                           success: function(result){
                              console.log("result",result);
                              $('.starRe').remove();
                              var starAvg = 0;
                              //var html = "<div class='row'>";
                              result.forEach(function (el, index) {
                                 starAvg += el.review_star;
                                 console.log("stars"+ index +" : " + el.review_star);
                                 console.log("text : " + el.review_content);

                                 html =  '<div class="col starRe" style="background: rgba(255, 255, 255, 0.08);align-items: center; padding: 10px; margin-right:20px;border-radius: 10px;">'+
                                        '<span style="height: 100px; display: flex; align-items: center; justify-content: center;">'+
                                        ' <i class="bx bxs-quote-alt-left quote-icon-left" style="font-size:0.5rem;"></i>'
                                           + '&nbsp;'+ el.review_content +'&nbsp;' +'<i class="bx bxs-quote-alt-right quote-icon-right" style="font-size:0.5rem;"></i>'+
                                         '</span>'+
                                         '<div>';
                                     
                                  $("#reviewContent").append(html);
                              });
                              //html += "</div>";
                        starAvg=parseInt(starAvg / result.length);
                        for(var i=starAvg; i> 0; i-- ){
                           $('#'+i).css("color", "#f7bb00").css("opacity", "1").css("filter", "drop-shadow(0 0 10px rgba(247, 255, 0, 0.5))");
                        }
                              console.log(parseInt(starAvg / result.length));
                              
                             
                        
                           }
                           
                        }
                     )
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

          var nowProfile = $(".profile-photo").attr('src');

          $(".file-upload").change(function() {
             var fileForm = /(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$/;
             if (!$('.file-upload').val().match(fileForm)) {
                $('.file-upload').val(null);
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

          $("#profileImgTag").click(function() {
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
          
      	

        	$("#editprofileimg").change(function() {
        		var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
        		if (!$('#editprofileimg').val().match(fileForm)) {
        			addMessage('jpg,jpeg,png타입만 선택 가능합니다.', $('#editprofileimg'));
        			$('#editprofileimg').val(null);
        		}
        		readURL(this);
        			
        	});

        	$("#editImgTag").click(function() {
        		$("#editprofileimg").click();
        	});

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
                                     // console.log(marketlat);
                                     // console.log(markerlng);
                                  }
                               });                                               
                      });

          // 내 위치로 이동
          function nowGeo() {
                         markerlat=37.478745014709745;
                         markerlng=126.8787909892446;
                         setCenter(37.478745014709745, 126.8787909892446);
                         showKakaoMap(37.478745014709745, 126.8787909892446);
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
                         markerlat=result.y;
                         markerlng=result.x;
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
          }
          function searchDetailAddrFromCoords(coords, callback) {
              // 좌표로 법정동 상세 주소 정보를 요청합니다
              geocoder.coord2Address(coords.getLng(), coords.getLat(),
                    callback);
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
                 $('#myPay').text(result
                        .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                        +'원')
                        $('#myPay').attr('title', result)      
                    
                     }
                    }); 
             
           
             
            // 자바라페이 출금
            function payWithdraw() { 
               var amount =  parseInt($('#myPay').attr('title')); // 잔액
               // console.log('amount',amount);
               var selected = $('#pay option:selected').val(); // 출금액
               // console.log('selected', selected);
               // console.log('amount < selected',amount < selected);
               // console.log(typeof amount);
               // console.log(typeof selected);
	               
	               if(amount < selected) { // 출금액이 잔액보다 클 경우 출금 정지
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
	                               'withdraw' : selected,
	                             '${_csrf.parameterName}' : '${_csrf.token}'
	                           },
	                         dataType : "text",
	                         success : function(result){
	                         // console.log(result);
	                            $('#myPay').text(result
	                                  .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	                                +'원')
	                                $('#myPay').attr('title', result)   
	                         }
	                           
	                        });  
	               }
           	}
           
          // 자바라페이 잔액 충전: 직접 입력
		  $(function(){
	             $('#payboxDirect').hide();	              
	             $('#pay').change(function(){
	                if($("#pay").val() == "direct") {
	                   $("#payboxDirect").show();

	                 }  else {
	                    $("#payboxDirect").hide();
	                 }                
	              }) 
	              })
           	
          function selectamount(){ }
          
          
           // 자바라페이 잔액 충전
           var IMP = window.IMP;
           IMP.init('imp74932749'); 

           function payService() {
        	   // 충전액
               var amount = $('#payboxDirect').val();
    		   
               // 사용자 정보 얻기
               var email = '${email}';
               var nickname = '${nickname}';
               var address = '${address}';
               var phonenumber = '${phonenumber}';
              
               // console.log(amount);
             
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
                                 // console.log(amount);
                                 $('#payModal').modal('hide');
                                 
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
                                       $('#myPay').text(result
                                             .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                                            +'원')
                                       $('#myPay').attr('title', result)  
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
                           $('#payModal').modal('hide');
                     }
           
           
           var geocoder = new daum.maps.services.Geocoder();
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
         				geocoder.addressSearch(addr, function(results, status) {
         	                if (status === daum.maps.services.Status.OK) {
         	                   var result = results[0];
         	                   $('#latitude').val(result.y);
         	                   $('#longitude').val(result.x);                   
         	                }
         	             });
         				document.getElementById("editfulladdress").value = addr;
         				$('#nextBtn').focus();
         			}
         		}).open();
         	}
</script>