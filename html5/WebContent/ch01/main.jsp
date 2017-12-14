<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<!-- html5로 구조만들기 -->
<style type="text/css">
	header{height: 50px; background-color: yellow;}
	nav{height: 500px; background-color: teal; width: 20% ; float: right;} /* float를 써줘야 메뉴와 본문을 붙일 수 있다. */
	article{height:500px; background-color: violet; width: 80%; float: right;}
	footer{height:100px; background-color: orange; clear: both;} /* 앞에 float를 썻으면 clear : both를 써줘야 색깔이 제대로 나온다. */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty param.pgm }"> <!-- param.pgm이 비어있으면 -->
	<c:set value="home.jsp" var="pgm"></c:set>
</c:if>
<c:if test="${not empty param.pgm }"> <!-- param.pgm이 비어있지 않으면-->
	<c:set value="${param.pgm }" var="pgm"></c:set>
</c:if>
<header><jsp:include page="top.jsp"></jsp:include>머리글</header>
<nav><jsp:include page="menu.jsp"></jsp:include>메뉴</nav>
<article><jsp:include page="${pgm }"></jsp:include>본문</article>
<footer><jsp:include page="bottom.jsp"></jsp:include>꼬릿말</footer>
</body>
</html>