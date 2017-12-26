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
	<table width="700">
			<caption>게시판 목록</caption>
			<tr>
				<td>번호</td>
				<td>카테</td>
				<td width="50%">글 제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>조회</td>
				<td>추천</td>
			</tr>
			<c:if test="${noticeList != null }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td colspan="2">공지</td>
						<td align="left" style="margin-left: 10px;"><a
							title="${notice.content }"
							href="viewBoard.do?num=${notice.num }
							&pageNum=${pageNum }&category=${notice.category}&best='best'">${notice.subject }</a></td>
						<td>${notice.id }</td>
						<td>${notice.time}</td>
						<td>${notice.readcount }</td>
						<td>${notice.best }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:forEach var="board" items="${boardList }">
				<c:if test="${board.del.equals(\"n\") }">
					<tr>
						<td>${board.boardBestNum }</td>
						<td>${board.category }</td>
						<td align="left" style="margin-left: 10px;"><a
							title="${board.content }"
							href="viewBoard.do?num=${board.num }&pageNum=${pageNum }
								&category=${board.category}&best='best'">${board.subject }</a>
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
				<a href="boardList.do?pageNum=${startPage - 1 }&category=${board.category}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==currentPage }">
					<!-- 같은페이지면 색깔은 다르게 -->
					<a href="boardList.do?pageNum=${i }&category=${board.category}" style="color: pink">[${i }] </a>
				</c:if>

				<c:if test="${i!= currentPage }">
					<a href="boardList.do?pageNum=${i }&category=${board.category}">[${i }] </a>
				</c:if>
			</c:forEach>

			<c:if test="${endPage < totPage }">
				<a href="boardList.do?pageNum=${endPage + 1 }&category=${board.category}">[다음]</a>
				<!-- 지금 endPage 가10이면 다음을 누르면 11페이지를 보여준다 -->
			</c:if>

		</span>
		<a href="writeForm.do?pageNum=${pageNum }" style="float: right;">글쓰기</a> 
</body>
</html>