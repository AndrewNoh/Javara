<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!-- Start Welcome area -->
            <!-- Mobile Menu end -->
             <div class="container">
	<div class="section-title">
        <h2>자바라 관리자 페이지</h2>
      </div>
	<div class="messaging ">
		<div class="inbox_msg">
			<div class="inbox_people">
			<div class="css-1r0o66s">
				<div class="chat-header-profile">							
							<div class="main-title" >
							<input type="hidden" id="nickname" name="nickname"/>
							</div>
						</div>
					</div>
			  </div>
			 
<!-- Template -->			
	   	
       <!--Console Content-->
		   
			<div class="flex flex-wrap">		
                <div class="w-full md:w-1/2 xl:w-1/3 p-3">
                    <!--Metric Card-->
                    <div class="bg-gray-900 border border-gray-800 rounded shadow p-2">
                        <div class="flex flex-row items-center">
                            <div class="flex-shrink pr-4">
                                <div class="rounded p-3 bg-orange-600"><i class="fas fa-users fa-2x fa-fw fa-inverse"></i></div>
                            </div>
                            <div class="flex-1 text-right md:text-center">
                                <h5 class="font-bold uppercase text-gray-400">총 누적 회원수</h5>
                                <h3 class="font-bold text-3xl text-gray-600">${userCount}명<span class="text-orange-500"><i class="fas fa-exchange-alt"></i></span></h3>
                            </div>
                        </div>
                    </div>
                    <!--/Metric Card-->
                </div>
    