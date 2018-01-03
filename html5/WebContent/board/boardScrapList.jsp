<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
	<h2>스크랩 목록</h2>
	<table>
		<tr>
			<td>카테</td>
			<td width="50%">글 제목</td>
			<td>글쓴이</td>
			<td>등록일</td>
		</tr>
		<c:if test="${boardList.size()==0 }">
			<tr>
				<td colspan="4">스크랩 내용이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${boardList.size()>0 }">
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td>${board.category }</td>
					<td><a href="viewBoard.do?num=${board.num }&pageNum=${pageNum }&category=${board.category}&scrap=scrap">${board.subject }</a> </td>
					<td>${board.id }</td>
					<td>${board.time }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<span style="clear: both; text-align: center">
		 <c:if	test="${startPage> PAGEPERBLOCK}">
			<a href="boardScrapList.do?pageNum=${startPage - 1 }&category=${category}">[이전]</a>
		</c:if> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i==currentPage }">
				<!-- 같은페이지면 색깔은 다르게 -->
				<a href="boardScrapList.do?pageNum=${i }&category=${category}"
					style="color: pink">[${i }] </a>
			</c:if>
			<c:if test="${i!= currentPage }">
				<a href="boardScrapList.do?pageNum=${i }&category=${category}">[${i }]
				</a>
			</c:if>
		</c:forEach> 
		<c:if test="${endPage < totPage }">
			<a href="boardScrapList.do?pageNum=${endPage + 1 }&category=${category}">[다음]</a>
			<!-- 지금 endPage 가10이면 다음을 누르면 11페이지를 보여준다 -->
		</c:if>

	</span>
</body>
</html>