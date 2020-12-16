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
<style>
section:nth-of-type(1) {
	margin-top: 100px;
}
</style>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<link rel="stylesheet" href="${root}/css/boardDetail.css" />
<!-- <link rel="stylesheet" href="${root}/css/boardList.css" /> -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<body>
	<c:import url="../common/header.jsp" />

	<section class="boardList">
		<ul class="boardList__">
			<h1 style="border-bottom: 1px solid gainsboro">${memberProfile.profile_nickname} 님의 ${title}</h1>
			<h1>${title}</h1>

			<c:forEach items="${pbList}" var="pb">
				<c:url var="detail" value="PBDetail.do">
					<c:param name="board_sq" value="${pb.board_sq}"/>
				</c:url>
				<a href="${detail}">
					<li class="board">
						<div class="titleImg">
							<img src="${root}/board-imgs/${pb.board_img}" alt="" />
						</div>
						<div class="boardInfo">
							<h1>${pb.board_title}</h1>
							<span>${pb.board_address}</span>
							<div class="worth">
								<span class="price">${pb.price }원</span> <span class="likes"><i
									class="far fa-heart"></i></span>
							</div>
						</div>
					</li>
				</a>
			</c:forEach>

		</ul>
	</section>

	<c:import url="../common/footer.jsp" />
</body>
</html>
