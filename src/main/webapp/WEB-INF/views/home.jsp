<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>home</title>

<c:url value="/resources" var="root"/>
<%-- <c:url value="/resources/js/common.js" /> --%>

<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="${root}/css/chatApply.css" />


</head>

<body>
	<c:import url="common/header.jsp"/>

	<section class="sections">
		<div class="sections__">
			<div class="text">
				<h1>
					오늘도 이 마켓<br />오이마켓
				</h1>
				<span>중고 거래부터 동네 정보까지, 이웃과 함께 해요.<br /> 가깝고 따뜻한
					당신의 근처를 만들어요.
				</span>
			</div>
			<div class="textImg">
				<img src="${root}/img/section1.png" alt="" />
			</div>
		</div>
	</section>

	<section class="sections">
		<div class="sections__">
			<div class="textImg">
				<img src="${root}/img/section2.png" alt="" />
			</div>
			<div class="text">
				<h1>
					우리 동네<br /> 중고 직거래 마켓
				</h1>
				<span>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</span>
			</div>
		</div>
	</section>

	<section class="sections" style="">
		<div class="sections__">
			<div class="text">
				<h1>
					이웃과 함께 하는<br /> 동네 생활
				</h1>
				<span>우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</span>
			</div>
			<div class="textImg">
				<img src="${root}/img/section3.png" alt="" />
			</div>
		</div>
	</section>

	<section class="sections" style="">
		<div class="sections__">
			<div class="textImg">
				<img src="${root}/img/section4.png" alt="" />
			</div>
			<div class="text">
				<h1>
					내 근처에서 찾는<br /> 우리 동네 가게
				</h1>
				<span>우리 동네 가게를 찾고 있나요?<br /> 동네 주민이 남긴 진짜 후기를
					함께 확인해보세요!
				</span>
			</div>
		</div>
	</section>

	<section class="mainCategory">
		<div class="mainCategoryBox">
			<div class="topList">중고거래 인기검색어</div>
			<ul class="cateList">
				<li class="category"><a href="pbTopList.do">자전거</a></li>
				<li class="category"><a href="#">캠핑</a></li>
				<li class="category"><a href="#">의자</a></li>
				<li class="category"><a href="#">노트북</a></li>
				<li class="category"><a href="#">냉장고</a></li>
				<li class="category"><a href="#">낚시</a></li>
				<li class="category"><a href="#">아이패드</a></li>
				<li class="category"><a href="#">아이폰</a></li>
				<li class="category"><a href="#">텐트</a></li>
				<li class="category"><a href="#">컴퓨터</a></li>
			</ul>
		</div>
	</section>
<c:import url="common/footer.jsp"/>
	<%-- <footer>
		<div class="fTop">
			<div class="logo">
				<img src="${root}/img/LOGO.png" alt="" />
			</div>
			<div class="fDiv1">
				<a href="#">믿을 수 있는 거래</a> <a href="#">자주 묻는 질문</a>
			</div>
			<div class="fDiv2">
				<a href="#">회사 소개</a> <a href="#">광고주 센터</a> <a href="#">동네가게</a>
			</div>
			<div class="fDiv3">
				<a href="#">이용약관</a> <a href="#">개인정보취급방침</a> <a href="#">결제기반서비스
					이용약관</a>
			</div>
		</div>
		<div class="fBot">
			<div class="botL">
				<ul>
					<li>고객문의 <a href="mailto:gyals0386@gamil.com">gyals0386@gmail.com</a>
					</li>
					<li><a>사업자 등록번호 : 777-77-00077</a> <a>구로구 디지털로 30길 28 609호</a>
					</li>
					<li>©Cucumber Market Inc.</li>
				</ul>
			</div>
			<div class="botR">
				<i class="fab fa-facebook-square"></i> <i
					class="fab fa-instagram-square"></i> <i class="fab fa-github"></i>
			</div>
		</div>
	</footer> --%>
</body>
</html>
