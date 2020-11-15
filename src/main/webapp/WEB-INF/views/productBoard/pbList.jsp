<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<!-- <link rel="stylesheet" href="${root}/css/boardDetail.css" /> -->
<!-- <link rel="stylesheet" href="${root}/css/boardList.css" /> -->

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
				<a href="">Login</a> <a> <i class="fab fa-apple"></i> App Store
				</a>
			</div>
		</div>
	</nav> --%>
	<c:import url="../common/header.jsp"/>

	<section class="boardList">
		<ul class="boardList__">
			<h1>인기 중고</h1>
			<div class="buttonBox" style="width: 100%; padding: 20px 30px">
				<button style="">글쓰기</button>
			</div>
			<a href="pbDetail.do"><li class="board">
					<div class="titleImg">
						<img src="${root}/img/Beomsu.png" alt="" />
					</div>
					<div class="boardInfo">
						<h1>갤럭시 노트 9 퍼플 128G</h1>
						<span>서울 관악구 신림동</span>
						<div class="worth">
							<span class="price">200,000원</span> <span class="likes">❤️</span>
						</div>
					</div>
			</li></a>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Bill.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Faker.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Hyoshin.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/searon.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Misaki.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/jiseong.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Beomsu.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Bill.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Faker.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Hyoshin.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/searon.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Misaki.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/jiseong.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Beomsu.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes">❤️</span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
