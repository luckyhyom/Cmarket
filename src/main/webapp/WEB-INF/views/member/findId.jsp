<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>findId</title>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<!-- <link rel="stylesheet" href="${root}/css/chatApply.css" /> -->
<link rel="stylesheet" href="${root}/css/loginForm.css" />
</head>
<body>
	<section class="loginSection">
		<form action="home.do">
			<div class="loginForm">
				<h2>아이디 찾기</h2>
				<div class="inputs">
					휴대폰번호<input style="margin-bottom: 10px" type="text" />Email<input
						type="password" name="" id="" />
					<button>
						<a href="home.do">Submit</a>
					</button>
					<div class="another">
						<a href="findPwd.do">비밀번호 찾기</a>
					</div>
				</div>

				<!-- <div class="login">
            <a href="#" style="width: 154px">Google Login</a>
            <a href="#" style="width: 154px">
              <i class="fab fa-apple"></i> App Store
            </a>
          </div> -->
			</div>
		</form>
	</section>
</body>
</html>

