<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>loginForm</title>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<!-- <link rel="stylesheet" href="{root}/css/chatApply.css" /> -->
<link rel="stylesheet" href="${root}/css/loginForm.css" />
</head>
<body>
	<section class="loginSection">
	<!-- 로그인 실패 시 출력할 메세지 -->
		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		${requestScope.loginFailMsg}
		<form action="login.do" method="post">
			<div class="loginForm">
				<div class="inputs">
					ID<input style="margin-bottom: 10px" type="text" id="user_id"
						name="user_id" />Password<input type="password" name="user_pwd"
						id="user_pwd" />
					<!-- <input type='submit'> -->
					<button>login</button>
					<div class="another">
						<a href="joinForm.do">회원가입</a> <a href="findId.do">아이디찾기</a>
					</div>
				</div>

				<div class="login">
					<a href="#" style="width: 154px">Google Login</a> <a href="#"
						style="width: 154px"> <i class="fab fa-apple"></i> App Store
					</a>
				</div>
			</div>
		</form>
	</section>
</body>
</html>
