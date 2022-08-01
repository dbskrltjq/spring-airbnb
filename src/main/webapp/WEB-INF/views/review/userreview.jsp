<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css"> 
	
	.next 	{  background: white;
			   color: rgb(255, 90, 95);
			   font-size: large;
			   font-weight: bold;
			   border: 2px solid rgb(255, 90, 95);
	}
	
	.next:hover {
		 background: rgb(255, 90, 95) !important;
		 color: white;
	}
	
	.modal-content {		
		width: 100%;
	}
	
	.question 		{
		 font-size: 18px; 
	}
	
	.bi-star  		{
		 color: rgb(0, 166, 153); 
	}
	 
	.bi-star-fill   {
		 color: rgb(0, 166, 153); 
	}
	
	.bi-hand-thumbs-down-fill   {
		 color: rgb(0, 166, 153); 
	}
	
	.bi-hand-thumbs-up-fill   {
		 color: rgb(0, 166, 153); 
	}
	 
	.gray 			{
		 color: #323232; 
	}
	
	[type=radio] { 
		 position: absolute;
		 opacity: 0;
		 width: 0;
		 height: 0;
	}
	
</style>
</head>
<body>
<div class="container">
	<div class="row mb-4">
		<div class="col-12">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" id="btn-exampleModalToggle">
			  리뷰 작성하기
			</button>		
		</div>
	</div>
</div>

