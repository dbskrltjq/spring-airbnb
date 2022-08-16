<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="indexListAjax">
	<c:if test="${not empty wishlist.accs}">
		<c:forEach var="acc" items="${wishlist.accs}" varStatus="loop" >
		<a href="" style="color: black; text-decoration: none;">
			<div class="card mb-3" data-index="${loop.index}" id="card-${acc.accNo }">
			  <div class="row g-0 position-relative">
			    <div class="col-md-5">
			      <div id="carouselExampleIndicators-${acc.accNo }" class="carousel slide" data-interval="false">
					<!-- 숙소 섬네일 슬라이드쇼 -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<!-- 슬라이드쇼 이미지 -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="acc-thumbnail rounded-4 w-100" src="/resources/images/acc/sky.jpg" alt="숙소이미지"  style="object-fit: cover; height: 200px;">
						</div>
						<div class="carousel-item">
							<img class="acc-thumbnail rounded-4 w-100" src="/resources/images/acc/sky.jpg" alt="숙소이미지" style="object-fit: cover; height: 200px;">
						</div>
						<div class="carousel-item">
							<img class="acc-thumbnail rounded-4 w-100" src="/resources/images/acc/sky.jpg" alt="숙소이미지" style="object-fit: cover; height: 200px;">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators-${acc.accNo }" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			    </div>
			    <div class="col-md-7">
			      <div class="card-body pt-0 h-100">
			      	<div class="d-flex justify-content-between">
				        <span class="card-text text-muted">${acc.address }</span>
				        <button type="button" class="btn rounded-circle btn-delete-wishlistAcc" data-accNo="${acc.accNo}"><i id="icon-heart-${acc.accNo}" class="fa-solid fa-heart fs-4"></i></button>
			      	</div>
				    <span class="card-title">${acc.name }</span>
			        <p class="card-text text-muted">최대 인원 2명 원룸 침대2개 욕실 1개</p>
			        <div class="d-flex justify-content-between"  style="margin-top: 72px;">
		        	  <strong><i class="bi bi-star-fill"></i>${acc.reviewScore}<span class="text-black-50">(후기 ${acc.reviewCount}개)</span></strong>
		        	  <span class="fs-5"><strong>₩<fmt:formatNumber value="${acc.price}"/></strong> /박 </span>
			        </div>
			      </div>
			    </div>
			  </div>
				<hr>
			</div>
			</a>
		</c:forEach>
	</c:if>
</div>


</body>
</html>