<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마지막유머~마유~</title>



</head>
<body>
	<h2 style="text-align: left;">${member==null ? '손' : member.name}님 반갑습니다.</h2>
	<div class="leftbox" style="overflow: 200px; height: 300px;">
		<table width="200px" class="table">
			<caption>게시판 목록</caption>
			<tr>
				<td>번호</td>
				<td width="50%">글 제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>조회</td>
				<td>추천</td>
			</tr>
		
					<tr>
						<td>번호</td>
						<td align="left" style="margin-left: 10px;">베스트게시판입니다.</td>
						<td>id</td>
						<td>작성시간</td>
						<td>조회수</td>
						<td>추천수</td>
					</tr>
		</table>

	</div>
</body>
</html>


