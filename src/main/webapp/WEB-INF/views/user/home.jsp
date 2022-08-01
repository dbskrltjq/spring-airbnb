<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 아이콘 라이브러리 -->
<script src="https://kit.fontawesome.com/2628157b3b.js"></script>
<!-- 구글 로그인 api -->
<meta name="google-signin-client_id" content="">
<!-- 구글 api 사용을 위한 스크립트 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<!-- 카카오 로그인지원 자바스크립트 라이브러리를 포함시킨다. -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#btn-login-register, 
	#btn-register,
	#btn-login,
	#btn-register-complete {background: rgb(251,63,111);
			   background: radial-gradient(circle, rgba(251,63,111,1) 0%, rgba(252,70,205,0.6617997540813201) 75%);
			   color: white;
			   font-size: large;
			   font-weight: bold;
			   }
				   
	.line {
	display:flex;
	flex-basis:100%;
	align-items:center;
	color:rgba(0,0,0,0.35);
	font-size:14px;
	margin:8px 0px;
	}
	.line::before, .line::after {
		content:"";
		flex-grow:1;
		margin:0px 16px;
		background:rgba(0,0,0,0.35);
		height:1px;
		font-size:0px;
		line-height: 0px;
	}
	
	.modal-dialog {
		
		width: 60%;
	}
	
	#agree1, #agree2 {zoom:3.0;}
	#password-helper p {font-size: small; margin: 0%;}
	
	h4, h5 {font-weight: bold;}
	
	/* #btn-expose-password {
	position: absolute;
	top: 0;
	right: 0;
	height: inherit;} */
	
</style>
</head>
<body>





<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-login-modal">
  로그인/회원가입
</button>

<!-- 이메일 입력 모달1 -->
<div class="modal fade" id="email-login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold" id="exampleModalLabel">로그인 또는 회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<div>
      		<h3 class="fw-bold" >에어비앤비에 오신 것을 환영합니다.</h3>
      	</div>
      	<div>
      		<form action="" method="post" class="needs-validation" novalidate>
	      		<div class="form-floating my-4">
			     	<input type="text" class="form-control outline" name="email" placeholder="이메일" required >
			     	<label for="floatingInput">이메일</label>
			     	<div class="invalid-feedback">
			     		<i class="fa-solid fa-circle-exclamation"></i>  이메일을 입력해주세요
			     	</div>
		    	</div>
			    <div class="d-grid gap-2 my-4">
				     <button type="button" class="btn p-3" id="btn-login-register">계속</button>
			    </div>
      		</form>
      		<div class="line">
      			또는
      		</div>
		    <div class="d-grid gap-2">
		    	<button type="button" class="btn btn-outline-dark" >페이스북으로 로그인하기</button>
				<button type="button" class="btn btn-outline-dark">구글로 로그인하기</button>
		    	<button type="button" class="btn btn-outline-dark" >Apple 계정으로 로그인하기</button>
		    	<a id="custom-login-btn">
				  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="242" />
				</a> 
		    </div>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- Button trigger modal  나중에 삭제-->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#login-password-modal">
  로그인-비밀번호
</button>


<!-- 로그인의 경우 비밀번호 입력 모달2 -->
<div class="modal fade" id="login-password-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold" id="exampleModalLabel">로그인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body m-2">
      	<div class="row rounded-3  d-none">
      		<div class="col-1">
      			<i class="fa-solid fa-3x fa-circle-exclamation"></i>
      		</div>
      		<div class="col-11">
      			<strong>다시 시도해주세요.</strong>
      			<p>올바르지 않은 비밀번호입니다.다시 시도하거나 다른 로그인 방법을 선택하세요.</p>
      		</div>
      	</div>
      	<div>
      		<form action="" method="post">
	      		<div class="form-floating  position-relative my-4 ">
			     	<input type="password" class="form-control outline" name="loginPassword" placeholder="비밀번호"  >
			     	<label for="floatingInput">비밀번호</label>
			     	<button type="button" class="text-reset btn btn-link position-absolute top-50 end-0 translate-middle" id="btn-login-expose-password">표시</button>
		    	</div>
			    <div class="d-grid gap-2 my-4">
				     <button type="button" class="btn p-3" id="btn-login">로그인</button>
			    </div>
      		</form>
      	</div>
      	<div>
      		<a href="" class="text-reset"><strong >비밀번호를 잊으셨나요?</strong></a>
      	</div>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입입력 모달 -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#email-register-modal">
  회원가입
