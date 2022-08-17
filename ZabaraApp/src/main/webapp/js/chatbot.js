function sendMessage(message,session_id) {
        console.log('입력메시지:',message,',세션 아이디:',session_id)
        
        $.ajax(
        {
            url:"http://192.168.0.38:9999/message",// http옆에있는곳(192.168.0.223)에 자기 ip를 넣어야해요
            //json으로 보낼때
            data:JSON.stringify({"message": message,"session_id":session_id}),
            contentType:'application/json',            
            //data:{"message": message,"session_id":session_id},//key=value
            type:'post',
            success:receiveResponse
            })
		
        //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호출됨
        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
          //chat-container에 bot의 응답 추가
          var message = data.message.split(';');
          var link = '';
          
          console.log('받은 메시지:',message)
           var html ='<div class="bot-message"> <div class="bot-message"> <div style="border-radius:10px;  width:65%; margin:10px; padding:5px; background-color:black; color:white" >'
           html += message[0];
           
           html += '<div id="chatbotDiv"></div></div>'
          $('.messages-content').append(html);

		for(var i=1; i < message.length; i++){
			link = message[i];
				html = '<div class="bot-message"> <div class="bot-message"> <span style="border-radius:10px; margin:10px; width:65%; padding:5px; background-color:black; text-color:black;" >'
	          html += link;
	          html += '</span></div></div>'
	          $('.messages-content').append(html);
			}	          
          //스크롤바 아래로
          $('.messages-content').scrollTop($('.messages-content')[0].scrollHeight);
          $('.messages-content').focus();
        }
       
    }
