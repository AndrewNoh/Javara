<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="position: fixed;bottom: 5%; right: 3%;">
   <a href="#portfolio"><img src="${pageContext.request.contextPath}/resources/assets/img/scrollbar_btn.png" 
      title="위로가기" style="width: 80px; height: 80px"></a>
</div>

<form action="<c:url value="/board/productlist.do"/>" method="post">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   
   <div id="portfolio" class="portfolio  m-5">
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
                       <div style="background-color: rgb(0 0 0 / 50%); justify-content-end;">
                          <a href="<c:url value="/admin/deleteAdminAuction.do">
                         <c:param name="auction_no" value="${LIST.auction_no }"/>
                         </c:url>" id="delete">
                        <i class="bx bxs-trash p-2 d-flex justify-content-end" style="font-size: 30px" title="삭제"></i></a>   
                        <div class="form-group mb-3" style="padding: 10px 15px;">
                           <div style="font-size: 23px;font-weight: bold; color: #85adad">${LIST.title}</div>
                        </div>
                        
                        <div class="form-group mt-2" >
                           <div style="padding: 10px 18px;">${LIST.content}</div>
                        </div>                        
                      </div>                      
                  </div>                                               
               </c:forEach>                  
            </div>         
          </c:if>        
      </div>
</form>
