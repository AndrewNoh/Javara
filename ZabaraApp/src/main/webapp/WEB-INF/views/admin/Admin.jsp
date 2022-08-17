<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div class="animsition">
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
            </header>
            <!-- HEADER DESKTOP-->
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 mt-3 pt-3">총 회원수</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>총회원수 : ${userCount }</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div id="chart_div1"  style="margin-left: 22px; padding-left: 22px;"></div>
                                <hr/>
                                <div id="chart_div2"  style="margin-left: 22px; padding-left: 22px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
    </div>
</div>

<script type="text/javascript">

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
	
	
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['ㅎㅎㅎ', ${userCount }],
          ['ㅎㅎㅎ', 3],
          ['ㅎㅎㅎ', 3]
        ]);

        // Set chart options
        var options = {'title':'전체글 갯수',
                       'width':1500,
                       'height':700};       
        
		
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
        
     	// Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['ㅎㅎㅎ', 3],
          ['ㅎㅎㅎ', 3],
          ['ㅎㅎㅎ', 3]
        ]);

        // Set chart options
        var options = {'title':'전체글 갯수',
                       'width':1500,
                       'height':700};       
        
		
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
      
</script>

