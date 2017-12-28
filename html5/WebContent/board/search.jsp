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
짠? 검색한 내용은 ? ${keyword } 검색조건은 ? ${keyfield }
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
		<c:forEach var="board" items="${boardList }">
			<c:if test="${board.del.equals(\"n\") }">
				<tr>
					<td>${board.num }</td>
					<td>${board.category }</td>
					<td align="left" style="margin-left: 10px;"><a
						title="${board.content }"
						href='viewBoard.do?num=${board.num }&pageNum=${pageNum }
								&category=${board.category}'>${board.subject }</a>
					</td>
					<td>${board.id }</td>
					<td>${board.reg_date }</td>
					<td>${board.readcount }</td>
					<td>${board.best }</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
없나요?
</body>
</html>