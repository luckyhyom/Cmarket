<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>sellList</title>

<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<link rel="stylesheet" href="${root}/css/boardDetail.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<script src="./js/boardDetail.js" defer></script>

<style>
section:nth-of-type(1) {
	margin-top: 100px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>

	<section class="boardList">
		<ul class="boardList__">
			<h1 style="border-bottom: 1px solid gainsboro">너랑나랑은 님의 판매내역</h1>
			<h1>전체</h1>
			<a href="../productBoard/pbDetail.jsp"><li class="board">
				<div class="titleImg">
					<img src="${root}/img/note9.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li></a>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/sofarTable.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>소파 테이블</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">13,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/samsungMonitor.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>삼성 게이밍 모니터</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">150,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/korunbike.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>자전거</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">70,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/ikea10000.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>이케아 가구 팝니다</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">50,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/graphick.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>gtx2070 급처</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>판매중</h1>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Beomsu.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Bill.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>판매완료</h1>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Beomsu.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Bill.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
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
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
