<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<form action="delete.do" name="frm" >
	<input type="hidden" name="id" value="${member.id }">
	<table><caption>회원 탈퇴 확인</caption>
		<tr><th>아이디</th><td>${member.id }</td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="password" required="required" ></td></tr>
		
		
		<tr><th colspan="2"><input type="submit"  value="확인" ></th></tr>
	</table>
<a href="main.do">메인</a>


</form>
</body>
</html>