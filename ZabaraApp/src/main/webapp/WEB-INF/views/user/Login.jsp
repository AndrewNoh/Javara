<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="${pageContext.request.contextPath}/resources/assets/css/LSstyle.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
   .profile-pic {
    width: 200px;
    max-height: 200px;
    display: inline-block;
   }
   
   .file-upload {
       display: none;
   }


</style>

<div id="contact" class="contact">
   <div class="section">
      <div class="container mt-5">
            <div class="col-12 text-center align-self-center py-5">
               <div class="section pb-5 pt-5 pt-sm-2 text-center">
                  <h6 class="mb-0 pb-3"><span>로그인 </span><span>회원가입</span></h6>
                  <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                  <label for="reg-log"></label>
                  <div class="card-3d-wrap mx-auto">
                     <div class="card-3d-wrapper">
                        <div class="card-front">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4 pb-3 logintitle">로그인</h4>
                                 <c:if test="${not empty param.error}">
                                    <p class="loginErrorMessage">로그인에 실패하였습니다.</p>
                                    <p class="loginErrorMessage">아이디와 비밀번호를 확인해주세요.</p>
                                 </c:if>
                                 <div class="form-group" id="firstLogin">
                                    <form action="<c:url value="/security/login.do"/>" method="post" role="form" class="custom-form mt-4" id="loginform">
                                       <sec:csrfInput/>
                                       <div class="form-group">
                                          <input type="email" name="id" class="form-style" placeholder="이메일을 입력하세요." id="id" autocomplete="off">
                                          <i class="input-icon uil uil-at"></i>
                                       </div>
                                       <div class="form-group mt-2">
                                          <input type="password" name="pwd" class="form-style" placeholder="비밀번호를 입력하세요." id="pwd" autocomplete="off">
                                          <i class="input-icon uil uil-lock-alt"></i>
                                       </div>
                                       <a href="#" class="btn mt-4" id="loginBtn">OK</a>
                                       <p class="mb-0 mt-4 text-center"><a href="#0" class="link" id="forgotpwd" >비밀번호를 잊으셨습니까?</a></p>
                                         <div class="row" style="display:flex;">
	                                       <div style="flex:1;"></div>
		                                       <div class="col" style="flex:1;">
		                                          <a href="javascript:kakaoLogin()"> <img
		                                             style="margin-top: 10px;"
		                                             src="${pageContext.request.contextPath}/resources/assets/img/kakaoButton.png"
		                                             width="40" alt="카카오 버튼" />
		                                          </a>
		                                       </div>
		                                       <div id="naver_id_login" class="col" style="flex:1;">
		                                          <a id="naverIdLogin_loginButton" href="javascript:void(0)">
		                                             <img style="margin-top: 10px;"
		                                             src="${pageContext.request.contextPath}/resources/assets/img/naverButton.png"
		                                             width="40" alt="네이버 버튼" />
		                                          </a>
		                                       </div>
		                                   <div style="flex:1;"></div>
                                     </div>
                                    </form>
                                 </div>
                                 <div class="form-group" id="secondLogin" style="display:none;">
                                    <div class="form-group">
                                          <input type="email" name="searchid" class="form-style" placeholder="이메일을 입력해주세요." id="searchid" autocomplete="off">
                                          <i class="input-icon uil uil-at"></i>
                                          <div>&nbsp</div>
                                    </div>
                                 </div>
                                 <a href="#" id="sendPassword" class="btn mt-4" style="display:none;">임시 비밀번호 발급</a>
                                 <a href="#" id="backToLogin" class="btn mt-4" style="display:none;">취소</a>
                           </div>
                        </div>
                     </div>
                        <div class="card-back">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4 pb-3">Sign Up</h4>
                                 <form action="<c:url value="/userinfo/signup.do"/>" method="post" role="form" name="joinform" enctype="multipart/form-data">
                                      <sec:csrfInput/>
                                      <input type="hidden" id="platform" name="platform" value="Z"/>
                                    <div class="form-group" id="firstSignup">
                                       <div class="form-group">
                                          <input type="text" name="address" class="form-style" onmousedown="daumAddress()" placeholder="내 동네 이름(동,읍,면으로 검색)" id="address" autocomplete="off" readonly>
                                          <input type="hidden" name="latitude" id="latitude">
                                          <input type="hidden" name="longitude" id="longitude">                                 
                                          <i class="input-icon uil uil-search"></i>
                                          <div>&nbsp</div>
                                       </div>   
                                       <div class="form-group mt-2">
                                          <p class="text-center"><a href="#0" class="link" onmousedown="daumAddress()">주소검색</a></p>
                                       </div>
                                    </div>
                                    <div class="form-group" id="secondSignup" style="display:none;">
                                       <div class="form-group">
                                          <input type="text" name="phonenumber" class="form-style" placeholder="휴대폰 번호를 입력해주세요" id="phonenumber" autocomplete="off">
                                          <i class="input-icon uil uil-phone"></i>
                                          <div>&nbsp</div>
                                       </div>
                                       <div class="form-group mt-2">
                                          <p class="text-center"><a href="#0" onclick="phoneNumberCheck()" class="link" id="phoneCheckBtn" name="phoneCheckBtn">인증번호 받기</a></p>
                                          <p id="smstimer">&nbsp</p>
                                       </div>
                                       <div class="form-group mt-2" style="display:none;" id="phoneNumberCheck">
                                          <input type="text" name="certificationNumber" class="form-style" placeholder="인증 번호를 입력해주세요" id="certificationNumber" autocomplete="off">
                                          <i class="input-icon uil uil-info-circle" id="phoneCheckIcon"></i>
                                       </div>
                                    </div>
                                    <div class="form-group" id="thirdSignup" style="display:none;">
                                       <div class="form-group">
                                          <input type="text" name="email" class="form-style" placeholder="이메일 주소를 입력해주세요" id="email" autocomplete="off">
                                          <i class="input-icon uil uil-at"></i>
                                          <div>&nbsp</div>
                                          
                                       </div>
                                       <div class="form-group mt-2">
                                          <p class="text-center"><a href="#0" onclick="emailCheck()" class="link" id="emailCheckBtn" name="emailCheckBtn">인증번호 받기</a></p>
                                          <div id="emailtimer">&nbsp</div>
                                       </div>
                                       <div class="form-group mt-2" style="display:none;" id="emailCheck">
                                          <input type="text" name="certificationEmail" class="form-style" placeholder="인증 번호를 입력해주세요" id="certificationEmail" autocomplete="off">
                                          <i class="input-icon uil uil-info-circle" id="emailCheckIcon"></i>
                                       </div>
                                    </div>
                                    
                                    <div class="form-group" id="fourthSignup" style="display:none;">
                                       <div class="form-group">
                                          <input type="text" name="nickname" class="form-style" placeholder="별명을 입력해주세요" id="nickname" autocomplete="off">
                                          <i class="input-icon uil uil-user"></i>
                                          <div>&nbsp</div>
                                       </div>                              
                                       <div class="form-group mt-2">
                                          <input type="password" name="password" class="form-style" placeholder="비밀번호를 입력해주세요" id="password" autocomplete="off">
                                          <i class="input-icon uil uil-lock-alt"></i>
                                          <div>&nbsp</div>
                                       </div>
                                       <div class="form-group mt-2">
                                          <input type="password" name="confirmPassword" class="form-style" placeholder="다시한번 입력해주세요" id="confirmPassword" autocomplete="off">
                                          <i class="input-icon uil uil-lock-alt"></i>
                                          <div>&nbsp</div>
                                       </div>
                                    </div>
                                    <div class="form-group" id="fifthSignup" style="display:none;"> 
                                       <div class="form-group">
                                           <div>프로필 사진</div>
                                              <img class="profile-pic" src="${pageContext.request.contextPath}/resources/assets/img/zabaraImg/DefaultProfile.png">
                                              <input class="file-upload" type="file"  accept=".jpg, .png, .jpeg" name="profileimg" id="profileimg" value="DefaultProfile.png"/>
                                              <div>&nbsp</div>
                                              <input type="hidden" id="kakaoProfileUrl" name="kakaoProfileUrl" value="">
                                       </div>
                                    </div>
                                    <a href="#" id="prevBtn" class="btn mt-4" style="display:none;">이전</a>
                                    <a href="#" id="nextBtn" class="btn mt-4">다음</a>
                                    <a href="#" id="submitBtn" class="btn mt-4" style="display:none;">확인</a>
                                 </form>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
       </div>
   </div>
  </div><!-- End Contact Section -->
