<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>joinForm</title>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<%-- <link rel="stylesheet" href="${root}/css/chatApply.css" /> --%>
<link rel="stylesheet" href="${root}/css/joinForm.css" />
<%-- <script src="${root}/js/joinForm.js" defer></script> --%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
span.guide {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

span.ok {
	color: green;
}

span.error {
	color: red;
}
</style>
</head>
<body>
	<section class="loginSection">
		<form action="memberJoin.do" method="post" id="joinForm">
			<h1>JOIN</h1>
			<div class="loginForm">
				<!-- <h1>JOIN</h1> -->
				<div class="inputs">
					ID<input style="margin-bottom: 10px" type="text" id="user_id"
						name="user_id" required /> <span class="guide ok">사용가능</span> <span
						class="guide error">사용불가능</span> <input type="hidden"
						name="idDuplicateCheck" id="idDuplicateCheck" value="0">
					Password<input type="password" name="user_pwd" id="password1"
						required /> <label for="" class="repeatPwd">Password <spqn
							class="confirmPwd"></spqn>
					</label><input type="password" name="user_pwd2" id="password2" required />
					이름 <input type="text" name="user_name" id="userName" required />
					닉네임 <input type="text" id="userNickname" name="profile_nickname"
						required /> 전화번호 <input type="text" name="phone" id="phone"
						required /> Email <input type="text" name="email" id="email"
						required />
					<div class="gender" style="margin-bottom: 10px">
						<label for="man">Man</label><input type="radio"
							name="profile_gender" id="man" value="M" required /> <label
							for="woman">Woman</label><input type="radio"
							name="profile_gender" id="woman" value="F" />
					</div>
					<div class="addressForm">
						주소 <input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" style="width: 100px" class="addressBtn" />
						<div class="addressSet">
							<input type="text" id="sample4_postcode" name="sample4_postcode"
								placeholder="우편번호" required /> <br /> <input type="text"
								id="sample4_roadAddress" name="sample4_roadAddress"
								placeholder="도로명주소" required /> <input type="text"
								id="sample4_jibunAddress" name="sample4_jibunAddress"
								placeholder="지번주소" required /> <span id="guide"
								style="color: #999; display: none"></span>

							<!-- <input
                  type="text"
                  id="sample4_extraAddress"
                  placeholder="참고항목"
                /> -->
							<input type="text" id="sample4_detailAddress"
								name="sample4_detailAddress" placeholder="상세주소" required />
							<script
								src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var roadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ""; // 참고 항목 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ""
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ""
															&& data.apartment === "Y") {
														extraRoadAddr += extraRoadAddr !== "" ? ", "
																+ data.buildingName
																: data.buildingName;
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== "") {
														extraRoadAddr = " ("
																+ extraRoadAddr
																+ ")";
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById("sample4_postcode").value = data.zonecode;
													document
															.getElementById("sample4_roadAddress").value = roadAddr;
													document
															.getElementById("sample4_jibunAddress").value = data.jibunAddress;

													// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
													if (roadAddr !== "") {
														document
																.getElementById("sample4_extraAddress").value = extraRoadAddr;
													} else {
														document
																.getElementById("sample4_extraAddress").value = "";
													}

													var guideTextBox = document
															.getElementById("guide");
													// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
													if (data.autoRoadAddress) {
														var expRoadAddr = data.autoRoadAddress
																+ extraRoadAddr;
														guideTextBox.innerHTML = "(예상 도로명 주소 : "
																+ expRoadAddr
																+ ")";
														guideTextBox.style.display = "block";
													} else if (data.autoJibunAddress) {
														var expJibunAddr = data.autoJibunAddress;
														guideTextBox.innerHTML = "(예상 지번 주소 : "
																+ expJibunAddr
																+ ")";
														guideTextBox.style.display = "block";
													} else {
														guideTextBox.innerHTML = "";
														guideTextBox.style.display = "none";
													}
												},
											}).open();
								}
							</script>
						</div>
					</div>

					<button onclick="return validate();">JOIN</button>
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
		
		
		if(pwd1.value !== pwd2.value || pwd1.value =="" || pwd1.value == null ){
			alert("비밀번호를 정확하게 입력해주세요");
			return false;
		}else if($("#idDuplicateCheck").val()==0) {
   				alert("사용가능한 아이디를 입력해주세요");
   				$("#user_id").focus();
   				return false;
		}else{
			return true;
		}
		
	}
	


	$(function(){
		$("#user_id").on("keyup",function(){
			var user_id = $(this).val();
			
			if(user_id.length < 5){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				return;
			}
			
			$.ajax({
				url:"idCheck.do",
				data:{user_id:user_id},
				type:"post",
				success:function(data){
					console.log(data);
					if(data == "ok"){
						$(".error").hide();
						$(".ok").show();
						$("#idDuplicateCheck").val(1);
					}else{
						$(".ok").hide();
						$(".error").show();
						$("#idDuplicateCheck").val(0);
					}
				},
				error:function(jqxhr, textStatus,errorThrown){
					console.log("ajax 처리 실패");
					//에러 로그
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});
	});
	
	</script>
</body>
</html>
