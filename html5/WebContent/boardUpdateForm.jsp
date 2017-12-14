<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardUpdate.do">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
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
</body>
</html>