<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="animsition">
	<form action="forms/contact.php" method="post" role="form">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="page-wrapper">	
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                    	<li>
	                    	<a href="<c:url value="/location/MainPage.do"/>">
						      	<img src="${pageContext.request.contextPath}/resources/assets/img/sub_banner.png" style="text-align: center;"/>
						    </a>
					    </li>
                        <li>
                            <a href="<c:url value="/admin/admin.do"/>">총 회원수</a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/adminauction.do"/>">신고글 관리</a>                                
                        </li>
                        <li>
                            <a href="<c:url value="/admin/admingropboard.do"/>">동네글 관리</a>                                
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop ">
                <div class="section__content section__content--p30 ">
                    <div class="d-flex justify-content-end">
                        <div class="header-wrap">
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu ">
                                        <div class="content">
                                            ${nickname}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->
            <!-- MAIN CONTENT-->
            <div class="main-content">
            	<c:if test="${empty LISTS}" var="LIST">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">동네글 관리</h2>
                                <div class="portfolio-wrap d-flex justify-content-center">
                                    <h4>게시글이 없습니다.</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </c:if>
              <c:if test="${!LIST}">  
         <div style="padding-left: 30px;">
          <h2>동네글 관리</h2>           
            <div class="row portfolio-container" id="list">            
               <!-- 게시글 한블럭 -->
               <c:forEach var="LIST" items="${LISTS}" varStatus="loop">
                  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                   <div class="col-lg-10 col-md-10 pt-3 portfolio-item filter-${LIST.category}">
                       <div class="mt-2 pt-2" style="background-color: rgb(0 0 0 / 30%); justify-content-end;">
                          <a href="<c:url value="/admin/deleteAdminTown.do">
                         <c:param name="townlist_no" value="${LIST.townlist_no }"/>
                         </c:url>" id="delete">
                        <i class="bx bxs-trash p-2 d-flex justify-content-end" style="font-size: 30px" title="삭제"></i></a>   
                          <div style="padding: 10px 15px;" >${LIST.nickName}</div>
                        <div class="form-group" style="padding: 8px 8px;">
                           <div style="font-size: 23px;font-weight: bold; color: black">${LIST.title}</div>
                        </div>
                        
                        <div class="form-group" >
                           <div style="padding: 10px 10px; color: black">${LIST.content}</div>
                        </div>                        
                      </div>
                  </div>                     
               </c:forEach>                           
            </div>
           </div>        
          </c:if>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
    </div>
    </form>
</div>


<script>

	$(document).ready(function() {
		$('#navbar').hide();
		$('#top_banner').hide();
		$('#header').hide();
		$('#logoutForm').hide();
		$('.main_container').hide();
	})
	
	$(document).ready(function() {
		//관리자페이지 css먹이기
		$("link#admin").prop('disabled', false);
		$("link#admin1").prop('disabled', false);
		$("link#admin2").prop('disabled', false);
		$("link#admin3").prop('disabled', false);
		$("link#admin4").prop('disabled', false);
		$("link#admin5").prop('disabled', false);
		$("link#admin6").prop('disabled', false);
		$("link#admin7").prop('disabled', false);
		$("link#admin8").prop('disabled', false);
		$("link#admin9").prop('disabled', false);
		$("link#admin10").prop('disabled', false);
		$("link#admin11").prop('disabled', false);
		$("link#admin12").prop('disabled', false);
		$("style").prop('disabled', false);
	});

</script>


