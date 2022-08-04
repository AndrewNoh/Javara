function sendMessage(message,session_id) {
        console.log('입력메시지:',message,',세션 아이디:',session_id)
        
        $.ajax(
        {
            url:"http://192.168.0.10:9999/message",// http옆에있는곳(192.168.0.223)에 자기 ip를 넣어야해요
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
           console.log('받은 메시지:',data)
          $('.messages-content').append(`
          	<div class="bot-message">
                <div style="color:blue;" class=" col-md-5 bot-message">
                    ${data.message}
                </div>
            </div>                
          `)
          //스크롤바 아래로
          $('.messages-content').scrollTop($('.messages-content')[0].scrollHeight);
          $('.messages-content').focus();
        }
       
    }