<script src="${pageContext.request.contextPath}/resources/assets/js/LSscript.js"></script>
<script>
var form = joinform;
var emailcode=""; //이메일 인증코드
var emailcheck=0; //이메일 인증코드 확인용(0=실패(디폴트),1=성공)
var emailDuplicate=0;//중복 이메일 확인용 (1=중복이거나 확인실패,0=사용가능(디폴트))
var inputemail=""; //입력 이메일 저장용(인증후 변경불가하게 비교용)
var smscode="";  //핸드폰 인증코드
var smscheck=0;  //핸드폰 인증코드 확인용
var phoneDuplicate=0; //중복 핸드폰 확인용
var inputphone="";
var signupPage = 0; //회원가입페이지 next,prev용
//인증코드 발송 타이머용
var time=180;
var min='';
var sec='';
var platform;
var geocoder = new daum.maps.services.Geocoder();



//로그인,회원가입 서브밋
$('#loginBtn').click(function(){
   $('#loginform').submit();
});

$('#submitBtn').click(function(){
   form.submit();
});

//비밀번호 찾기 폼
$('#forgotpwd').click(function(){
   $('.loginErrorMessage').hide();
   $('.logintitle').text("이메일을 입력해주세요.");
   $('#firstLogin').hide();
   $('#secondLogin').fadeIn(600);
   $('#sendPassword').fadeIn(600);
   $('#backToLogin').fadeIn(600);
});

