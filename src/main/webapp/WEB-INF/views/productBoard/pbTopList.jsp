<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>topList</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<link rel="stylesheet" href="${root}/css/topList.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<body>
<%-- 	<nav>
		<div class="nav">
			<div class="navR">
				<div class="logo">
					<img src="${root}/img/LOGO.png" alt="cucumber logo" />
				</div>
				<div class="searchBar">
					<input type="search" class="searchText" placeholder="물품명을 검색해보세요!" />
					<i class="fas fa-search"></i>
				</div>
			</div>

			<div class="login">
				<a href="" style="width: 66px">Login</a> <a style="width: 154px">
					<i class="fab fa-apple"></i> App Store
				</a>
			</div>
		</div>
	</nav>
 --%>
 
 <c:import url="../common/header.jsp"/>
 
	<section class="mainCategory">
		<div class="mainCategoryBox">
			<div class="topList">오늘의 중고 인기 검색어</div>
			<ul class="cateList">
				<li class="category">
					<div class="left">
						<span class="ranks">1</span> <a href="pbList.do">자전거</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">2</span> <a href="#">캠핑</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">3</span> <a href="#">의자</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">4</span> <a href="#">노트북</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">5</span> <a href="#">냉장고</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">6</span> <a href="#">낚시</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">7</span> <a href="#">아이패드</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">8</span> <a href="#">아이폰</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">9</span> <a href="#">텐트</a>
					</div> <span class="current">-</span>
				</li>
				<li class="category">
					<div class="left">
						<span class="ranks">10</span> <a href="#">컴퓨터</a>
					</div> <span class="current">-</span>
				</li>
			</ul>
		</div>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
