<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="<c:url value="https://code.jquery.com/jquery-3.6.0.js"/>"></script>
<script src="<c:url value="https://code.jquery.com/ui/1.13.2/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>

<style>
.bAddr {
   color: #ffc107;
   background: #616161DB;
   width: 100%;
   height: 100%;
   margin: 8px;
   border-radius:4px;
   text-align: center;
   font-weight: bold;
}

.addressItem{
	cursor: pointer;	
}

#infobox {
    display: block;
    background: #50627F;
    color: #fff;
    text-align: center;        
    border-radius:4px;
}

#viewMap {
   position: relative;
   overflow: hidden;
   margin-top: 10px;
}
#addressitemlist{
	position:absolute;
	top:250px;left:10px;	
	border-radius: 5px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}
.map_wrap, .map_wrap * { 
  margin:0; padding:0;font-family:'Malgun Gothic',dotum,'맑은 고딕',sans-serif;font-size:14px;
  font-weight: bold; 
}
.map_wrap {position:relative;width:auto;height:350px; }
#filter {position:absolute;top:10px;left:10px;border-radius: 5px; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#mapwrap_category {
   position: relative;
   overflow: hidden;
   
}

.map_category li:hover {background: #0059ac; }
.map_category, .map_category * {
   margin: 0;
   padding: 0;
   color: #000;
   
}

.map_category {
   position: absolute;
   overflow: hidden;
   top: 10px;
   left: 10px;
   width: auto;
   height: 50px;
   z-index: 10;
   border: none;
   font-size: 12px;
   text-align: center;
   background-color: #006a94;
   background-color: rgba(17, 174, 226);
   
  

}

.map_category li {
   list-style: none;
   float: left;
   width: 89px;
   height: auto;
   padding-top: 5px;
   cursor: pointer;
   font-weight: bold;
   
}




.ui-slider-range { background: #ffce08f3; }
input.form-text {
        border: 1px solid #bcbcbc;
        border-radius: 10px;
        width: 260px;
        height: 28px;
      }
     
</style>
<div class="row" style="margin:30px;">  
	<div class="col-lg-3" id="searchTab">
		<div class="map_menu">
			<div id="map_wrap" class="row">		    
			    <div class="map_menu">
			        <ul id="filter" style="height: 235px; margin-top: 120px;">
			          <label style="font-weight:bold; margin-top: 20px;">주소 검색</label>
			          <br/>
			          <input style="margin-top: 10px; width: 275px;" onclick="search_map()" placeholder="주소를 검색하세요.";>
			            
			            <button class="btn btn-outline" onclick="search_map()" type="button">검색</button>
			              <p>
			                <label for="amount" style="font-weight:bold; margin-top: 10px;">가격 범위</label>
			                <input type="text" id="amount" readonly style="border:0; color:#7a7a7a; font-weight:bold;">
			              </p>              
			              <div id="slider-range" style="width: 300px; "></div>
			              <br/>
			              <button type="button" class="btn btn-primary" style="width: 150px; margin-left: 150px;">검색</button>
			
			        </ul>
			    </div>		    	
		 	</div>
		 	<div id="addressItemListDiv" class="row">
		 		<ul id="addressitemlist" style="width:370px; height: 615px; margin-top: 120px;">
			        <li id="addressItemListTitle" style="text-align:center; margin-top:10px;"><h3>아이템 목록</h3></li>
			        <hr/>	
			              
			    </ul>			   
			</div>
		</div>
	 </div>
	 <div class="col container" id="viewMap" style="margin-right">
		 <div class="map_category" style="border-radius: 20px;" id="categorySelector">
		     <ul>
		        <li style="color: #fff;">유아동</li>
		        <li style="color: #fff;">유아도서</li>
		        <li style="color: #fff;">여성잡화</li>
		        <li style="color: #fff;">여성의류</li>
		        <li style="color: #fff;">뷰티/미용</li>
		        <li style="color: #fff;">도서/티켓/음반</li>
		        <li style="color: #fff;">중고차</li>
		        <li style="color: #fff;">디지털기기</li>
		        <li style="color: #fff;">가구/인테리어</li>
		     </ul>
		     <ul>
		      <li style="color: #fff;">기타중고물품</li>
		      <li style="color: #fff;">게임/취미</li>
		      <li style="color: #fff;"> 생활가전</li>
		      <li style="color: #fff;">생활/가공식품</li>
		      <li style="color: #fff;">남성패션/잡화</li>
		      <li style="color: #fff;">반려동물용품</li>
		      <li style="color: #fff;">식물</li>
		      <li style="color: #fff;">스포츠/레저</li>
		      <li style="color: #fff;">인기매물</li>
		
		     </ul>
	     </div>
		 <div id="map" style="height: 800px;" value="${address}"></div>
	 </div>
 </div>
<script>
var latitude = ${latitude};
var longitude = ${longitude};
var nowAddress = "${address}";
var geocoder = new daum.maps.services.Geocoder();
var container = document.getElementById('map');
var categoryArray=[];
var categoryInfoArray=[];
var categoryDetailInfoArray=[];
var itemData=[];
var imageSize = new kakao.maps.Size(60, 65);
var addressContent= '<div id="addressbox">'+
					'<div class="bAddr">'+ nowAddress + '</div>' +
					'</div>';
var options = { 
      center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
      level : 3       
   };
var detailInfo = new daum.maps.InfoWindow({zindex : 2});
var map = new daum.maps.Map(container, options);
var addressMarker = new daum.maps.Marker(),addressinfowindow = new daum.maps.InfoWindow({zindex : 1});

addressMarker.setPosition(new kakao.maps.LatLng(latitude, longitude));
addressinfowindow.setContent(addressContent);
addressMarker.setMap(map);
addressinfowindow.open(map,addressMarker);




$(function(){
	$( "#slider-range" ).slider({
	  range: true,
	  min: 0,
	  max: 500,
	  values: [ 75, 300 ],
	  slide: function( event, ui ) {
	    $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
	  }
	});
	$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
	  " - $" + $( "#slider-range" ).slider( "values", 1 ) );
	infoboxcss('#addressbox');
});


function categoryItemList(){
	var categoryimage;
	$.ajax({
        type : 'POST',
        url : '<c:url value="/board/myAddressItemList.do"/>',
        data : {nowAddress : nowAddress,category : category,'${_csrf.parameterName}' : '${_csrf.token}'},
        async: false,
        success : function(result) {
        	if(result!=null){        		
                for(var i=0; i<result.length;i++){
                	console.log(result[i]);
                	switch(result[i].category){
	                    	case "디지털기기": categoryimage="category_digital.png";
	                    		break;
	                    	case "중고차": categoryimage="category_car.png";
	                    		break;
	                    	case "생활가전": categoryimage="category_life.png";
	                    		break;
	                    	case "가구/인테리어": categoryimage="category_furniture.png";
	                    		break;
	                    	case "유아동": categoryimage="category_baby.png";
	                    		break;
	                    	case "유아도서": categoryimage="category_baby_book.png";
	                    		break;
	                    	case "생활/가공식품": categoryimage="category_life_style.png";
	                    		break;
	                    	case "스포츠/레저": categoryimage="category_sports.png";
	                    		break;
	                    	case "여성잡화": categoryimage="category_bag.png";
	                    		break;
	                    	case "여성의류": categoryimage="category_women.png";
	                    		break;
	                    	case "남성패션/잡화": categoryimage="category_man.png";
	                    		break;
	                    	case "게임/취미": categoryimage="category_hobby.png";
	                    		break;
	                    	case "뷰티/미용": categoryimage="category_beatuty.png";
	                    		break;
	                    	case "반려동물용품": categoryimage="category_pet.png";
	                    		break;
	                    	case "도서/티켓/음반": categoryimage="category_book.png";
	                    		break;
	                    	case "식물": categoryimage="category_plant.png";
	                    		break;
	                    	case "기타중고물품": categoryimage="category_etc.png";
	                    		break;                		
                	}////switch                	
                	var categorymarker = new kakao.maps.Marker({		                            
                        position: new kakao.maps.LatLng(result[i].latitude, result[i].longitude), // 마커를 표시할 위치	                            
                        image : new kakao.maps.MarkerImage('/marketapp/resources/assets/img/categorymarker/'+categoryimage, imageSize) // 마커 이미지 
                    });
                	var categoryInfo = new daum.maps.InfoWindow({
                		zindex : 1,
                		position : new kakao.maps.LatLng(result[i].latitude, result[i].longitude)
                		});
                	content = '<div id="infobox">' +
                			  '<div class="bAddr">' + result[i].title + '</div>' +		                    			  		                    			  
                			  '</div>';

            	    var detailcontent = '<div>'+
						  				  '<div>'+result[i].title+'</div>'+
						  				  '<div>시작가: ₩'+result[i].base_Price+'</div>'+
						  				  '<div>최고가: ₩'+result[i].upper_Price+'</div>'+
						  				  '<div>조회수:'+result[i].viewCount+'</div>'+
						  			      '<div>마감일:'+result[i].endDate+'</div>'+
						  			    '</div>';			        
			        categoryDetailInfoArray.push(detailcontent);			        
			        
                    categoryInfo.setContent(content);
                    categoryInfoArray.push(categoryInfo);
                    categoryArray.push(categorymarker);
                    itemData.push(result[i]);
                    createListTag(result[i]);
                	}///for                	
                	openCategoryList();
                	panTo(latitude,longitude);
                	
            	 }////if
        }////success
     });
	
}

//카테고리마커 및 인포윈도우 켜기
function openCategoryList(){		
	for(var i=0;i<categoryArray.length;i++){
		categoryArray[i].setMap(map);
		categoryInfoArray[i].open(map,categoryArray[i]);
	}
	infoboxcss('#infobox');
}

//카테고리마커 및 인포윈도우 끄기
function closeCategoryList(){
	if(categoryArray!=null){
		for(var i=0;i<categoryArray.length;i++){			
			categoryInfoArray[i].close(map,categoryArray[i]);
			categoryArray[i].setMap(null);
		}
		categoryArray=[];
		categoryInfoArray=[];
		detailInfo.close();
		categoryDetailInfoArray=[];
	}
}

//카테고리 선택시 마커표시 및 인포윈도우 아이템리스트 뿌려주기
$('#categorySelector').click(function(e){	
	panTo(latitude,longitude);
	if(e.target.nodeName=='LI'){
		closeCategoryList();
		$('.addressItem').remove();
		category=e.target.textContent;
		categoryItemList();
		
		for(let i=0;i<categoryDetailInfoArray.length;i++){		
			kakao.maps.event.addListener(categoryArray[i], 'click', function() {
				detailInfo.setContent(categoryDetailInfoArray[i]);				
				detailInfo.open(map, categoryArray[i]);
	    	    
	    	});
		}
	}	
	
});


$(document).on("click",'.addressItem',function(e){	
	 var callLatitude =$(this).find('input:eq(0)').val();
	 var callLongitude=$(this).find('input:eq(1)').val();	 
	 panTo(callLatitude,callLongitude);
});



//infobox 디자인 변경
function infoboxcss(selector){
	var infoboxselector= document.querySelectorAll(selector);
	infoboxselector.forEach(function(e) {
	    var w = e.offsetWidth + 10;
	    var ml = w/2;
	    e.parentElement.style.top = "15px";
	    e.parentElement.style.left = "50%";
	    e.parentElement.style.marginLeft = -ml+"px";
	    e.parentElement.style.width = w+"px";
	    e.parentElement.previousSibling.style.display = "none";
	    e.parentElement.parentElement.style.border = "0px";
	    e.parentElement.parentElement.style.background = "unset";
	});
}





function createListTag(object){
		
	var ul = $('#addressitemlist');
	var li = '<li style="border:1px solid; margin:2px;" class="addressItem">'+
					'<div class="row">'+
						'<div class="col-5">'+
							'<img style="width:100%;height:100%;" src="${pageContext.request.contextPath}/resources/assets/img/product_img/'+object["imagename"]+'">'+
						'</div>'+
						'<div class="col">'+
							'<div style="text-align:center; font-weight:bold;">'+object["title"]+'</div>'+
							'<hr/>'+
							'<div>시작가: ₩'+object["base_Price"]+'</div>'+
							'<div>최고가: ₩'+object["upper_Price"]+'</div>'+
							'<div>조회수:'+object["viewCount"]+'</div>'+
							'<div>마감일:'+object["endDate"]+'</div>'+
							'<input type="hidden" name="latitude" value="'+object["latitude"]+'"/>'+
							'<input type="hidden" name="longitude" value="'+object["longitude"]+'"/>'+
						'</div>'+
					'</div>'+
			'</li>';	
	ul.append(li);	
	ul.attr('style','overflow-y: scroll;width:370px; height: 615px; margin-top: 120px;');
	}



//주소 검색
function search_map() {
   new daum.Postcode({
      oncomplete : function(data) {
         var addr = data.address; // 최종 주소 변수
         console.log(addr);
         // 주소 정보를 해당 필드에 넣는다.         
         $('#map').val(addr);
         // 주소로 상세 정보를 검색
         geocoder.addressSearch(addr, function(results,
               status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {
               var result = results[0]; // 첫번 째 결과의 값을 활용
               // 지도를 보여준다                
               addressMarker.setPosition(new kakao.maps.LatLng(result.y, result.x));
               addressContent='<div class="bAddr">'+ addr + '</div>';
               addressinfowindow.setContent(addressContent);
               addressMarker.setMap(map);               
               addressinfowindow.open(map,addressMarker);
               setCenter(result.y, result.x);
               latitude=result.y;
               longitude=result.x;
               nowAddress=addr;               
            }
         });
      }
   }).open();
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





</script>