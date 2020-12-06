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
	<c:import url="../common/header.jsp"/>

	<section class="boardList">
		<ul class="boardList__">
			<h1>인기 중고</h1>
			<div class="buttonBox" style="width: 100%; padding: 20px 30px">
				<button style="">글쓰기</button>
			</div>
			
			<c:forEach items="${pbList}" var="pb">
				<a href="pbDetail.do" style=""><li class="board">
					<div class="titleImg">
						<img src="${root}/img/${pb.board_img}" alt="" />
					</div>
					<div class="boardInfo">
						<h1>${pb.board_title}</h1>
						<span>${pb.board_address}</span>
						<div class="worth">
							<span class="price">${pb.price }원</span> <span class="likes">❤️</span>
						</div>
					</div>
			</li></a>
			</c:forEach>
			
			
		</ul>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
