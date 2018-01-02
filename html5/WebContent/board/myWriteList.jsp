<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="sessionChk.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="common.css">
<title>Insert title here</title>
</head>
<body>
<div style="overflow: auto; height: 680px;">
		<c:set var="total" value="${total }"></c:set>
		<table width="700">
			<caption>게시판 목록</caption>
			<tr>
				<td>번호</td>
				<td width="50%">글 제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>조회</td>
				<td>추천</td>
			</tr>
			<c:forEach var="board" items="${list }">
				<c:if test="${board.del.equals(\"n\") }">
					<tr>
						<td>${board.num }</td>
						<td align="left" style="margin-left: 10px;"><a
							title="${board.content }"
							href="viewBoard.do?num=${board.num }&pageNum=${pageNum }">${board.subject }</a>
						</td>
						<td>${board.id }</td>
						<td>${board.time }</td>
						<td>${board.readcount }</td>
						<td>${board.best }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		 
		<span style="clear: both; text-align: center">
			<c:if test="${startPage> PAGEPERBLOCK}">
				<a href="myWriteList.do?pageNum=${startPage - 1 }">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==currentPage }">
					<!-- 같은페이지면 색깔은 다르게 -->
					<a href="myWriteList.do?pageNum=${i }" style="color: pink">[${i }] </a>
				</c:if>

				<c:if test="${i!= currentPage }">
					<a href="myWriteList.do?pageNum=${i }">[${i }] </a>
				</c:if>
			</c:forEach>

			<c:if test="${endPage < totPage }">
				<a href="myWriteList.do?pageNum=${endPage + 1 }">[다음]</a>
				<!-- 지금 endPage 가10이면 다음을 누르면 11페이지를 보여준다 -->
			</c:if>

		</span>
		 
	</div>

</body>
</html>