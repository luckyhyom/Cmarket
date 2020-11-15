<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url value="/resources" var="root"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<nav>
		<div class="nav">
			<div class="navR">
				<div class="logo">
					<img src="${root}/img/LOGO.png" alt="cucumber logo" />
				</div>
				<div class="searchBar">
					<input type="search" class="searchText" placeholder="물품명을 검색해보세요!" />
					<i class="fas fa-search"></i>
				</div>
			</div>
			<div class="login">
				<a href="login.do" style="width: 66px">Login</a> <a href="#"
					style="width: 154px"> <i class="fab fa-apple"></i> App Store
				</a>
			</div>
		</div>
	</nav>
</body>
</html>