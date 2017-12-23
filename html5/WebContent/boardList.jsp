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
<div style="overflow: auto; height: 680px;">
		<c:set var="total" value="${total }"></c:set>
		<table width="700" class="table">
			<caption>게시판 목록</caption>
			<tr>
				<td>번호</td>
				<td width="50%">글 제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>조회</td>
				<td>추천</td>
			</tr>
			<c:if test="${noticeList != null }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td> New 
						</td>
						<td align="left" style="margin-left: 10px;"><a
							title="${notice.content }"
							href="viewBoard.do?num=${notice.num }
							&pageNum=${pageNum }&category=${notice.category}&notice='notice'">${notice.subject }</a></td>
						<td>${notice.id }</td>
						<td>${notice.reg_date }</td>
						<td>${notice.readcount }</td>
						<td>${notice.best }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:forEach var="board" items="${list }">
				<c:if test="${board.del.equals(\"n\") }">
					<tr>
						<td>${board.num }</td>
						<td align="left" style="margin-left: 10px;"><a
							title="${board.content }"
							href="viewBoard.do?num=${board.num }&pageNum=${pageNum }&category=${board.category}">${board.subject }</a>
						</td>
						<td>${board.id }</td>
						<td>${board.time }</td>
						<td>${board.readcount }</td>
						<td>${board.best }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<a href="main.do" style="float: left;">메인으로</a> 
		<span style="clear: both; text-align: center">
			<c:if test="${startPage> PAGEPERBLOCK}">
				<a href="boardList.do?pageNum=${startPage - 1 }&category=${category}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==currentPage }">
					<!-- 같은페이지면 색깔은 다르게 -->
					<a href="boardList.do?pageNum=${i }&category=${category}" style="color: pink">[${i }] </a>
				</c:if>

				<c:if test="${i!= currentPage }">
					<a href="boardList.do?pageNum=${i }&category=${category}">[${i }] </a>
				</c:if>
			</c:forEach>

			<c:if test="${endPage < totPage }">
				<a href="boardList.do?pageNum=${endPage + 1 }&category=${category}">[다음]</a>
				<!-- 지금 endPage 가10이면 다음을 누르면 11페이지를 보여준다 -->
			</c:if>

		</span>
		<a href="writeForm.do?pageNum=${pageNum }" style="float: right;">글쓰기</a> 
	</div>
		
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>