<!-- form 시작 -->
<form class="mb-3" name="guestReview" id="guest-review" method="post" action="reviewcomplete">			
<!-- Scrollable Modal -->
<div class="modal fade" id="review-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-dialog-scrollable modal-lg">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h3 class="modal-title" id="exampleModalLabel"><strong>평가 및 후기</strong></h5>
       	 		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>			      
      		<div class="modal-body">
				<div class="row">
					<div class="col-4">
		      			<img scr="" /> 이미지 들어가는 곳
		      			<h5>Danny의 집</h5>
		      			<ul>
		      				<li>집 전체</li>
		      				<li>후기 34개</li>
		      				<li>산 호세(San hose)</li>
		      			</ul>
		      			<h5>호스트: Danny</h5>
		      			<p>2016년 1월 1일~2016년 1월 5일</p>
		     		</div>
		     		<div class="col-8">		
		     			<div class="row">
		     				<div class="col-12">
		      					<div class="mt-3 mb-5">
					      			<h3 class="mb-3 gray"><strong>Danny님에 대한 후기를 쓰세요.</strong></h3>
					      			<p class="gray">14일 동안 후기를 작성할 수 있습니다. 후기 작성 기간 동안에는 호스트도 회원님에 대한 후기를 작성해야 회원님의 피드백을 읽을 수 있습니다. 
					      	   			후기 작성 기간이 종료되면, 회원님의 피드백이 공개됩니다. 후기 작성 가이드 라인을 살펴보세요.
					      				<br /><br />
					      	   		호스트는 카테고리별 평점은 보지 못하고 전체 평균 별점만 알 수 있습니다. 후기 작성에 대해 자세히 알아보세요.
					      			</p>
					    		</div>
		     				
		     				</div>
		     			</div>	
		     			<div class="row">
		     				<div class="col-12">
						       	<h3 class="mb-5 gray"><strong>숙박이 어땠나요?</strong></h3>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="total-score"><strong>전체적 만족도</strong></h3>
										<div id="box-total">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="total" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="clean-score"><strong>청결도</strong></h3>
										<p class="gray question">숙소는 회원님이 예상한 것만큼 깨끗한가요?</p>
										<div id="box-clean">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="clean" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="accuracy-score"><strong>정확성</strong></h3>
										<p class="gray question">숙소 사진과 설명이 실제 숙소와 얼마나 일치하나요?</p>
										<div id="box-accuracy">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="accuracy" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="communication-score"><strong>커뮤니케이션</strong></h3>
										<p class="gray question">숙박기간 전, 혹은 도중에 호스트와 연락이 잘 되고, 문의한 사항에 대하여 호스트가 빨리 응답해 왔습니까?</p>
										<div id="box-communication">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="communication" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="location-score"><strong>위치</strong></h3>
										<p class="gray question">숙소 지역은 만족하셨나요? 안전성과 편리성을 고려해 주세요.</p>
										<div id="box-location">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="location" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="checkin-score"><strong>체크인</strong></h3>
										<p class="gray question">호스트는 회원님의 원활한 체크인 절차를 위해 최선을 다했나요?</p>
										<div id="box-checkin">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="checkin" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="convenience-score"><strong>편의시설</strong></h3>
										<p class="gray question">호스트가 숙소 설명에 약속된 모든 것을 제공하였나요?</p>
										<div id="box-convenience">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="convenience" value="0">
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-12">
										<h3 class="fs-4 gray" id="value-score"><strong>가치</strong></h3>
										<p class="gray question">이 숙소를 평가하자면?</p>
										<div id="box-value">
											<i class="bi bi-star fs-2" data-score="1"></i>
											<i class="bi bi-star fs-2" data-score="2"></i>
											<i class="bi bi-star fs-2" data-score="3"></i>
											<i class="bi bi-star fs-2" data-score="4"></i>
											<i class="bi bi-star fs-2" data-score="5"></i>
											<input type="hidden" name="valueS" value="0">
										</div>
									</div>
								</div>
								<div align="right">
									<button type="button" class="btn px-5 next" id="star-next-btn">다음</button>
								</div>
							</div>
						</div>
		      		</div>
		     	</div>
			</div>		  
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel2"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="text-center mb-5 mt-3">	
		        	<h3><strong>이 숙소를 다시 이용하고 싶으신가요?</strong></h3>
		        	<p>답변은 회원님의 프로필 또는 호스트의 숙소 페이지에 공개되지 않습니다.</p>
		        </div>
        		<div class="text-center">
        			<div class="mb-5">
					    <input type="radio" name="thumb" id="down-thumb" value="부정">
					    <label for="down-thumb" id="bi-hand-thumbs-down" class="bi bi-hand-thumbs-down fs-1">
					    	<span class="fs-4" style="color: black">아니요 &nbsp;</span>
					    </label>
					    <input type="radio" name="thumb" id="up-thumb" value="긍정" >
					    <label for="up-thumb" id="bi-hand-thumbs-up" class="bi bi-hand-thumbs-up fs-1">
					    	<span class="fs-4" style="color: black">예!</span>
					    </label>
					</div>    
					<div class="modal-footer">
						<button type="button" class="btn px-5 next" id="thumb-next-btn">다음</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel3"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-5">
					<h3>공개후기<span class="fs-5">  (필수항목)</span></h3>
					<p class="mb-4">회원님의 후기는 호스트의 프로필과 숙소 페이지에 전체 공개됩니다.
					   다음 페이지에서 에어비앤비에게 비공개로 추가 피드백을 남기실 수 있습니다.
					   한국어로 공개 후기를 작성하세요.
					   다른 게스트는 필요한 경우 자동 번역문을 읽을 수 있습니다. </p>
					<textarea name="public" id="public-text" cols="100" rows="5"  maxlength="500" style="resize:vertical;" 
							  placeholder="호스트가 어떻게 회원님을 맞이하였나요? 숙소 설명은 명확하였나요? 숙소가 위치한 지역은 어떤가요?"></textarea>
					<p align="right">남은 글자 수 : <span id="test-length">( 500 / 500 )</span>자</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn px-5 next" id="public-next-btn">다음</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="exampleModalToggle4" aria-hidden="true" aria-labelledby="exampleModalToggleLabel4" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel4"><strong>평가 및 후기</strong></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<div class="mb-4">
						<h3>호스트 비공개 피드백</h3>
						<p>이 피드백은 비공개이며, 해당 호스트와 에어비앤비 직원 빛 서비스 제공자만 볼 수 있습니다.</p>
					</div>
					<div class="mb-4">
						<p><strong>이 숙소에서 가장 마음에 드는 점은 무엇인가요?</strong></p>
						<textarea name="favorite" id="favorite-text" cols="100" rows="5" onkeyup=""></textarea>
					</div>
					<div class="mb-5">
						<p><strong>회원님의 호스트가 더 발전하기 위한 피드백을 주세요.</strong></p>
						<textarea name="feedback" id="feedback-text" cols="100" rows="5" onkeyup=""></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn px-5 next" id="private-next-btn">완료</button>
			</div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript">
