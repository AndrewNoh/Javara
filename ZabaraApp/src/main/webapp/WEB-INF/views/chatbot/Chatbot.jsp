<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="../resources/assets/style/chatbot.css"/>">

<div class="container h-1000 mt-3">
	<div class="row align-items-center h-1000">
	<a href="<c:url value="/chatbot/chatbot.do"/>"></a>
		<div class="col-md-8 col-sm-12 mx-auto">
			<div class="h-1000 justify-content-center">
				<div class="chat-container" style="overflow: auto; max-height: 80vh">

					<div class="chat-message col-md-5 bot-message"
						style="margin-bottom: 50px">안녕하세요. 'Jabara챗봇' 입니다!
					</div>
				</div>				
				<input style="m-3 p-3" class="input" type="text" placeholder="질의어를 입력하세요(처음부터 입력하시려면 '안녕'을 입력해주세요)" id="query" size="50"/>				
			</div>
		</div>
	</div>
</div>

<script src="<c:url value="/js/chatbot.js"/>"></script>
<script>
	$("#query").on('keypress',function(e) {
    	if (e.keyCode == 13){
	        //e.preventDefault();
	        var query = $(this).val()
	        console.log(query)
	        if (!query) {//텍스트를 입력하지 않는 경우
	          return
	        }
	        //chat-container에 사용자의 응답 추가
	        $('.chat-container').append('<div class="chat-message col-md-5 offset-md-7 human-message">'+query+'</div>')
	        // 입력창 클리어
	        $('#query').val('')
	        //스크롤바 아래로
	        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
	        //메시지 전송
	        sendMessage(query,'<%=session.getId()%>');
	    }
});
$(document).ready(function() {
	var i = true;
	var reload = 0;
		
	//$('#navbar').hide();
	$('h6:nth-child(2)').css('color','white');
	$('#vimeo-video gvideo node-ready').width('100px');
	$('#vimeo-video gvideo node-ready').height('100px');
  		
});
//관리자페이지 css안먹게하기
$("link#admin").prop('disabled', true);
$("link#admin1").prop('disabled', true);
$("link#admin2").prop('disabled', true);
$("link#admin3").prop('disabled', true);
$("link#admin4").prop('disabled', true);
$("link#admin5").prop('disabled', true);
$("link#admin6").prop('disabled', true);
$("link#admin7").prop('disabled', true);
$("link#admin8").prop('disabled', true);
$("link#admin9").prop('disabled', true);
$("link#admin10").prop('disabled', true);
$("link#admin11").prop('disabled', true);
$("link#admin12").prop('disabled', true);   
</script>

