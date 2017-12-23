<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>마지막유머~마유~</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="common.css">
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">마지막유머</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">메인</a></li>
					<li><a href="boardBestList.jsp">베스트게시판</a></li>
					<li class="active"><a href="boardList.jsp">유머게시판</a></li>
					<li><a href="boardFreeList.jsp">자유게시판</a></li>
					<h2 style="text-align: left;">${member==null ? '손' : member.name}님 반갑습니다.</h2>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.jsp">로그인</a></li>
							<li><a href="joinForm.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>

	<form action="boardUpdate.do">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="category" value="${board.category}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" required="required" name="subject"
					value="${board.subject }"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${board.category }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="50" name="content">${board.content }</textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="수정"> <input type="button" value="취소" onclick="location.href='boardList.do'"></td>
			</tr>
		</table>
	</form>
		
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
