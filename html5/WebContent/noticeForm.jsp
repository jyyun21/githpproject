<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<form action="notice.do">
		<input type="hidden" name="id" value="${id }">
		<table>
			<caption>공지 작성</caption>
			<tr>
				<td>공지 제목</td>
				<td><input type="text" required="required" name="subject"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${id }</td>
			</tr>
			<tr>
				<td>공지 카테고리</td>
				<!-- 				<td><input type="text" value="humor" name="category"></td> -->
				<td><select name="category">
						<option value="humor">유머</option>
						<option value="free">자유</option>
						<option value="best">베스트</option>
				</select></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><textarea rows="20" cols="50" name="content"></textarea></td>
			</tr>
			<!-- 공지에 사진올리는건 나중에 생각하자 -->
			<!-- <tr>
				 <td colspan="2"><input type="file" name="originFile" ></td>
				<td colspan="2"><input type="button" onclick="upload()"
					value="파일 업로드"></td>
			</tr> -->
			<tr align="center">
				<td colspan="2"><input type="submit" value="작성">
				<input type="button" value="취소" onclick="location.href='index.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>