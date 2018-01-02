<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>짠? 검색한 내용은 ? ${keyword } 검색조건은 ? ${keyfield }</h2>
<table>
	<tr>
		<td>번호</td>
		<td>카테</td>
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
					<td>${board.category }</td>
					<td align="left" style="margin-left: 10px;"><a
						title="${board.content }"
						href="viewBoard.do?num=${board.num }&pageNum=${pageNum }&category=${board.category}&search=search&keyword=${keyword}&keyfield=${keyfield}">${board.subject }</a>
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
				<a href="search.do?pageNum=${startPage - 1 }&category=${category}&keyword=${keyword}&keyfield=${keyfield}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==currentPage }">
					<!-- 같은페이지면 색깔은 다르게 -->
					<a href="search.do?pageNum=${i }&category=${category}&keyword=${keyword}&keyfield=${keyfield}" style="color: pink">[${i }] </a>
				</c:if>

				<c:if test="${i!= currentPage }">
					<a href="search.do?pageNum=${i }&category=${category}&keyword=${keyword}&keyfield=${keyfield}">[${i }] </a>
				</c:if>
			</c:forEach>

			<c:if test="${endPage < totPage }">
				<a href="search.do?pageNum=${endPage + 1 }&category=${category}&keyword=${keyword}&keyfield=${keyfield}">[다음]</a>
				<!-- 지금 endPage 가10이면 다음을 누르면 11페이지를 보여준다 -->
			</c:if>

		</span>
</body>
</html>