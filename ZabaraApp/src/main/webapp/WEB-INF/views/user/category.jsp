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
   color: #fff;
   background: #006600;
   width: auto;
   height: auto;
   margin: 8px;
   border-radius:6px;
   text-align: center;
   font-family: 'GmarketSansLight';
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
  margin:0; padding:0; font-size:14px;
  font-weight: bold; 
 
}
.map_wrap {position:relative;width:auto;height:350px;  }
#filter {position:absolute;top:10px;left:10px;border-radius: 5px; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#mapwrap_category {
   position: relative;
   overflow: hidden;
 
}


.map_category li:hover {background: #fff; }


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
   background-color: #212529;

}

.map_category li {
   list-style: none;
   float: right;
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
     
.overlayContainer{
  display:flex;
  justify-content:center;
  gap:20px;
  flex-wrap:wrap;
}
.overlayContainer .card{
  max-width:100%;
  width:350px;
  height:370px;
  background:#fff;
  border-radius:5px;
  position:relative;
  transition:all .2s ease;
}
.overlayContainer .card:hover{
  box-shadow:2px 2px 3px rgba(0,0,0,.1);
  cursor:pointer;
  transform:translateY(-10px);
}
.overlayContainer .card:hover .btn{
  visibility:visible;
}
.overlayContainer .card:hover img{
  filter:brightness(1);
}
.card .card-img{
  background:gray;
  width:350px;
  height:270px;
  z-index:990;
  border-radius:5px 5px 0 0;
}
.card-img img{
  width:100%;
  height:100%;
  filter:brightness(.7);
  border-radius:inherit;
  transition:.2s ease-in-out;
}
.card .card-action{
  padding: 10px;
  margin:25px 0 0 20px;
  display:flex;
  position:relative;
  flext-direction:column;
  justify-content:space-between;
}

.card .card-img .circle {
  width: 40px;
  height: 40px;
  background-color: #fff;
  position: absolute;
  bottom: 80px;
  left: 15px;
  border: 1px solid #ff0;
  border-radius:50%;
  box-shadow:0 6px 10px rgba(0,0,0,.3);
/*   z-index: 999; */
  display:flex;
  justify-content:center;
  align-items:center;
}
.card .card-img .circle img{
  width:60%;
  position:abolute;
  user-select:none;
}
.card .card-action .title{
  font-size: 22px;
  letter-spacing:2px;
  font-style:bold;
}
.card .card-action span{
  font-size:12px;
  color:gray;
  letter-spacing:2px;
}

.btn-download .btn{
  padding:10px;
  border:none;
  visibility:hidden;
  border-radius:5px;
  background: #41d9c2;
  color:#fff;
  cursor:pointer;
  outline:none;
  box-shadow: 2px 2px 4px rgba(0,0,0,.1);
  transition:all .2s ease-in-out;
}
.btn-download .btn:hover{
  background: #29d654;
}

     
.title{
   display:block;
   white-space:nowrap;
   overflow:hidden;
   text-overflow:ellipsis;
}     

</style>
<div class="row" style="margin:30px;">  
   <div class="col-lg-3" id="searchTab">
      
          <div id="addressItemListDiv" class="row">
             <ul id="addressitemlist" style="width:350px; height: 990px; margin-top: -110px; ">
                 <li id="addressItemListTitle" style="text-align:center; margin-top:15px;">
                    <h3 style="font-size: 20px; font-weight: bold;">판매 리스트</h3></li>
               <hr/>
             </ul>            
         </div>
       </div>
    <div id="viewMap" style="margin-right: 20px">
       <div class="map_category" style="margin-left: 630px; font-family: 'GmarketSansMedium';" id="categorySelector">
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
       <div id="map" style="border-radius: 20px; height: 1000px; margin-left: 325px" value="${address}"></div>
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
var overlayLatLng=[];

var imageSize = new kakao.maps.Size(60, 65);
var addressContent= '<div id="addressbox">'+
               '<div class="bAddr">'+ nowAddress + '</div>' +
               '</div>';
var options = { 
      center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
      level : 3       
   };
   
var customOverlay = new kakao.maps.CustomOverlay({    
    xAnchor: 0.3,
    yAnchor: 0.91
});
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
           if(result!=""){              
                for(var i=0; i<result.length;i++){                   
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
                           '<div class="bAddr title" style="width:150px;">' + result[i].title + '</div>' +                                                                          
                           '</div>';

                   var detailcontent = '<div id="app" class="overlayContainer">'+
                     '<div class="card">'+
                     '<div class="card-img">'+
                     '<img src="${pageContext.request.contextPath}/resources/assets/img/product_img/'+result[i].imagename+'">'+   
                     ' <i  id="overlayClose" onclick="closeOverlay()" class="bi bi-x-circle-fill" style="font-size: 1.5rem; color: black;position: absolute;top: -17px;left:335px;"></i>'+
                     '<div class="circle"><img src="https://s.svgbox.net/files.svg?ic=sketch&fill=000" width="25" height="25"></div>'+
                  '</div>'+
                  '<div class="card-action">'+
                    '<div>'+
                         '<div class="title" style="width:190px;">'+result[i].title+'</div>'+
                          '<span>현재 입찰가: ₩'+result[i].upper_Price+'</span>'+                         
                    '</div>'+
                    '<div class="btn-download">'+                      
                    '<a href="/marketapp/board/auctionview.do?no='+result[i].auction_no+'" rel="lyteframe" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><span style="font-size: 18px; display: block;"><button class="btn">입찰하러가기</button></span></a>'+
                    '</div>'      
                  '</div>'+
                '</div>'+
              '</div>';
                 categoryDetailInfoArray.push(detailcontent);                 
                 overlayLatLng.push(new kakao.maps.LatLng(result[i].latitude, result[i].longitude));
                 
                 
                    categoryInfo.setContent(content);
                    categoryInfoArray.push(categoryInfo);
                    categoryArray.push(categorymarker);
                    
                    createListTag(result[i]);
                   }///for                   
                   openCategoryList();
                   panTo(latitude,longitude);
                   
                }////if
                else{                   
                   var noitem="<h4 id='noitemtext' style='text-align:center;'>검색된 아이템이 없습니다.</h4>";
                   $('#addressitemlist').append(noitem);
                   $('#addressitemlist').attr('style','overflow-y: scroll;width:350px; height: 990px; margin-top: -110px; ');
                }
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
      overlayLatLng=[];
      $('#noitemtext').remove();
      customOverlay.setMap(null);
      categoryDetailInfoArray=[];
   }
}

