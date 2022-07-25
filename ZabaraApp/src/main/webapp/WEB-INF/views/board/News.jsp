<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>
.title {
   font-size: 20pt;
   height: 60px;
   margin-bottom: 10px;
}
table tr {
   text-align: center;
}
.big {
   width: 50%;
   margin: auto;
   align: center;
   margin-top: 20px;
   border-radius: 15px;
}

div {
   text-align: center;
}
td
   {
   border-collapse: separate;
   border-spacing: 1px;
   border: 3px solid #ffe4e4;
   width: 60%;
   align: center;
   height: 60px;
   text-align: center;
}
h3{
   text-align: center;
   
}
.newsTitle{
   font-size:47px;
}
a{
   color:#000000;
}
img{
	float:right;
}
</style>

<div class="mt-5" style="display:flex">
	<div style="flex:3">
	   <img src="${pageContext.request.contextPath}/resources/assets/img/${info}" class="ml-5" style="object-fit: contain; width:400px; height:400px">
	
	</div>
   <div style="font-size: 32px; flex:2; text-align:left;" class="mt-5"><strong>${simpleAddress}의 날씨 </br> ${temperate}</strong></div> ${slash}
</div>

   <table class="big">
   
      <tr class="title">
         <th colspan="2" class="newsTitle">${simpleAddress} 뉴스</th>
      </tr>
      <tbody>
         <tr>
               <c:forEach var="url" items="${urls}" varStatus="status" begin="1" end="${titles.size()}">
                  <c:if test="${titles[status.index]!=''}">
                     <tr class="text-center"> 
                        <td style="font-weight: bold;"><a href="${url}">${titles[status.index]}</a></td>
                     </tr>
                  </c:if>
               </c:forEach>
      
         
         </tr>
      </tbody>
   </table>