</button>

<!-- Modal -->
<div class="modal fade" id="email-register-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold" id="exampleModalLabel">회원 가입 완료하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="register-form" action="" method="post" class="needs-validation p-2" novalidate>
        	<div class="form-floating">
			     <input type="text" class="form-control outline" name="firstName" placeholder="이름(예: 길동)" required >
			     <label for="floatingInput">이름(예: 길동)</label>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span>이름을 입력해주세요.</span>
				 </div>
			</div>
			
			<div class="form-floating">
			     <input type="text" class="form-control outline" name="lastName" placeholder="성(예: 홍)">
			     <label for="floatingInput">성(예: 홍)</label>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span>성을 입력해주세요.</span>
				 </div>
			    <p id="p-advice">정부 발급 신분증에 표시된 이름과 일치하는지 확인하세요.</p>
		    </div>
		    <div class="form-floating">
			     <input type="date" class="form-control outline" name="birthDate" placeholder="생년원일">
			     <label for="floatingInput">생년월일</label>
			</div>
		    <div class="form-floating">
			     <input type="email" class="form-control outline" name="registerEmail" placeholder="" required >
			     <label for="floatingInput">이메일</label>
			     <p id="p-info">예약 확인과 영수증은 이메일로 보내드립니다.</p>
			     <div class="invalid-feedback">
					<i class="fa-solid fa-circle-exclamation"></i><span>올바른 형식의 이메일을 입력해주세요.</span>
				 </div>
			</div>
		    <div class="form-floating position-relative">
			     <input type="password" class="form-control outline" name="password" placeholder="비밀번호">
			     <label for="floatingInput">비밀번호</label>
			     <button type="button" class="text-reset btn btn-link position-absolute top-50 end-0 translate-middle" id="btn-register-expose-password">표시</button>
			</div>
		    <div id="password-helper" class="p-0">
		     	<p class="d-none" id="ph-1">비밀번호에 본인 이름이나 이메일 주소를 포함할 수 없습니다</p>
				<p class="d-none" id="ph-2">최소8자</p>
				<p class="d-none" id="ph-3">숫자나 기호를 포함하세요</p>
		    </div>
			<div class="row my-3">
				<div class="col-10">
					<label for="agree1">개인정보 수집 및 이용에 동의합니다.
							1. 에어비앤비가 수집하는 개인 정보 에어비앤비 플랫폼을 이용하는 데 필요한 정보 당사는 
							회원님이 에어비앤비 플랫폼을 이용할 때 회원님의 개인 정보를 수집합니다. 
							그렇지 않은 경우, 에어비앤비는 요청하신 서비스를 회원님께 제공하지 못할 수 있습니다. 이러한 정보에는 다음이 포함됩니다.
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree1">
				</div>
			</div>
		    <div class="row mb-3">
		    	<div class="col-10">
					<label for="agree2">마케팅 이메일 수신을 원합니다(선택).
						 에어비앤비 회원 전용 할인, 추천 여행 정보, 마케팅 이메일, 푸시 알림을 보내드립니다. 
						 계정 설정 또는 마케팅 알림에서 언제든지 수신을 거부할 수 있습니다.
					</label>
				</div>
				<div class="col-2 ps-5">
					<input type="checkbox" id="agree2" >
				</div>
		    </div>
        	<div>
        		동의 및 계속하기를 선택하여 에어비앤비 <strong>서비스 약관</strong>, <strong>결제 서비스 약관</strong>, 
        		<strong>위치기반서비스 이용약관</strong>, <strong>차별 금지 정책</strong>, <strong>개인정보 처리방침</strong>에 동의합니다.
        	</div>
        	<div class="d-grid gap-2 my-4">
        	<button type="button" class="btn p-3" id="btn-register">동의 및 계속하기</button>
        	</div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- 회원가입 완료 모달 -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#register-complete-modal">
  회원가입 완료 모달
