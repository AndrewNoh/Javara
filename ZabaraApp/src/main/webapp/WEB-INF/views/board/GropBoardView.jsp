<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- ======= 동내 Section ======= -->
 
 <div style="position: fixed;bottom: 50px; right: 30px; z-index: 1000;">
  <a href="<c:url value="/board/gropboardwrite.do"/>"><i class="bx bx-plus-circle" title="글쓰기" style="font-size: 50px"></i></a>
  </div>
  <div style="position: fixed;bottom: 110px; right: 30px; z-index: 1000;">
  <a href="#portfolio"><i class="bx bxs-caret-up-circle" title="위로가기" style="font-size: 50px"></i></a>
</div>
 
  <div id="board" class="contact">
    <div class="container">

      <div class="section-title">
        <h2>동내생활</h2>
        <p>동내사람들과 이모저모</p>
      </div>

      <div class="row mt-2">

      <form action="forms/contact.php" method="post" role="form" class="php-email-form mt-4">
        <div class="row">
          <div class="col-md-6 form-group" >
           <div style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;"> 김동내씨</div>
          </div>
          <div class="col-md-6 form-group mt-3 mt-md-0" >
            <div style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;"> 동내생활 카테고리</div>
          </div>
        </div>
        <div class="form-group mt-3" style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;">
          <div> 동내생활 꾸르잼</div>
        </div>
        <div class="form-group mt-3" style=" background-color: rgba(255, 255, 255, 0.08); padding: 10px 15px;">
          <div>동내생활 베리베리 꾸르잼이랍니다.</div>
        </div>
        <div class="my-3">
          <div class="loading">Loading</div>
          <div class="error-message"></div>
          <div class="sent-message">Your message has been sent. Thank you!</div>
        </div>
        <div class="text-center">
        	<button type="submit" href="<c:url value="/board/gropboardedit.do"/>" class="btn btn-outline">수정</button>
        	<button type="submit" class="btn btn-outline">삭제</button>
         	<button type="submit" class="btn btn-outline">취소</button>	
        </div>
      </form>

    </div>
  </div><!-- End 동내 Section -->