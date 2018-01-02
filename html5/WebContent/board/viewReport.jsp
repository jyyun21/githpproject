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
<h2> 신고보기 </h2>
<table>
		<tr>
			<td>카테</td>
			<td>글번호</td>
			<td>신고 타입</td>
			<td width="30%">신고 내용</td>
			<td>신고자</td>
			<td>블럭</td>
		</tr>
		<c:if test="${list.size()==0 }">
			<tr>
				<td colspan="5">신고 내용이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${list.size()>0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${board.category }</td>
					<td>${board.num }</td>
					<td>${board.r_type }</td>
					<td>${board.r_content } </td>
					<td>${board.id }</td>
					<c:if test="${board.block.equals(\"y\") }">
						<td><a href="boardBlock.do?category=${board.category }&num=${board.num}&unblock=unblock" style="color: blue">해제</a></td>
					</c:if>
					<c:if test="${board.block.equals(\"n\") }">
						<td><a href="boardBlock.do?category=${board.category }&num=${board.num}" style="color: red">블럭</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>