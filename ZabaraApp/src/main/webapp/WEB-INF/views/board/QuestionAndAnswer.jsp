<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.card-header {  
  background-color: rgb(72, 75, 75);  
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #4a4f4b75;
    background-clip: border-box;
    border-radius: 0.25rem;
}
</style>



  <!-- ======= Q&A Section ======= -->
  <div id="qna" class="contact">
    <div class="container">

      <div class="section-title">
        <h2>자주묻는 질문</h2>
        
      </div>

      <div class="row mt-2">

        <div class="row mb-4 align-items-center">
          <div class="col-md-6 mb-5" data-aos="fade-up">
            <h2>무엇이든 물어보세요!</h2>
            
          </div>
        </div>
      </div>
      
      <!-- q&a board -->
      <div id="accordion">
	  <!-- 	
	  <div class="card">
	    <div class="card-header col d-flex align-content-center">
	      <a class="card-link" data-toggle="collapse" href="#collapsOne">
	        Q&A게시판
	      </a>
	    </div> 
	    <div id="collapseOne" class="collapse show" data-parent="#accordion">
	      <div class="card-body">
	        Lorem ipsum..
	      </div>
	    </div>
	  </div>-->
	
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
	        Q.커뮤니티 가이드라인
	      </a>
	    </div>
	    <div id="collapseTwo" class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        ZABARA는 동네 이웃 간의 연결을 도와 따뜻하고 활발한 교류가 있는 지역 사회를 만들기 위해 노력하고 있어요.
			이웃을 향한 당신의 따뜻한 관심과 애정은 ZABARA의 가장 큰 동력이에요. ZABARA를 사용하는 이웃 모두가 커뮤니티 가이드라인을 지키며 따뜻한 지역 커뮤니티를 함께 만들어요. 혼자 힘으로는 할 수 없지만, 우리가 함께라면 할 수 있어요!
			ZABARA는 신뢰, 존중, 윤리를 서비스의 중요한 가치라고 생각해요. 우리는 이 가치를 지키기 위해 언제나 최선을 다할 거예요. 더 가깝고 따뜻한 지역 커뮤니티를 위해 동참해주세요.
	      	</br>
	      	<h4>이런 행동은 할 수 없어요.</h4>
	      	<ul>
			<li>판매 금지 물품 거래</li>
			<li>중고거래 사기 등 이웃에게 손해를 입히는 행위</li>
			<li>허위 정보 게시 등 이웃을 속이거나 기만하는 행위</li>
			<li>생명의 소중함을 스스로 버리는 행위(혹은 그에 준하는 모든 행위)</li>
			<li>생명을 거래하는 행위</li>
			<li>폭력, 불법 행위를 조장하거나 도모하는 행위</li>
			<li>사회 통념상 용인되기 어려운 모든 행위</li>
			</ul>
			</br>
			서로 신뢰하고 존중하는 따뜻한 커뮤니티를 만들어가요.
	      
	      </div>
	    </div>
	  </div>
	
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
	        Q. 중고거래 운영정책	
			</a>
	    </div>
	    <div id="collapseThree" class="collapse" data-parent="#accordion">
	      <div class="card-body">	                
	        ZABARA는 동네 이웃 간의 연결을 도와 따뜻하고 활발한 교류가 있는 지역 사회를 만들기 위해 노력하고 있어요.
			우리는 신뢰, 존중, 윤리를 서비스의 중요한 가치라고 생각해요. ZABARA와 ZABARA를 사용하는 이웃 모두가 동참하여 이 가치를 지키기 위해 최선을 다하고 있어요. 따뜻하고 믿을 수 있는 거래 문화를 함께 만들어가요.	
			
			
			<h4>가까운 이웃과의 만남이 따뜻함이 될 수 있도록 거래매너를 지켜요.</h4>
			<ul>
			<li>서로 존중하고 배려해요. 존댓말로 솔직하게 대화해요.</li>
			<li>모두의 시간은 소중해요. 약속은 반드시 지켜요.</li>
			<li>절대로 중간에 연락 끊기는 일이 없도록 해요.</li>
			<li>언제나 따뜻한 인사로 시작하고 마무리해요.</li>
			<li>늦은 시간, 특히 모두가 자고 있는 새벽 시간에는 채팅을 자제해 주세요.</li>
			<li>택배 거래보다는 만나서 직거래하기로 해요.</li>
			<li>이웃과의 거래는 만 14세 이상 부터 하기로 해요.</li>
			</ul>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseFore">
	        Q.판매 금지 물품
	      </a>
	    </div>
	    <div id=collapseFore class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <h4>판매 금지 물품</h4>
				<li>가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)</li>
				<li>주류(무알콜 주류 포함), 담배, 전자담배, 모의총포 및 그 부속품 일체 (ex. 라이터, 비비탄 총알 등 청소년 유해물건)</li>
				<li>경유, LPG, 휘발유 등의 유류 거래</li>
				<li>반려동물, 생명이 있는 동물·곤충 (무료분양, 열대어 포함)</li>
				<li>한약∙의약품 ∙ 의료기기∙마약류 (청소년 유해약물∙유해화학물질)</li>
				<li>반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글</li>
				<li>수제 음식물∙건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매할 수 있음)</li>
				<li>유통기한이 지난 제품, 포장이 훼손되거나 개봉된 식품</li>
				<li>도수 있는 안경∙선글라스 (온라인 판매 불법)</li>
				<li>콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)</li>
				<li>반복/다량 판매하는 핸드메이드 제품</li>
				<li>화장품 샘플 (온라인 판매 불법)</li>
				<li>음란물 (청소년 유해 매체물)</li>
				<li>촬영 여부를 상대방이 알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법 카메라 등)</li>				
				<li>개인정보 (게임 계정, 추천인 계정 포함)</li>
				<li>조건부 무료나눔</li>
				<li>렌탈 제품</li>
				<li>헌혈증 (무료나눔만 가능)</li>
				<li>초대권 (무료로 받은 초대권을 유료로 판매하는 경우 / 무료나눔만 가능)</li>
				<li>군용품∙군마트용품∙경찰용품∙도검∙화약류∙분사기∙전자충격기∙석궁∙활 (안전확인∙안전인증표시 없는 전기용품 및 단전지 또는 공산품)</li>
				<li>USD 1000달러 이상의 외환 거래나 매매차익을 목적으로 하는 반복적인 외환 거래 (매매차익을 목적으로 하지 않는 1000달러 미만의 외환 거래는 허용)</li> 
				<li>나라미, 정부 지원 생필품, 지역상품권, 문화누리카드 등 법률에 의해 재판매 할 수 없는 물품</li>
				<li>종량제봉투</li>
				<li>통신사 데이터, 인터넷 상품</li>
				<li>반입한 날로부터 1년 이상 경과하지 않은 전파인증이 면제된 해외직구 전자제품을 판매하는 행위</li>
				<li>스스로 사용할 목적으로 세금을 면제받은 해외직구 물품을 국내에서 재판매 하는 행위</li>
				<li>낚시로 포획한 수산물 거래 행위</li>
				<li>암표매매 행위</li>
				<li>종자 (삽수,어린묘목 등)</li>
				<li>100만 원 이상 금 제품 (골드바, 금괴, 금으로 제작된 목걸이, 팔찌, 귀걸이 등)</li>
				<li>이외 법률을 위반하는 모든 물품</li>
				<li>ZABARA에 등록되지 않은 모든 홍보/광고</li>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseFive">
	        Q.중고거래 게시판 거래 및 환불 정책
	      </a>
	    </div>
	    <div id=collapseFive class="collapse" data-parent="#accordion">
	      <div class="card-body">
	      	<a href="https://usr.ecmc.or.kr/main.do"><전자문서·전자거래분쟁조정위원회 안내></a></br>
	        전자문서·전자거래분쟁조정위원회는 「전자문서 및 전자거래기본법」 제32조에 따라 설립되었으며, 분쟁 조정 신청을 받은 날로부터 45일 이내에 조정안을 작성하여 분쟁 조정 당 사자에게 권고하며, 권고를 받은 당사자는 권고를 받은 날로부터 15일 이내에 조정안에 대한 수락 여부를 위원회에 통지하여야 합니다. 조정안에 대하여 양 당사자가 수락한 경우 조정이 성립되며, 이때의 조정조서는 「민사소송법」에 따른 재판상 화해와 동일한 효력을 갖습니다.
			분쟁 조정 신청은 판매자·구매자 구분 없이 누구나 신청 가능 하지만, 어느 일방이 조정에 불응할 경우 조정은 성립되지 않습니다.
	      </br>
	      <a href="https://usr.ecmc.or.kr/mediation/procedure.do"><전자문서·전자거래분쟁조정위원회 분쟁조정 절차></a>	      
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseSix">
	        Q.광고 운영 정책
	      </a>
	    </div>
	    <div id=collapseSix class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <h4>광고 게재제한</h4></br> 
			
			<p>광고가 다음의 각 항목 중 어느 하나에 해당할 경우, 해당 광고의 심사 미승인 또는 게재를 제한할 수 있습니다.</p>
			
			<p>1. 광고 미승인 및 게재제한 사유</p>
			
			<p>① 회사에 법률적 또는 재산적 위험을 발생시키거나 발생시킬 우려가 있는 경우</p>
			
			<p>* 광고가 관련 법령을 위반하는 상점, 상품 또는 서비스를 홍보함으로써 회사가 민.형사적 책임을 부담할 가능성이 있는 경우</p>
			
			<p>* 광고가 관련 법령을 위반하는 회원의 영업행위 등에 연계됨으로써 회사가 민.형사적 책임을 부담할 가능성이 있는 경우</p>
			
			<p>[대표적 사례들]</p>
			
			<p>- 의료기관이 아닌데 문신/반영구 시술 서비스 제공이 확인되는 경우 광고게재제한</p>
			
			<p>- 의료법에 따라 사전심의가 필요한 광고인데 사전심의번호가 확인되지 않는 경우 광고게재제한</p>
			
			<p>- 흥신소/심부름센터 업소 내에서 개인사생활 조사 등의 서비스 제공 확인시 광고게재제한</p>
			
			<p>- 출장 안마/마사지 서비스 제공 확인시 광고게재제한 (성매매 연계 개연성)</p>
			
			 
			
			<p>② 회사 및 광고매체의 명예ㆍ평판ㆍ신용이나 신뢰도를 훼손하거나 훼손할 우려가 있는 경우</p>
			
			<p>* 광고가 관련 법령을 위반하지는 않더라도 도의적으로 비난의 대상이 되거나 사회 일반의 정서에 반하는 회원의 영업행위에 연계됨으로써 회사의 명예.평판.신용.신뢰도가 훼손될 가능성이 있는 경우</p>			
		
			 
			
			<p>③ 서비스 또는 광고매체의 품질을 저하시키거나 저하시킬 우려가 있는 경우</p>
			
			<p>* 광고 품질이 현저히 떨어지는 경우</p>
			
			<p>[대표적 사례들]</p>
			
			<p>- 첫번째 이미지에 텍스트가 20% 이상 포함(예: 전단지)</p>
			
			<p>- 업소나 상품 및 서비스의 내용을 충분히 설명하지 못함</p>
			
			<p>- 해상도나 촛점이 안 맞는 등 이미지 퀄러티가 낮음</p>
			
			<p>- 무성의한 광고</p>
			
			<p>- 기타 광고 품질이 떨어지는 광고들</p>
			 
			
			<p>* 광고라고 보기에 관련성이 지나치게 떨어지는 상품이나 서비스에 연계됨으로써 광고 서비스의 품질을 떨어뜨릴 가능성이 있는 경우</p>
			
			<p>[대표적 사례들]</p>
			
			<p>- 지역과 상관 없는 인터넷 쇼핑몰 광고</p>
			
			<p>- 지역과 상관 없는 보험/대출 광고 등</p>
			
			<p>- 지역과 상관 없는 제품판매 광고 등</p> 
			
			<p>④ 동일한 내용의 광고글을 반복해서 올리는 경우</p> 
			
			<p>⑤ 광고의 효과가 현저히 떨어지는 경우</p>
			
			<p>* 광고가 광고매체에서 노출되기는 하나 광고매체 이용자의 클릭율이 지나치게 낮은 경우</p> 
			
			<p>⑥ 광고매체의 운영 주체가 정당하고 합리적인 이유를 근거로 자신의 광고매체에서의 광고 게재 제한 등을 요청하는 경우</p>
			
			<p>⑦ 정치적, 종교적 목적의 캠페인 및 홍보 게시글</p>			
			
			
			<p>2. 광고 심사 미승인 및 게재제한 절차</p>
			
			<p>① 회사는 광고매체의 요청에 의해 일정한 광고의 미승인 또는 게재 제한 등을 하는 경우 회원에게 약관 제11조에 따른 방법으로 통지합니다.</p>
			
			<p>② 광고매체의 요청에 의해 일정한 광고의 게재 제한을 하는 경우 원칙적으로 광고 게재 제한 등의 조치를 취하기 전에 회원에게 통지하며, 다만 광고매체가 긴급한 사정을 이유로 시급히 요청해 왔을 경우에는 부득이 게재 제한 등의 조치를 취한 후에 회원에게 통지할 수 있습니다.</p>	 
			
			 
			
			<h4>이용제한</h4></br>	 
			
			<p>1. 이용제한 조치</p>
			
			<p>① 회사는 회원이 관련 법령 및 약관 또는 광고운영정책에 따른 의무를 위반하는 경우 광고 게재 신청 제한, 광고 게재 제한, 광고 서비스 이용 정지, 광고 이용계약 해지 등을 할 수 있습니다.</p>			
			 
			
			<p>1) 광고 게재 제한 (광고에 대한 제한)</p>
			
			<p>광고 제목 및  내용 등이 법령, 약관, 광고운영정책 및 검수기준에 부합하지 않는 광고에 대한 노출제한 조치를 의미함</p>
			
			<p>[대표적 사례들]</p>
			
			<p>- 광고 제목 및 내용 등이 법령 등에 위배되거나 제3자 권리를 침해하는 경우</p>
			
			<p>- 광고 썸네일 또는 제목과 광고 상세게시물 내용 간의 연관성이 적은 경우</p>
			
			<p>- 광고 제목 및 내용 상에 특수문자 기재 및 글자수 제한 초과하는 경우</p>			
			 
			
			<p>2) 광고 게재 신청 제한 (업소에 대한 제한)</p>
			
			<p>광고를 불허하는 업종임이 확인되거나 해당 업소/상품/서비스가 약관, 광고운영정책, 검수기준 및 관련 법령에 부합하지 않는 경우, 해당 광고에 대한 광고제한조치를 의미함</p>
	      	</div>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseSeven">
	        Q.광고비는 어떻게 결정되나요?
	      </a>
	    </div>
	    <div id=collapseSeven class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <h4>ZABARA 광고비는 이렇게 결정돼요.</h4>
	        <ul>
	        	<li>이웃이 광고를 클릭했을 때만 광고 비용을 차감해요.</li>
	        	<li>몇 명의 이웃이 광고를 클릭했느냐에 따라서 광고에 드는 비용이 달라질 수 있어요.</li>
	        	<li>클릭당 비용은 광고 지역의 사용자 수, 그 지역에서 진행되는 광고 수, 광고 성과 등등 다양한 정보를 종합해서 결정됩니다.</li>
	        </ul>
	        </br>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseEight">
	        Q.ZABARA에서 지켜야 할 매너
	      </a>
	    </div>
	    <div id=collapseEight class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <strong>기본 매너</strong>
			<strong>기본적으로 지켜야 하는 매너에는 무엇이 있을까요? 기본 매너인 만큼 꼭 지켜 주실 거라고 믿어요.</strong>
			<ul>
			<li>서로 존중해요. 우리 존댓말로 대화해요.	</li>		
			<li>모두의 시간은 소중합니다. 시간 약속을 꼭 지켜주세요.</li>			
			<li>절대로 중간에 연락 끊기는 일이 없도록 해요. (잠수는 절대 안 돼요!)</li>			
			<li>따뜻한 감사 인사로 마무리를 지어요.</li>			
			<li>어떤 상황에서도 욕설, 비방, 명예훼손 등의 언행은 지양해주세요.</li>			
			<li>늦은 시간 채팅은 부담스러울 수 있어요. 특히 새벽 시간에는 채팅을 자제해주세요.</li>			
			<li>택배 거래는 부득이한 경우에만 요청하시고 가능한 한 직거래로 해주세요.</li>
			</ul>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseNine">
	        Q.ZABARA의 뜻이 뭔가요?(왜 ZABARA인가요?)
	      </a>
	    </div>
	    <div id=collapseNine class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <p>ZABARA는 좋은 물건을 '잘 잡아라'라는 뜻이 있는 고유 명칭입니다.</p>
	        <p>저희 서비스를 이용하시는 분들께 최적의 이용 경험과 거래 물품을 제공하는 것이 목표입니다.</p>
	        <p>경매와 동네 이웃 간의 거래뿐만 아니라 다양한 동네소식과 유용한 정보를 드리기 위해 노력하겠습니다 :)</p>
	        <p>건전한 거래 문화를 위해 정해진 규정을 준수 부탁드립니다.</p>
	        <p>전체적인 ZABARA의 화면은 '블랙모드'로 사용자의 눈의 피로도를 최소화해드리고 있습니다.</p>
	        <p>그럼 저희 ZABARA서비스를 이용할 준비 되셨나요?</p>	        
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseTen">
	        Q.진행중인 게시글을 수정할 수 있나요?
	      </a>
	    </div>
	    <div id=collapseTen class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <p>광고 진행 도중에도 기간부터 지역, 예산, 검색 키워드까지 변경할 수 있어요.</p>
	        <strong>STEP 1</strong>
	        <p>[광고] 에서 수정하고 싶은 광고를 클릭하고, 상단의 [소재 수정하기] 버튼을 클릭해 보세요.</p>
			<p>소재는 광고 화면을 구성하는 다양한 요소를 말해요. 광고를 처음 발견할 때 보게 되는 사진, 제목, 소개문구 등등이 소재라고 볼 수 있어요.</p>
			<p>피드광고는 제목과 대표 사진, 검색광고는 제목과 대표 사진, 비즈프로필의 소개문구가 소재에 포함돼요.</p>
			<strong>STEP 2</strong>
			<p>[광고 소재 수정] 메뉴에서 대표 사진, 제목, 소개문구를 수정해도, 소식이나 비즈프로필 홈 정보는 변경되지 않아요.</p>
			<p>광고에 보이는 제목은 (서초동 이웃을 위한 소규모 보드게임 카페 오픈) 이라도, 실제로 클릭했을 때 연결되는 소식 제목은 (4인용 보드게임 카페 오픈했어요) 일 수 있는거죠</p>.
			<p>광고를 위한 포장지와 알맹이를 따로 준비하는 거라고 이해해 주시면 좋을 것 같아요.</p>
			<strong>STEP 3</strong>
			<p>소재 수정, 지역, 검색 키워드를 변경하는 경우, 추가 심사에 들어가요.</p>
			<p>최대 24시간이 소요되며, 그 전까지는 기존 광고 소재 그대로 광고를 노출한답니다.</p>
			<p>광고 재심사가 승인되더라도 실제 광고에 반영되는 것까지 10분 정도 걸릴 수 있으니 참고해 주세요.</p>
			<p>광고 종료가 임박했을 경우 심사가 진행되지 않고 광고가 종료될 수 있어요.</p>
			<p>기간이나 예산 조건을 수정하는 경우에는 추가 심사가 없습니다.</p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseEleven">
	        Q.작성한 게시글이 보이지 않나요?
	      </a>
	    </div>
	    <div id=collapseEleven class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <h4>게시글이 광고 가능한 상태가 아닌 경우</h4>
	        <ul>
			 <li>나만 보기 상태의 글을 찾고 있는 건 아닌가요? 나만 보기 상태의 글은 광고 대상이 아니기 때문에 목록에 보여주지 않아요!</li>
			 <li>알바 구인글을 작성하셨나요? 구인글이 승인되기 전이거나 이미 마감된 상태라면 광고 대상이 아니예요. 그래서 목록에 안 보이는 것이랍니다.</li>
			</ul>	      
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwelve">
	        Q. 고객센터 문의 가능 시간은 언제인가요?
	      </a>
	    </div>
	    <div id=collapseTwelve class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        온라인 고객센터 : 1588-0000 월~금 9:00~21:00 토 9:00~18:00</br>
	        이메일: zabara@kosmo.com</br>
	        FAX :(02)1234-5678
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThirteen">
	        Q. 제가 만들었던 게시글 정보를 확인하고 싶어요.
	      </a>
	    </div>
	    <div id=collapseThirteen class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <p>모든 히스토리는 [나의 zabara] → [게시글 확인] 에 저장하고 있어요. 게시글이 노출되는 동네는 물론, 기간이나 예산까지 확인할 수 있어요.</p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseForeteen">
	        Q. ZABARA 공통 제한사항 안내
	      </a>
	    </div>
	    <div id=collapseForeteen class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <strong>[ZABARA 게시글 공통 제한사항 안내]</strong>
			
			<p>1) 선정적인 광고</p>
			<ul>
			<li>과도한 노출 이미지, 퇴폐업소, 성매매, 성범죄 관련 표현이 포함된 경우</li>
			<li>성적 흥미에만 호소할 뿐 하등의 문학적·예술적·사상적·과학적·의학적·교육적 가치가 없는 경우</li>
			</ul>
			
			<p>2) 폭력적, 혐오 유발, 공포감을 주는 광고</p>
			<ul>
			<li>흉기, 폭행, 고문, 학대, 자학행위, 살상, 사체, 자살 등을 표현하는 경우</li>
			<li>범죄를 묘사하거나 희화화, 미화한 경우</li>
			</ul>
			
			<p>3) 저급한 언어를 사용한 광고</p>
			<ul>
			<li>비속어, 욕설이 포함된 경우</li>
			<li>과도한 줄임말, 초성만 표기한 경우</li>
			</ul>
			
			<p>4) 거짓, 허위, 과장광고</p>
			<ul>
			<li>사실과 다르거나 사실을 지나치게 부풀려서 소비자를 속이거나 오인될 우려가 있는 경우 (예) 공식, 1위, 수상, 인증, 최고, 최저, 100%</li>
			<li>중요한 사항에 관한 구체적 사실을 허위로 기재한 경우 (예) 보증, 추천, 부작용 없음</li>
			<li>구매 선택에 영향을 줄 수 있는 중요한 사실이나 정보를 은폐, 축소하는 경우</li>
			<li>다이어트 관련 과장된 표현</li></br>
			<p>한 달에 10kg 이상의 체중감량 문구를 기재한 경우</p>
			<p>감량 보장 등 소비자를 기만하거나 혼동시킬 우려가 있는 문구를 기재한 경우</p>
			</ul>
			
			<p>5) 타업체·타인 비방, 차별을 조장하는 광고</p>
			<ul>
			<li>출신 국가, 문화, 인종, 피부색, 성별, 나이, 종교, 장애 관련 비하 표현이 있는 경우</li>
			<li>사회적 신분, 혼인 관련 내용, 출산여부, 성적지향, 학력, 외모 조롱 또는 희화화 한 경우</li>
			<li>다른 업체 또는 다른 업체의 상품, 서비스를 특정하여 비교, 비난하는 경우</li>
			<li>객관적인 근거가 없거나 타업체에 대한 불리한 내용만을 기재하며 자사 제품의 우월성만 강조하는 경우</li>
			</ul>
			
			<p>6) 법적 이슈가 있는 권리침해 광고</p>
			<ul>
			<li>저작권법, 상표법, 상표권, 지식재산권, 인격권 (생명권, 초상권, 명예권)침해에 해당할 수 있는 경우</li>
			<li>공식 계약 등으로 광고에 적용 가능하다면 별도 소명 후 광고 진행 가능</li>
			<li>개인정보 유출의 위험이 있거나, 개인정보가 포함된 내용의 광고 (예) 생년월일, 주민등록번호, 휴대폰번호, 이름</li>
			</ul>
			
			<p>7) 기타 사회질서를 저해하는 광고</p>
			<ul>
			<li>학교교육 등 교육을 왜곡하여 교육 기풍을 해하는 내용</li>
			<li>도박 등 사행심을 조장하는 내용</li>
			<li>역사적 사실을 왜곡하거나 국가/사회 존립의 기본체제를 훼손할 우려가 있는 내용</li>
			</ul>
			
			<p>8) ZABARA 서비스로 오인될 우려가 있는 광고</p>
			<ul>
			<li>ZABARA의 로고, 상표, 서비스명, 저작물 등을 무단으로 사용한 경우</li>
			<li>ZABARA 서비스로 오인될 여지가 있는 내용</li>
			</ul>
	      </div>
	    </div>
	  </div>
	  
	  <div class="card">
	    <div class="card-header">
	      <a class="collapsed card-link" data-toggle="collapse" href="#collapseFifthteen">
	        Q. 게시글을 삭제할 수 있나요?
	      </a>
	    </div>
	    <div id=collapseFifthteen class="collapse" data-parent="#accordion">
	      <div class="card-body">
	        <strong>삭제를 포함한 게시글 관리는 [나의zabara] → [게시글 확인] 에서 진행할 수 있어요.</strong>
	        <p>1 - 삭제하고 싶은 글을 클릭하고,</p>
	        <p>2 - [게시 중단하기] 버튼을 눌러요.</p>		
			<p>3 - '게시글 삭제하기' 버튼을 누르면, 해당 글이 삭제돼요.</p></br>		
			<h5>삭제한 게시글은 다시 복원할 수 없으니, 신중히 삭제해 주세요.</h5>
	      </div>
	    </div>
	  </div>
	  
	  
	  

    </div>
  </div>
  <!-- End Q&A Section -->