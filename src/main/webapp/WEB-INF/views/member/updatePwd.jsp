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
		<form action="updatePwd.do" method="post">
			<div class="loginForm">
				<h1>update Password</h1>
				<input type="hidden" name="user_id" id="user_id"
						value="${loginUser.user_id }">
				<div class="inputs">
					Password<input type="password" name="user_pwd" id="user_pwd" />new
					Password<input type="password" name="user_pwd_up" id="password1" />
					<label for="" class="repeatPwd">new Password <spqn
							class="confirmPwd"></spqn></label><input type="password" name=""
						id="password2" />
					<button onclick='return validate();'>submit</button>
					<div class="another"></div>
				</div>

			</div>
		</form>
	</section>
	
	<script type="text/javascript">
	const pwd1 = document.querySelector("input[id=password1]");
	const pwd2 = document.querySelector("input[id=password2]");
	const confirmPwd = document.querySelector(".confirmPwd");
	pwd2.addEventListener("keyup", (e) => {
	  if (pwd1.value === "" || pwd2.value === "") {
	    confirmPwd.style.color = "black";
	    confirmPwd.textContent = `비밀번호를 입력해주세요`;
	    return;
	  } else if (pwd1.value === pwd2.value) {
	    confirmPwd.style.color = "green";
	    confirmPwd.textContent = `비밀번호 일치`;
	  } else if (pwd1.value !== pwd2.value) {
	    confirmPwd.style.color = "red";
	    confirmPwd.textContent = `비밀번호 불일치`;
	  }
	});
	
	function validate(){
		
		if(pwd1.value !== pwd2.value){
			alert("비밀번호를 정확하게 입력해주세요");
			return false;
		}else{
			return true;
		}
		
	}
	</script>
</body>
</html>

