<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>userProfile</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="${root}/css/userProfile.css" />
<body>
	<c:import url="../common/header.jsp" />

	<section class="profileSections">
		<div class="profileSections__">
			<div class="profileTop">
				<div class="profileImg">
					<img src="${root}/profilePhotos/${p.profile_photo}" alt="" />
				</div>
				<div class="topRight">
					<div class="profileName">${p.profile_nickname}</div>
					<c:if test="${p.user_sq ne sessionScope.loginUser.user_sq}">
						<div class="profileTopBtn">
						<button>대화하기</button>
						<c:if test="${checkOverlap eq 'no' }">
							<button class="upTemp">평가하기</button>
							<div class="upTempWindow">
								평가하기!
								<form action="writeComment.do">
									<!-- 코맨트 등록 유저 정보는 컨트롤러 세션에서 구하기 -->
									<input type="hidden" name="profile_sq" value="${p.profile_sq}">
									<input type="text" name="com_content" id="com_content">
									<label for="upTemp">칭찬</label> <input type="radio"
										name="tempPoint" id="upTemp" value="1" /> <label
										for="downTemp">불만</label> <input type="radio"
										name="tempPoint" id="downTemp" value="-1" /><br />
									<button type="submit">평가하기</button>
								</form>
							</div>
						</c:if>
						<c:if test="${checkOverlap eq 'yes' }">
							<button class="upTemp" disabled="false">평가하기</button>
						</c:if>
					</div>
					</c:if>
				</div>
			</div>
			<div class="profileTemp">
				<div class="tempCount">매너온도 ${p.profile_temperature}C🥰</div>
				<div class="temp">
					<div class="temp__"
						style="width:${p.profile_temperature}%"></div>
				</div>
			</div>
			<div class="sellList">
				<button>
					<a href="sellList.do">판매상품</a>
				</button>
			</div>
			<div class="postCount">받은거래후기(2)</div>
			<div class="posts">
				<c:forEach var="pc" items="${pcList}">
					<c:url var="goProfile" value="viewProfile.do">
						<c:param name="profile_sq" value="${pc.com_writer_sq}" />
					</c:url>
					<c:url var="deleteComment" value="deleteComment.do">
						<c:param name="comment_sq" value="${pc.comment_sq}" />
						<c:param name="profile_sq" value="${pc.profile_sq}" />
					</c:url>
					<div class="post">
						<div class="postImg">
							<img src="${root}/profilePhotos/${pc.com_img}" alt="" />
						</div>
						<div class="postRight">
							<div class="postWriter">
								<a class="postWriterName" href="${goProfile}">${pc.com_writer}</a>
								<div class="etc">6일전</div>
								<c:if test="${pc.com_writer eq sessionScope.memberProfile.profile_nickname}">
									<a href="${deleteComment}">삭제</a>
								</c:if>
							</div>
							<div class="postContent">${pc.com_content}</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<script>
      const upTempBtn = document.querySelector('.upTemp');
      const upTempWindow = document.querySelector('.upTempWindow');
      upTempBtn.addEventListener('click',()=>{
        upTempWindow.classList.toggle('show');
      })
    </script>
	<c:import url="../common/footer.jsp" />
</body>
</html>