$(function() {
	
	let exampleModalToggle1 = new bootstrap.Modal(document.getElementById("review-modal"));
	let exampleModalToggle2 = new bootstrap.Modal(document.getElementById("exampleModalToggle2"));
	let exampleModalToggle3 = new bootstrap.Modal(document.getElementById("exampleModalToggle3"));
	let exampleModalToggle4 = new bootstrap.Modal(document.getElementById("exampleModalToggle4"));
	
	$("#btn-exampleModalToggle").click(function() {
		exampleModalToggle1.show();
	})
	
	// form 1 - 별점
	$("#box-total i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='total']").val(value);
		$("#box-total i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-total i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-clean i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='clean']").val(value);
		$("#box-clean i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-clean i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-accuracy i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='accuracy']").val(value);
		$("#box-accuracy i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-accuracy i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-communication i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='communication']").val(value);
		$("#box-communication i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-communication i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-location i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='location']").val(value);
		$("#box-location i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-location i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-checkin i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='checkin']").val(value);
		$("#box-checkin i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-checkin i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-convenience i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='convenience']").val(value);
		$("#box-convenience i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-convenience i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	$("#box-value i").click(function() {
		let value = $(this).attr("data-score");
		$("input[name='valueS']").val(value);
		$("#box-value i").removeClass("bi-star-fill").addClass("bi-star");
		$("#box-value i:lt(" + value + ")").removeClass("bi-star").addClass("bi-star-fill");
	})
	
	// 별점 미체크 확인
	$("#star-next-btn").click(function() {
		let existEmptyScore = false;
		$("input[type=hidden]").each(function(index, element) {
			if($(element).val() === "0") {
				existEmptyScore = true;
			}
		})
		
		if(existEmptyScore) {
			alert("모든 별점을 체크해야 합니다.");
			return false;
		}
		exampleModalToggle1.hide();
		exampleModalToggle2.show();
	})
	
	// form 2 - 재방문 의사
	
	/*
	$("#bi-hand-thumbs-down").mouseenter(function() {
		$('#bi-hand-thumbs-up').addClass("bi-hand-thumbs-up").removeClass("bi-hand-thumbs-up-fill");
		$("#bi-hand-thumbs-down").removeClass("bi-hand-thumbs-down").addClass("bi-hand-thumbs-down-fill");
		
	})
	
	$("#bi-hand-thumbs-up").mouseenter(function() {
		$("#bi-hand-thumbs-down").addClass("bi-hand-thumbs-down").removeClass("bi-hand-thumbs-down-fill");
		$('#bi-hand-thumbs-up').removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
	})
	*/
	
	$("#bi-hand-thumbs-down").click(function() {
		$("#down-thumb").prop("checked", true);
		$('#bi-hand-thumbs-up').addClass("bi-hand-thumbs-up").removeClass("bi-hand-thumbs-up-fill");
		$("#bi-hand-thumbs-down").removeClass("bi-hand-thumbs-down").addClass("bi-hand-thumbs-down-fill");
	})
	
	$("#bi-hand-thumbs-up").click(function() {
		$("#up-thumb").prop("checked", true);
		$("#bi-hand-thumbs-down").addClass("bi-hand-thumbs-down").removeClass("bi-hand-thumbs-down-fill");
		$('#bi-hand-thumbs-up').removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
	})
	
	// thumb 미체크 확인
	$("#thumb-next-btn").click(function() {
		let existEmptyThumb = false;
		let $checkThumb = $(":radio:checked()").length;
		
		if($checkThumb === 0) {
			existEmptyThumb = true;
		}
	
		if(existEmptyThumb) {
			alert("항목 중 하나를 선택해 주세요.");
			return false;
		}
		exampleModalToggle2.hide();
		exampleModalToggle3.show();
	})
	
	// form 3 - 후기
	// 글자수 세는 함수
	$("#public-text").keyup(function() {
		let content = $(this).val();
		$("#test-length").text("( "+ ( 500 - parseInt(content.length)) +" / 500 )");
		
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#test-length').text("( 0 / 500 )");
			
		}
	})
	
	// 공개 리뷰 미체크 확인
	// 비공개 리뷰는 필수가 아니다.
	$("#public-next-btn").click(function() {
		let existEmptyPublic = false;
		
		if($("#public-text").val() === "") {
			existEmptyPublic = true;
		}
		
		if(existEmptyPublic) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		exampleModalToggle3.hide();
		exampleModalToggle4.show();
	})

})

</script>
</body>
</html>