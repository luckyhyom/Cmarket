<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>updatePwd</title>
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
<script src="${root}/js/joinForm.js" defer></script>

<style>
.confirmPwd {
	font-size: 8px;
	overflow: hidden;
	position: absolute;
	margin-top: 4px;
	margin-left: 4px;
}
</style>
</head>
<body>
	<section class="loginSection">
		<form action="">
			<div class="loginForm">
				<h1>update Password</h1>
				<div class="inputs">
					Password<input type="password" name="" id="" />new Password<input
						type="password" name="" id="password1" /> <label
						for="" class="repeatPwd">new Password <spqn
							class="confirmPwd"></spqn></label><input type="password" name=""
						id="password2" />
					<button>
						<a href="home.do">Submit</a>
					</button>
					<div class="another">
						<!-- <a href="joinForm.html">회원가입</a> <a href="#">아이디찾기</a> -->
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

