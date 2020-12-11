<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>boardDetail</title>
</head>
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
<script src="${root }/js/boardDetail.js" defer></script>
<body>
	<c:import url="../common/header.jsp"/>
	<section class="boardDetail">
		<div class="boardDetail__">
			<ul class="boardImgs">
				<i class="fas fa-angle-left left"></i>
				<i class="fas fa-angle-right right"></i>
				<ul class="imgList">
					<li class="boardImg"><img src="${root}/img/grapick.jpeg"
						alt="" /></li>
					<li class="boardImg"><img src="${root}/img/searon.png" alt="" />
					</li>
					<li class="boardImg"><img src="${root}/img/Hyoshin.png" alt="" />
					</li>
				</ul>
			</ul>
			<div class="boardUserInfo">
				<div class="userInfo">
					<img src="${root}/img/Hyoshin.png" alt="" />
					<div class="userInfo__">
						<div class="userInfo__name">
							<a href="userProfile.do">너랑나랑은</a>
						</div>
						<div class="userInfo__address">아직구 안돼동</div>
					</div>
				</div>
				<div class="userRating">
					<div class="temp">
						<div class="tempCount">
							<div class="tempInt">70.5'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage"></div>
							</div>
						</div>
						<div class="tempImg">이모티콘넣</div>
					</div>
					<span>매너온도</span>
				</div>
			</div>
			<div class="boardContent">
				<h2>RX570 4g 블로워팬 33000</h2>
				<div class="btns">
					<button class="writeBtn">
						<a href="toPbWrite.do">글쓰기</a>
					</button>
					<!-- <button>목록</button> -->
					<button class="updateBtn">수정</button>
					<button>삭제</button>
				</div>
				<span class="boardCate">디지털/가전 ∙ 5시간 전 </span> <span
					class="boardPrice">33,000원</span>
				<div class="boardContent__">
					정상사용제품이고 컴퓨터 싹바꾸면서 남아서 내놓습니다.<br /> 배그 국민옵 90~110프레임 정도 나오고 롤은
					충분히하고도 남습니다.<br /> 2호선 신림역 거래이며 오늘 6시이전에 오시면 천원 빼드립니다.<br />
					***-****-**** 전화나 문자주세요~ 택배는 안합니다.
				</div>
				<div class="boardInfo">
					채팅 5 ∙ <input type="checkbox" id="heart" /> <label for="heart"
						class="fas fa-heart"></label> 관심 4 ∙ 조회 136
				</div>
			</div>
		</div>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>이 상품과 함께 봤어요</h1>
			<li class="board">
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
			</li>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/samsungMonitor.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>삼성 모니터 판매합니다.</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">320,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/korunbike.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>코룬 하이브리드 자전거</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">130,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/bans.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>반스 올드스쿨 230</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">20,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/princess.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>왕자 2단선반 이동식행거</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">30,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Misaki.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>5단 철제 수납 팝니다</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">32,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>인기 중고</h1>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/ikea10000.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>침대협탁(이케아) 팝니다</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">17,000원</span> <span class="likes"><i
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
					<h1>구운계란</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">3,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Faker.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>이동식 선반/틈새선반</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">31,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/dretec.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>전자저울 drectec</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">10,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/sofarTable.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>쇼파 사이드 테이블</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">5,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/bokgun.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>복근 운동기구</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">1,1000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
