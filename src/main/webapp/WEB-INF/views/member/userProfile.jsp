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
	<c:import url="../common/header.jsp"/>

	<section class="profileSections">
		<div class="profileSections__">
			<div class="profileTop">
				<div class="profileImg">
					<img src="${root}/profilePhotos/${p.profile_photo}" alt="" />
				</div>
				<div class="topRight">
					<div class="profileName">${p.profile_nickname}</div>
					<div class="profileTopBtn">
						<button>대화하기</button>
						<button>칭찬</button>
						<button>비매너</button>
						<!-- <button><a href="">매너평가하기</a></button> -->
					</div>
				</div>
				<!-- <ul class="judge">
            <div class="judgeGood">칭찬</div>
            <div class="judgeBad">비매너</div>
          </ul> -->
			</div>
			<div class="profileTemp">
				<div class="tempCount">매너온도 ${p.profile_temperature }C🥰</div>
				<div class="temp">
					<div class="temp__"></div>
				</div>
			</div>
			<div class="sellList">
				<button>
					<a href="sellList.do">판매상품</a>
				</button>
			</div>
			<div class="postCount">받은거래후기(2)</div>
			<div class="posts">
			${pcList}
				<c:forEach var="pc" items="${pcList}">
				<div class="post">
					<div class="postImg">
						<img src="${root}/profilePhotos/${pc.com_img}" alt="" />
					</div>
					<div class="postRight">
						<div class="postWriter">
							<a class="postWriterName">${pc.com_writer}</a>
							<div class="etc">금천구 시흥제1동 6일전</div>
							<a href="#">수정</a> <a href="#">삭제</a>
						</div>
						<div class="postContent">${pc.com_content}</div>
					</div>
				</div>
				
				</c:forEach>

		<%-- 		<div class="post">
					<div class="postImg">
						<img src="${root}/profilePhotos/${c.com_img}" alt="" />
					</div>
					<div class="postRight">
						<div class="postWriter">
							<a class="postWriterName">${c.com_writer}</a>
							<div class="etc">금천구 시흥제1동 6일전</div>
							<a href="#">수정</a> <a href="#">삭제</a>
						</div>
						<div class="postContent">${c.com_content}</div>
					</div>
				</div> --%>
				
				
			</div>
		</div>
	</section>

	<c:import url="../common/footer.jsp"/>
</body>
</html>