</button>

<div class="modal fade" id="register-complete-modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold" id="exampleModalLabel">프로필 생성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	  <div class="modal-body text-center">
			<img src="/resources/logo.png" alt="logo">
			<h4>에어비앤비에 오신 것을 환영합니다.</h4>
			<p>전 세계 숙소, 현지 레스토랑 및 독특한 체험을 찾아보세요.</p>
			<div class="d-grid gap-2 my-4">
		       <button type="button" class="btn p-3" id="btn-register-complete" data-bs-target="#upload-profile-modal" data-bs-toggle="modal" data-bs-dismiss="modal">계속</button>
		    </div>
	  </div>
    </div>
  </div>
</div>
<div class="modal fade" id="upload-profile-modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">프로필 생성하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center p-5">
        <h4>프로필 사진 추가</h4>
        <div>
	        <p class="fs-5">얼굴이 보이는 이미지를 선택하세요. 호스트는 예약이 확정된 후에만 사진을 볼 수 있습니다.</p>
	        <p class="fs-5 d-none">이 사진이 내 프로필에 추가됩니다. 호스트나 캐스트가 보게 되는 사진이므로 개인정보나 민감한 정보가 표시되지 않도록 하세요.</p>
        </div>
        <form id="form-profileImg" action="" method="post" enctype="multipart/form-data" >
	        <div class="">"
		        <img src="/resources/logo.png">
	        </div>
	        <div class="d-grid gap-2 my-4">
	        	<input type="file" name="profileImg" id="profile-img" class="d-none" accept="image/gif, image/jpeg, image/png" />
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold" id="btn-add-profileImg"><i class="fa-solid fa-cloud-arrow-up text-start"></i> 사진 업로드하기</button>
	        	<button type="button" class="btn btn-dark p-3 fs-5 fw-bold d-none" id="btn-add-complete" data-bs-dismiss="modal" aria-label="Close">완료</button>
	        	<button type="button" class="btn btn-outline-dark p-3 fs-5 fw-bold" id="btn-use-facebookImg">페이스북 사진 사용</button>
	        	<button type="button" class="btn btn-outline-dark p-3 fs-5 fw-bold d-none" id="btn-change-profileImg">사진 변경</button>
	        </div>
        </form>
        <div>
        	<button type="button" class="btn btn-link text-reset fw-bold fs-5" data-bs-dismiss="modal" aria-label="Close">나중에 할게요</button>
        </div>
      </div>
    </div>
  </div>
</div>

<a href="/user/wishlists">마이 위시리스트</a>




<div class="border p-3 mb-4 bg-light">
	<!-- <a id="custom-login-btn">
	  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="242" />
	</a>  -->
   	<form id="form-kakao-login" method="post" action="kakao-login">
   		<input type="hidden" name="id" />
   		<input type="hidden" name="nickname" />
   		<input type="hidden" name="email" />
   		<input type="hidden" name="gender" />
   	</form>
</div>
<button class="api-btn" id="btn-kakaoLogout">카카오 로그아웃</button>


<div class="g-signin2" data-onsuccess="onSignIn"></div>
<div id="logout" style="display: none;">
		<input type="button" onclick="signOut();" value="로그아웃" /><br>
		
		<img id="upic" src=""><br>
		<span id="uname"></span>
	</div>
	