function closeOverlay() {
   customOverlay.setMap(null);     
}

//카테고리 선택시 마커표시 및 인포윈도우 아이템리스트 뿌려주기
$('#categorySelector').click(function(e){      
   panTo(latitude,longitude);
   if(e.target.nodeName=='LI'){
      closeCategoryList();
      $('.addressItem').remove();
      category=e.target.textContent.trim();
      categoryItemList();
      
      for(let i=0;i<categoryDetailInfoArray.length;i++){      
         kakao.maps.event.addListener(categoryArray[i], 'click', function() {            
            customOverlay.setContent(categoryDetailInfoArray[i]);
            customOverlay.setPosition(overlayLatLng[i]);
            customOverlay.setMap(map);
            panTo(overlayLatLng[i].getLat(),overlayLatLng[i].getLng());
          });
      }
   }   
   
});
+

//아이템목록 클릭시 마커위치로 이동
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
   var li = '<li style="border:2px solid;border-radius: 10px;  margin:2px;" class="addressItem">'+
               '<div class="row">'+
                  '<div class="col-5">'+
                     '<img style="width:100%;height:100%; border-radius: 7px;" src="${pageContext.request.contextPath}/resources/assets/img/product_img/'+object["imagename"]+'">'+
                  '</div>'+
                  '<div class="col">'+
                     '<div class="title" style="text-align:center; margin-top:15px; width:175px;"><h5 style="font-family: "GmarketSansMedium"">'+object["title"]+'</h5></div>'+
                     '<hr/>'+
                     '<div><h6>시작가: ₩'+object["base_Price"]+'</h6></div>'+
                     '<div><h6>최고가: ₩'+object["upper_Price"]+'</h6></div>'+
                     '<div><h6>조회수: '+object["viewCount"]+'</h6></div>'+
                     '<div><h6>마감일: '+object["endDate"].split(" ")[0]+'</h6></div>'+
                     '<input type="hidden" name="latitude" value="'+object["latitude"]+'"/>'+
                     '<input type="hidden" name="longitude" value="'+object["longitude"]+'"/>'+
                  '</div>'+
               '</div>'+
         '</li>';
   ul.append(li);   
   ul.attr('style','overflow-y: scroll;width:350px; height: 990px; margin-top: -110px; ');
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