//로그인창으로 돌아가기
$('#backToLogin').click(function(){   
   $('.logintitle').text("로그인");
   $('#firstLogin').fadeIn(600);
   $('#secondLogin').hide();
   $('#backToLogin').hide();
   $('#sendPassword').hide();
});

//회원가입 다음페이지
$('#nextBtn').click(function (e) {
   switch(signupPage){
   case 0:
      $('.signUpValitaeMessage').text("");
      if (form.address.value.trim() === '') {
         addMessage('주소를 입력해주세요.',form.address);
         form.address.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(platform=="kakao"){
         $('#firstSignup').hide();
         $('#secondSignup').fadeIn(600);
         $('#nextBtn').hide();
         $('#submitBtn').fadeIn(600);
      }
      else{
         $('#firstSignup').hide();
         $('#secondSignup').fadeIn(600);
         $('#prevBtn').fadeIn(600);   
      }
      
      signupPage++;
      break;
   case 1:         
      $('.signUpValitaeMessage').text("");
      if (form.phonenumber.value.trim() === '') {
         addMessage('전화번호를 입력해주세요.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(smscheck !== 1){
         addMessage('전화번호 인증을 확인해주세요.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if (phoneDuplicate != 0) {
         addMessage('이미 가입된 번호입니다.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(smscheck==1 && form.phonenumber.value.trim()!=inputphone){
         addMessage('인증문자가 발송된 후 번호를 변경하실 수 없습니다.',form.phonenumber);
         form.phonenumber.focus();
         $('#smstimer').hide();
         $('#phoneCheckBtn').show();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      $('#secondSignup').hide();
      $('#thirdSignup').fadeIn(600);
      $('#phonenumber').attr("readonly","true");
      time=180;
      signupPage++;
      break;
   case 2:
      $('.signUpValitaeMessage').text("");
      if (form.email.value.trim() === '') {
         addMessage('이메일을 입력해주세요.',form.email);
         form.email.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      
      if(emailcheck !== 1){
         addMessage('이메일 인증을 진행해주세요.',form.email);
         form.email.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      
      if (emailDuplicate != 0) {
         addMessage('이미 가입된 이메일입니다.',form.email);
         form.email.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(emailcheck==1 && form.email.value.trim()!=inputemail){
         addMessage('인증메일이 발송된 후 이메일을 변경하실 수 없습니다.',form.email);
         form.email.focus();
         $('#emailtimer').hide();
         $('#emailCheckBtn').show();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      $('#thirdSignup').hide();
      $('#fourthSignup').fadeIn(600);
      $('#email').attr("readonly","true");
      signupPage++;
      break;
   case 3:
      $('.signUpValitaeMessage').text("");
      if (form.nickname.value.trim() === '') {
         addMessage('닉네임을 입력해주세요.',form.nickname);
         form.nickname.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }         
      if(form.nickname.value.trim().length > 20){
    	  addMessage('닉네임은 최대 20자까지만 가능합니다.',form.nickname);
    	  form.nickname.focus();
          if (e != undefined)
             e.preventDefault();
          return false;
      }
      
      if (form.password.value.trim() === '') {
         addMessage('비밀번호를 입력해주세요',form.password);
         form.password.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(form.password.value.trim().length > 50){
    	  addMessage('비밀번호는 최대 50자까지만 가능합니다.',form.password);
          form.password.focus();
          if (e != undefined)
             e.preventDefault();
          return false;
      }
      
      if (form.confirmPassword.value.trim() === '') {
         addMessage('비밀번호 확인을 입력해주세요',form.confirmPassword);
         form.confirmPassword.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      else{
         if(form.password.value.trim() !== form.confirmPassword.value.trim()){
            addMessage('비밀번호와 비밀번호 확인이 일치 하지 않아요.',form.confirmPassword);
            form.confirmPassword.focus();
            if (e != undefined)
               e.preventDefault();
            return false;
         }
      } 
      $('#fourthSignup').hide();
      $('#nextBtn').hide();
      $('#fifthSignup').fadeIn(600);
      $('#submitBtn').fadeIn(600);
      signupPage++;
      break;
   }
});

//회원가입 이전페이지
$('#prevBtn').click(function () {
   switch(signupPage){
   case 1:
      $('#firstSignup').fadeIn(600);
      $('#secondSignup').hide();
      $('#prevBtn').hide();
      signupPage--;
      break;
   case 2:
      $('#secondSignup').fadeIn(600);
      $('#thirdSignup').hide();
      signupPage--;
      break;
   case 3:
      $('#thirdSignup').fadeIn(600);
      $('#fourthSignup').hide();
      signupPage--;
      break;
   case 4:
      $('#fourthSignup').fadeIn(600);
      $('#fifthSignup').hide();
      $('#submitBtn').hide();
      $('#nextBtn').fadeIn(600);
      signupPage--;
      break;
   }   
});

joinform.onsubmit=function(e){
   if(platform=="kakao" || platform=="naver"){
      if (form.phonenumber.value.trim() === '') {
         addMessage('전화번호를 입력해주세요.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(smscheck !== 1){
         addMessage('전화번호 인증을 확인해주세요.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if (phoneDuplicate != 0) {
         addMessage('이미 가입된 번호입니다.',form.phonenumber);
         form.phonenumber.focus();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
      if(smscheck==1 && form.phonenumber.value.trim()!=inputphone){
         addMessage('인증이 완료된 후 번호를 변경하실 수 없습니다.',form.phonenumber);
         form.phonenumber.focus();
         $('#smstimer').hide();
         $('#phoneCheckBtn').show();
         if (e != undefined)
            e.preventDefault();
         return false;
      }
   }
   
}


//핸드폰 인증번호 발송
function phoneNumberCheck(){
   if(phoneDuplicate==0){
      if(form.phonenumber.value.trim()!==""){
         var phoneNumberValue= /^[0-9]{11,12}$/
         if(phoneNumberValue.test(form.phonenumber.value.trim())){
            $.ajax({
               url :'<c:url value="/phoneCheck.do"/>',
               type:'POST',
               dataType: "text",
               data:{phone:$("#phonenumber").val(),'${_csrf.parameterName}':'${_csrf.token}'},
               
            }).done(function(data){
               $('#phoneNumberCheck').show();
               $('#phoneCheckBtn').text("인증번호 재발송");
               $('#phoneCheckBtn').hide();
               $('#smstimer').text("인증번호 재발송 3:0");
               inputphone=$("#phonenumber").val().trim();
               time=180;
               var smsTime = setInterval(function(){
                  min=parseInt(time/60);
                  sec=time%60;
                  if(smscheck==1) $('#smstimer').text("인증 완료");
                  else $('#smstimer').html("인증번호 재발송 "+min+":"+sec);
                  if(signupPage!=1) clearInterval(smsTime);
                  time--;
                  if(time<0){
                     clearInterval(smsTime);
                     $('#phoneCheckBtn').show();      
                     if(smscheck==1) $('#smstimer').text("인증 완료");
                     else $('#smstimer').html("");                  
                     time=180;
                  }
               },1000);
               console.log(data);
               smscode=data;
            });
         }
         else {
            addMessage('번호는 -를 제외한 숫자만 11~12자리 입력해주세요',form.phonenumber);
            form.phonenumber.focus();
         }
      }
      else{
         addMessage('번호를 입력해주세요',form.phonenumber);
         form.phonenumber.focus();
      }
   }
   else{
      addMessage('이미 가입된 번호입니다.',form.phonenumber);
      form.phonenumber.focus();
   }
}



//이메일 인증번호 발송
function emailCheck(){
   if(emailDuplicate ==0){
      let emailYN = isEmail($("#email").val());
      if(emailYN){
         $.ajax({
            url :'<c:url value="/emailLink.do"/>',
            type:'POST',
            dataType: "text",
            data:{email:$("#email").val(),'${_csrf.parameterName}':'${_csrf.token}'},
            
         }).done(function(data){
            $('#emailCheck').show();
            $('#emailCheckBtn').text("인증번호 재발송");
            time=180;
            $('#emailCheckBtn').hide();
            $('#emailtimer').text("인증번호 재발송 3:0");
            inputemail=$("#email").val().trim();
            var emailTime = setInterval(function(){
               min=parseInt(time/60);
               sec=time%60;
               if(emailcheck==1) $('#emailtimer').text("인증 완료");
               else $('#emailtimer').html("인증번호 재발송 "+min+":"+sec);
               if(signupPage!=2) clearInterval(emailTime);
               time--;
               if(time<0){
                  clearInterval(emailTime);
                  $('#emailCheckBtn').show();                  
                  if(emailcheck==1) $('#emailtimer').text("인증 완료");
                  else $('#emailtimer').html("");
                  time=180;
               }
            },1000);
            console.log(data);
            emailcode=data;
         });
      }else{
         addMessage('이메일 형식에 알맞게 입력해주세요 xxx@xxx.xxx',form.email);
         form.email.focus();
      }
   }
   else{
      addMessage('이미 가입된 이메일입니다.',form.email);
      form.email.focus();
   }
}

//핸드폰 인증코드 일치 확인
$('#certificationNumber').keyup(function(){
   if($('#certificationNumber').val().trim()==smscode){
      $('#phoneCheckIcon').attr('class','input-icon uil uil-check-circle').attr('background-color','green');
      $('#phoneCheckBtn').hide();
      if(form.phonenumber.value.trim()==inputphone) $('#phonenumber').attr('readonly','true');
      $('#certificationNumber').attr('readonly','true');
      smscheck=1;
   }
   else{
      if(smscheck=1){
         $('#phoneCheckIcon').attr('class','input-icon uil uil-info-circle').removeAttr('border-color');
      }
      smscheck=0;
   }
});


//이메일 인증코드 일치 확인
$('#certificationEmail').keyup(function(){
   if($('#certificationEmail').val().trim()==emailcode){
      $('#emailCheckIcon').attr('class','input-icon uil uil-check-circle').attr('border-color','#72CC82');
      $('#emailCheckBtn').hide();
      if(form.email.value.trim()==inputemail) $('#email').attr('readonly','true');
      $('#certificationEmail').attr('readonly','true');
      emailcheck=1;
   }
   else{
      if(emailcheck=1){
         $('#emailCheckIcon').attr('class','input-icon uil uil-info-circle').removeAttr('border-color');
      }
      
      emailcheck=0;
   }
});

//이메일 형식 확인 정규표현식
function isEmail(asValue){
   var regExp =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   return regExp.test(asValue);
}

//이메일 중복확인
$('#email').keyup(function(){
   var email = $('#email').val();         
      $.ajax({
         type: 'POST',
         url: '<c:url value="/userinfo/duplicate.do"/>',
         data: {email: email,'${_csrf.parameterName}':'${_csrf.token}'},
         dataType: "text",
         success: function(result){
            if(result == 1) addMessage('Impossible EMAIL.', form.email);
            emailDuplicate = result;
         }
      });
});

//핸드폰 중복확인
$('#phonenumber').keyup(function(){
   var phone = $('#phonenumber').val();
   $.ajax({
      type: 'POST',
      url: '<c:url value="/userinfo/duplicate.do"/>',
      data: {phone: phone,'${_csrf.parameterName}':'${_csrf.token}'},
      dataType: "text",
      success: function(result){
         if(result == 1) addMessage('Impossible PhoneNumber', form.phoneNumber);
         phoneDuplicate = result;
      }
   });
});



//유효성검사 메시지 출력
function addMessage(msg, val){
   $(val).nextAll('div').children().detach();
   var newDiv = document.createElement("span");
   var newContent = document.createTextNode(msg);
   newDiv.className="signUpValitaeMessage";
   newDiv.appendChild(newContent);
   $(val).nextAll('div').append(newDiv);
}

//우편번호 팝업창 디자인
var themeObj = {
      bgColor: "#AFAFAF", //바탕 배경색
      searchBgColor: "#212529", //검색창 배경색
      //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
      //pageBgColor: "", //페이지 배경색
      //textColor: "", //기본 글자색
      queryTextColor: "#FFFFFF", //검색창 글자색
      // postcodeTextColor: "", //우편번호 글자색
      // emphTextColor: "", //강조 글자색
      outlineColor: "#FFFFFF" //테두리
};

//주소입력
function daumAddress() {
	var width = 500; // 팝업의 너비
	var height = 600; // 팝업의 높이
    new daum.Postcode({
        oncomplete: function(data) {
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
               document.getElementById("address").value = addr;
            $('#nextBtn').focus();
        },
       theme: themeObj, // 팝업 테마 적용
       width: width,  
       height: height
    }).open({
        left: 500, // 팝업 위치 X값
        top: 500, // 팝업 위치 y값
        popupTitle: '우리동네 좋은 물건 자바라' // 팝업 타이틀
        
    });
}

//임시 비밀번호 발송
$('#sendPassword').click(function(){
   if($('#searchid').val()!=""){
	   let emailYN = isEmail($("#searchid").val());
	   if(emailYN){
	      $.ajax({
	         url :'<c:url value="/emailLink.do"/>',
	         type:'POST',
	         dataType: "text",
	         data:{email:$("#searchid").val(),'${_csrf.parameterName}':'${_csrf.token}',type:'forgotPwd'},
	         
	      }).done(function(data){
	         if(data =="notMember") addMessage('존재하지 않는 아이디입니다.',$('#searchid'));
	         else {
	        	 $('#backToLogin').get(0).click();
	        	 const Toast = Swal.mixin({
	                   toast: true,
	                   position: 'center-center',
	                   showConfirmButton: false,
	                   timer: 1800,
	                   timerProgressBar: true,
	               })
	                
	               Toast.fire({
	                   icon: 'success',
	                   title: '해당 이메일로 임시 비밀번호가 발급되었습니다.'
	               })
	         }
	      });
	   }else{
	      addMessage('이메일 형식에 알맞게 입력해주세요 xxx@xxx.xxx',$('#searchid'));
	      $('#searchid').focus();
	   }
   }
   else{
	   addMessage('이메일을 입력해주세요.',$('#searchid'));
   }
});

//프로필사진관련
var readURL = function(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.profile-pic').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
   
$("#profileimg").change(function(){
   var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
   
   if(!$('#profileimg').val().match(fileForm)) {
       addMessage('jpg,jpeg,png타입만 선택 가능합니다.',$('#profileimg'));
       $('#profileimg').val(null);
   }
   
   readURL(this);
   
});

$(".profile-pic").click(function() {
   $("#profileimg").click();
   });


var kakao_message = new Object();
function kakaoLogin() {
   Kakao.Auth
         .login({
            success : function(response) {
               Kakao.API
                     .request({
                        url : '/v2/user/me', 
                        success : function(response) {
                           console.log(response);
                           kakao_message['id'] = response['kakao_account']['email']+'kakaoLogin';
                           kakao_message['email'] = response['kakao_account']['email'];
                           kakao_message['nickname'] = response['kakao_account']['profile']['nickname'];   
                           kakao_message['profile_image_url'] =  response['kakao_account']['profile']['profile_image_url'];   
                           console.log("kakao_message"+kakao_message);

                           var m_uid = 'KAKAO_'
                                 + kakao_message['id'];
                           console
                                 .log(""
                                       + window.location.hostname
                                       + "");
                           var data = JSON
                                 .stringify({
                                    pwd : kakao_message['id'],
                                    nickname : kakao_message['nickname'],
                                    email : kakao_message['email'],
                                    profile : kakao_message['profile_image_url'],
                                    join_pass : 'KAKAO',
                                    nickname : kakao_message['nickname'],
                                    "${_csrf.parameterName}" : "${_csrf.token}"
                                 });
                           snsLoginProgress(data);
                        },
                        fail : function(error) {
                           console.log(error)
                        },
                     })
            },
            fail : function(error) {
               console.log(error)
            },
         })
}

   function snsLoginProgress(data) {
      console.log(data);
      $.ajax({
         type : 'post',
         url : '<c:url value="/userid_duplicate_check.do"/>',
         data : data,
         headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST",
            'X-CSRF-TOKEN' : "${_csrf.token}"
         },
         success : function(result) { //로그인 처리
            console.log(result);
         
            console.log(result.result);
            if (result.result == "YES") {
               yes(result);
            } else {//회원가입 진행
               //console.log(result);
               //var re = JSON.parse(result);
               var id = result.id;
               var nickname = result.nickname;
               platform="kakao";
               $('#reg-log').click();
               const Toast = Swal.mixin({
                   toast: true,
                   position: 'center-center',
                   showConfirmButton: false,
                   timer: 1800,
                   timerProgressBar: true,
               })
                
               Toast.fire({
                   icon: 'warning',
                   title: '필수정보를 입력해주세요.'
               })
               $('#platform').val("K");
               $('#nickname').val(nickname);
               $('#email').val(id);
               $('#password').val(result.pwd);
               $('#confirmPassword').val(result.pwd);
               $('#kakaoProfileUrl').val(result.profile)//프로필사진 받아와서 넣을 곳
               
            }
         }
      });

   }

   function yes(result) {
      console.log(result);
      //var re = JSON.parse(result);
      var id = result.id;
      var pwd = result.pwd;
      $('#id').val(id);
      $('#pwd').val(pwd);      
      $('#loginform').submit();
   }
   

   var naverLogin = new naver.LoginWithNaverId({
      clientId : "aD0UrmApSUn6FDTwgeL4", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
      callbackUrl : "http://192.168.0.38:8080/marketapp/location/login.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
      isPopup : false,
      callbackHandle : true
   });
   naverLogin.init();
   window.addEventListener('load', function() {
      naverLogin.getLoginStatus(function(status) {
         if (status) {
            var Naverdata = JSON.stringify({
               pwd : naverLogin.user.getId(),
               nickname : naverLogin.user.getName(),
               email : naverLogin.user.getEmail(),
               "${_csrf.parameterName}" : "${_csrf.token}"
            });
            snsLoginProgress(Naverdata);
         }
      });
   });

   
</script>