<script type="text/javascript">
$(function () {
	
	Kakao.init('2931d0043daf4865ac102f53587fef2c'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	$("#custom-login-btn").click(function() {
		Kakao.Auth.login({
	          success: function(authObj) {
	            //alert(JSON.stringify(authObj))
	            Kakao.API.request({
	                url: '/v2/user/me',
	                success: function(response) {
	                	let account = response.kakao_account;
	                	alert(JSON.stringify(account));
	                	$('#form-kakao-login input[name=id]').val(response.id);
	                	$('#form-kakao-login input[name=email]').val(( account.email != undefined ?  account.email : ''));
	                	$('#form-kakao-login input[name=nickname]').val(account.profile.nickname);
	                    $('#form-kakao-login input[name=age]').val(account.age_range);
	                    $('#form-kakao-login input[name=gender]').val(account.gender);
	                    //let properties = response.properties;
	                    //let profile_image = properties.profile_image;
	                    // 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector("#form-kakao-login").submit();
	                },
	                fail: function(error) {
	                    console.log(error);
	                }
	            });
	          },
	          fail: function(err) {
	            alert(JSON.stringify(err))
	          },
	        })
	})
	
	$("#btn-kakaoLogout").click(function() {
		if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log("로그아웃 성공");
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
	})
	
	// 구글 로그인 test
	function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      } 
	/* function onSignIn(){
		var auth2 = gapi.auth2.getAuthInstance()
		if(auth2.isSignedIn.get()){
		 var profile = auth2.currentUser.get().getBasicProfile();
		 googleLoginPro(profile)
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		
		}
	}
	
	function signOut() {
		if(gapi.auth2 != undefined){
		 	var auth2 = gapi.auth2.getAuthInstance();
	   		 auth2.signOut().then(function () {
	    	  console.log('User signed out.');
	    	});
		}

		
		location.href= "/user/logOut.do"
	} */
	
	let $firstName = $(":input[name=firstName]");
	let $lastName = $(":input[name=lastName]");
	let $birthDate = $(":input[name=birthDate]");
	let $email = $(":input[name=email]");
	let $registerEmail = $(":input[name=registerEmail]");
	let $password = $(":input[name=password]");
	
	
	let emailRegExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	let passwordRegExp =  /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;

	
	let validEmail = false;
	$email.keyup(function() {
		let email = $email.val().trim();
		if (email === "") {
			$email.removeClass("is-valid").addClass("is-invalid");
			return;
		}
		if (!emailRegExp.test(email)) {
			$email.removeClass("is-valid").addClass("is-invalid");
			return;
		}
		
		$email.addClass("is-valid").removeClass("is-invalid");
		validEmail = true;
	});
	
	let loginPasswordmodal = new bootstrap.Modal(document.getElementById("login-password-modal")); 
	let registerModal = new bootstrap.Modal(document.getElementById("email-register-modal")); 
	// 로그인 및 회원가입 모달창에서 이메일 입력폼 제출
	$("#btn-login-register").click(function() {
		if(!validEmail) {
			$email.focus();
			$email.keyup();
			return false;
		}
		$(".btn-close").click();
		
		let email = $email.val().trim();
		console.log(email);
		
		$.getJSON("/user/checkEmail", "email=" + email, function(result) {
			
			// 사용자가 입력한 이메일이 db에 존재하면 비밀번호입력모달(로그인), 그렇지 않으면 회원가입모달창을 띄운다.
			if(result.exist) {
				loginPasswordmodal.show();
				return;
			} else {
				registerModal.show();
				$(":input[name=registerEmail]").val(email);
				return;
			}
		});
	});
	
	// 회원가입 모달의 이메일 입력필드
	$registerEmail.keyup(function() {
		let email = $registerEmail.val().trim();
		if(email === "" || !emailRegExp.test(email)) {
			$registerEmail.removeClass("is-valid").addClass("is-invalid");
			$("#p-info").addClass("d-none");
			return;
		}
		
		$registerEmail.addClass("is-valid").removeClass("is-invalid");
		$("#p-info").removeClass("d-none");
	})

	
	$firstName.keyup(function() {
		
		let firstName = $(this).val().trim();
		if(firstName == "") {
			$(this).removeClass("is-valid").addClass("is-invalid");
			return;
		} 
		$(this).addClass("is-valid").removeClass("is-invalid");
	});
	
	$lastName.keyup(function() {
		
		let lastName = $(this).val().trim();
		if(lastName == "") {
			$(this).removeClass("is-valid").addClass("is-invalid");
			$("#p-advice").addClass("d-none");
			return;
		} 
		$(this).addClass("is-valid").removeClass("is-invalid");
		$("#p-advice").removeClass("d-none");
		
	});
	
	
	// 비밀번호 숨기기&표시 
	$("#btn-login-expose-password").click(function() {
		if($("#btn-login-expose-password").text() == "표시") {
			$password.attr("type", "text");
			//$password.css("ime-mode", "disabled");
			$("#btn-login-expose-password").text("숨기기");
		} else {
			$password.attr("type", "password");
			$("#btn-login-expose-password").text("표시");
		}
	});
	$("#btn-register-expose-password").click(function() {
		if($("#btn-register-expose-password").text() == "표시") {
			$password.attr("type", "text");
			//$password.css("ime-mode", "disabled");
			$("#btn-register-expose-password").text("숨기기");
		} else {
			$password.attr("type", "password");
			$("#btn-register-expose-password").text("표시");
		}
	});
	
	
	
	
	$password.focus(function() {
		
		$("#password-helper p").removeClass("d-none");
	});
	
	
	$password.keyup(function(event) {
				
		let password = $(this).val().trim();
		let firstName = $firstName.val().trim();
		let email = $registerEmail.val().trim();
		
		let koreanRegExp = /[ㄱ-힣]+/
		if(koreanRegExp.test(password)) {
			$password.val(password.replace(/[ㄱ-힣]/g, ''));
		}
		
		if(password.includes(firstName)) {
			$("#ph-1").removeClass("text-success").addClass("text-danger");
		} else {
			$("#ph-1").removeClass("text-danger").addClass("text-success");
		}
		
		if(password.length < 8) {
			$("#ph-2").removeClass("text-success").addClass("text-danger");
		} else {
			$("#ph-2").removeClass("text-danger").addClass("text-success");
		}
		
		if(!passwordRegExp.test(password)) {
			$("#ph-3").removeClass("text-success").addClass("text-danger");
		} else {
			$("#ph-3").removeClass("text-danger").addClass("text-success");
		}
		
	});
	
	
	
		
		
		
	
	// 회원가입 입력폼 제출
	$("#btn-register").click(function() {
		
		let querystring = $("#register-form").serialize();
		$.post("/user/register", querystring, function(result) {
			if(result.success) {
				
				$("#email-register-modal .btn-close").click();
				let modal = new bootstrap.Modal(document.getElementById("register-complete-modal")); 
				modal.show();
			}
		})
		
	});
	
	$("#btn-add-profileImg").click(function() {
		$("#profile-img").click();
	});
	$("#btn-change-profileImg").click(function() {
		$("#profile-img").click();
	});
	
	$("#profile-img").change(function() {
		
		$("#upload-profile-modal h4").text("좋아요!");
		$("#upload-profile-modal p").text("이 사진이 내 프로필에 추가됩니다. 호스트나 캐스트가 보게 되는 사진이므로 개인정보나 민감한 정보가 표시되지 않도록 하세요.");
		$("#btn-add-profileImg").addClass("d-none");
		$("#btn-add-complete").removeClass("d-none");
		$("#btn-use-facebookImg").addClass("d-none");
		$("#btn-change-profileImg").removeClass("d-none");
		
		let formData = new FormData(document.getElementById("form-profileImg"));			// $("#form-profileImg")오류?
		
		$.ajax({
			type: "POST",								
			url: "/user/addProfileImg",			
			data: formData,	
			processData: false,
			contentType: false,			
			success: function(data) {					// 성공적인 응답이 왔을 때 실행되는 함수, data에는 서버가 보내느 응답데이터가 있다.
				alert("성공");
			} 
			
		});
		
		/* $.post("/user/addProfileImg", form, function(data) {
			
		}); */
		
		
	});
	
	
	
})

</script>

</body>
</html>