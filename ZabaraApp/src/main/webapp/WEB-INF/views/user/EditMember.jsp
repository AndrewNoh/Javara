<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="container">
			<div class="row mb-5 align-items-end text-center">
				<div class="col"></div>
				<div class="col-md-6" data-aos="fade-up">
					<h2>My Page</h2>
					<p class="mb-0 mt-1">회원정보 수정</p>
				</div>
				<div class="col"></div>
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col-md-6 mb-5 mb-md-0 " data-aos="fade-up">
					<form action="forms/contact.php" method="post" role="form" class="php-email-form ">
						<div class="testimonial p-3">
		                  <img src="${pageContext.request.contextPath}/resources/assets/img/person_2.jpg" alt="Image" class="img-fluid mx-auto d-block " style="border-radius: 30%" width="40%" height="50%">
		                </div>
		                <div class="custom-file mb-5">
					      <input type="file" class="custom-file-input" id="customFile" name="filename">
					      <label class="custom-file-label" for="customFile">Choose file</label>
					    </div>
							
						<div class="row gy-3 justify-content-center">
							<div class="col-md-12 form-group">
								<label>ID</label> 
								<input type="text" class="form-control" name="id" id="id" disabled>
							</div>
							<div class="col-md-12 form-group">
								<label>Password</label> 
								<input type="password" name="pwd" class="form-control" id="pwd" required>
							</div>
							<div class="col-md-12 form-group">
								<label>Name</label> 
								<input type="text" name="name" class="form-control" id="name" required>
							</div>
							<div class="col-md-12 form-group">
								<label>Address</label> 
								<input type="text" class="form-control" name="addr" id="addr" required>
							</div>


							<div class="col-md-6 mt-0 form-group">
								<input type="submit" class="readmore d-block w-100 my-3"
									value="수정">
							</div>
						</div>

					</form>
				</div>
				<div class="col"></div>
			</div>
		</div>
