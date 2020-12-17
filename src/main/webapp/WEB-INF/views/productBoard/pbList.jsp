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

input[type="checkbox" i]{
	display:none;
}

input[type="checkbox"] ~ .fa-heart {
  color: gray;
}

input[type="checkbox"]:checked ~ .fa-heart {
  color: red;
}

</style>

<%-- <script type="text/javascript" defer src="${root}/js/pbList.js"/> --%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
				</a>
				<input type="hidden" value="${pb.board_sq}" class="listBoardSq">
						<div class="boardInfo">
							<h1>${pb.board_title}</h1>
							<span>${pb.board_address}</span>
							<div class="worth">
								<span class="price">${pb.price }원</span> 
								
								<!-- boolean 생성 후, dipsList반복문을 통해 board_sq를 비교한다.
									 값이 같을 시에 true로 변경.Boolean을 응용해서 반복문 정지 가능,
									 하지만 변경되기 이전의 반복문은 전부 실행됨.
									 
									 <c:forEach items="${dipsList}" var="dips">
									 	--boolean을 항상 초기화 해줘야함.
									 	<c:set var="loop_flag" value="false" />
									 	<c:if test="${}">
									 		<c:set var="loop_flag" value="true" />
									 	</c:if>
										<c:if test="${true}">
									 		<c:set var="loop_flag" value="true" />
										</c:if>
									 </c:forEach>	 
								 -->
								<c:set var="loop_flag" value="false" />
								<c:forEach items="${dipsList}" var="dips">
									<c:if test="${dips.board_sq eq pb.board_sq }">
										<c:set var="loop_flag" value="true" />
									</c:if>
								</c:forEach>
								
								<span class="likes">
									<input type="checkbox" id="heart${pb.board_sq }" <c:if test="${loop_flag}">checked</c:if> />
									<label for="heart${pb.board_sq }" class="fas fa-heart dips" id="dips"></label>
								</span>
							</div>
						</div>
					</li>
				
			</c:forEach>

		</ul>
	</section>

	<c:import url="../common/footer.jsp" />
	
	<script>
	'use strict'
	const dipsBtn = document.querySelectorAll('.dips');
	const boards = document.querySelectorAll('.listBoardSq');
	/* document.querySelector('#dips').parentNode.parentNode.parentNode.parentNode.childNodes[2] */
	dipsBtn.forEach(dips=>{
		$(dips).on("click",function(){

			let board_sq = dips.parentNode.parentNode.parentNode.parentNode.childNodes[2].value;
			let profile_sq = ${memberProfile.profile_sq};

			$.ajax({
				url:"dips.do",
				data:JSON.stringify({
					board_sq:board_sq,
					profile_sq:profile_sq
				}),
				dataType:'text',
				type:"post",
				headers: {
				        'Content-Type':'application/json'
				},
				success:function(data){
				}, error:function(request,status,errorData){
					console.log(request.status+" : " + errorData);
				}
			})
			
}) 
	})
	
	
	</script>
</body>
</html>
