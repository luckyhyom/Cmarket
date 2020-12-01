<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url value="/resources" var="root" />
<footer>
		<div class="fTop">
			<div class="logo">
				<img src="${root}/img/LOGO.png" alt="" />
			</div>
			<div class="fDiv1">
				<a href="#">믿을 수 있는 거래</a> <a href="#">자주 묻는 질문</a>
			</div>
			<div class="fDiv2">
				<a href="#">회사 소개</a> <a href="#">광고주 센터</a> <a href="#">동네가게</a>
			</div>
			<div class="fDiv3">
				<a href="#">이용약관</a> <a href="#">개인정보취급방침</a> <a href="#">결제기반서비스
					이용약관</a>
			</div>
		</div>
		<div class="fBot">
			<div class="botL">
				<ul>
					<li>고객문의 <a href="mailto:gyals0386@gamil.com">gyals0386@gmail.com</a>
					</li>
					<li><a>사업자 등록번호 : 777-77-00077</a> <a>구로구 디지털로 30길 28 609호</a>
					</li>
					<li>©Cucumber Market Inc.</li>
				</ul>
			</div>
			<div class="botR">
				<i class="fab fa-facebook-square"></i> <i
					class="fab fa-instagram-square"></i> <i class="fab fa-github"></i>
			</div>
		</div>
	</footer>
</body>
</html>