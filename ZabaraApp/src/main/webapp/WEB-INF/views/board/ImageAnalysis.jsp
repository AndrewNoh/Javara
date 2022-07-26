<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<style>
div{
	color:black;
}
</style>
<!--  
<button type="button" onclick="init()">Start</button>
-->
<div class="container">
	<h2>이미지 분석 테스트중 입니다</h2>
	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">Open modal</button>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">이미지분석</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" >
					<button onclick="predict()">이미지 분석 하기</button>
					<input type="file" id="test_image" accept=".png,.jpg,.jpeg" />
					<!-- 선택한 이미지를 미리보기 위한 추가 -->
					<img id="preview_image" style="width: 100%;height: 90%;"/>

					<!-- 웹캠으로 캡처한 이미지 표시 영역(영상소스) -->
					<div id="webcam-container"></div>
					<!-- 예측결과 표시 영역 -->
					<div id="label-container"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</div>
<!--데이타 소스를 웹캠이 아니라 이미지 파일로 변경시 아래 태그(button,input)추가 -->
<!-- 마지막 카테고리가 반복되는거 막기 (마지막 카테고리가 0%이면 자르기) -->



<script type="text/javascript">

	const URL = "../my_model/";

	let model //메모리에 로드한 모델 저장용
		, labelContainer//예측 결과를 보여줄 div요소 저장용
		, maxPredictions;//클래스(분류) 갯수 저장용
  
	async function init() {
		const modelURL = URL + "model.json";
		const metadataURL = URL + "metadata.json";

		model = await tmImage.load(modelURL, metadataURL);
		maxPredictions = model.getTotalClasses();
		console.log('카테고리(클래스) 수:',maxPredictions);

		labelContainer = document.getElementById("label-container");
		for (let i = 0; i < 3; i++) { // and class labels
			labelContainer.appendChild(document.createElement("div"));
		}
	}

	async function predict() {

		var image =document.querySelector("#preview_image");

        const prediction = await model.predict(image,false);
		console.log('prediction:',prediction);

		var resultArray=[];
		var className=[];
		for (var i = 0; i < maxPredictions; i++) {
			console.log("resultArray"+prediction[i].probability.toFixed(2)*100);
		         resultArray.push(prediction[i].probability.toFixed(2)*100);
		  }

		
	
	
		for(var i = 0; i < maxPredictions; i++) {
			var classPrediction = prediction[i].className + ": "
					+ prediction[i].probability.toFixed(2)*100;
			className.push(classPrediction);
		}
		
		for (var i = 0; i < resultArray.length-1; i++) {
		    for(var k=i+1; k < resultArray.length;k++){
		    if(resultArray[i] < resultArray[k]){
		       console.log(resultArray[i])
		       var temp = resultArray[i];
		       resultArray[i] = resultArray[k];
		       resultArray[k] = temp;
		       var tempname = className[i];
		       className[i] = className[k];
		       className[k] = tempname;
		      }
		   }
		}
		for(var k=0; k < 3; k++){
			labelContainer.childNodes[k].innerHTML="";
		}
		
		for(var k=0; k < 3; k++){
			if(className[k].indexOf(": 0") !=-1){//className[k]!=className[k+1]
				break;
			}
			labelContainer.childNodes[k].innerHTML=className[k];
		 }
	} 
	
	

	init();
	

	document.querySelector('#test_image').onchange=function(){
		previewImage(this);
	};

	function previewImage(input){//input는 <input type="file" ~/>객체
		if(input.files && input.files[0]){
			console.log('input.files:',input.files);//FileList객체
			console.log('input.files[0]:',input.files[0]);//File객체
			var reader = new FileReader();
			
			reader.readAsDataURL(input.files[0]);//이미지파일을 URL로 읽기.(BASE64로 인코딩 된 문자열)

			reader.onload=function(e){
				console.log("e.target:",e.target);//FileReader객체
				console.log("e.target.result:",e.target.result);//파일 컨텐츠
				document.querySelector("#preview_image").setAttribute('src',e.target.result); 
			};
		}
	}//////////////////
	
</script>


