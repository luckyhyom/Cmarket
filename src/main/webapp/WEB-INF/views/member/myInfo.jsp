<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myInfo</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="${root}/css/chatApply.css" />
<link rel="stylesheet" href="${root}/css/userProfile.css" />
<link rel="stylesheet" href="${root}/css/myInfo.css" />
<body>
	<c:import url="../common/header.jsp"/>

	<section class="profileSections">
		<div class="profileSections__">
			<div class="profileTop">
				<div class="profileImg">
					<img src="${root}/img/Hyoshin.png" alt="" />
				</div>
				<div class="topRight">
					<div class="profileName">너랑나랑은</div>
					<button class="toUpdate">
						내 정보 수정</ㅠ>
						<div class="profileTopBtn">
							<!-- <button>대화하기</button>
              <button>칭찬</button>
              <button>비매너</button> -->
							<!-- <button><a href="">매너평가하기</a></button> -->
						</div>
				</div>
				<!-- <ul class="judge">
            <div class="judgeGood">칭찬</div>
            <div class="judgeBad">비매너</div>
          </ul> -->
			</div>
			<div class="profileTemp">
				<div class="tempCount">매너온도 75.6C🥰</div>
				<div class="temp">
					<div class="temp__"></div>
				</div>
			</div>
			<div class="sellList">
				<button>
					<a href="sellList.do">판매내역</a>
				</button>
				<button>
					<a href="sellList.do">구매내역</a>
				</button>
				<button>
					<a href="sellList.do">관심목록</a>
				</button>
				<button>
					<a href="sellList.do">모아보기</a>
				</button>
				<div class="keywords">
					<div class="keywordInputs">
						<input type="text" class="keywordInput"></input>
						<button class="keywordBtn" style="width: 100px;">키워드 추가</button>
					</div>

					<ul class="keywordList">
						<li class="keyword">나이키<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
