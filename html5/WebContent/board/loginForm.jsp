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
 	<%/* 로그인 했을때 와 안했을 때 메뉴구성 변경 */
	 	 String id = (String)session.getAttribute("id");
	 		if(id == null || id.equals("")){
	%>
	<form action="login.do">
		<table><caption>로그인</caption>
			<tr><th>아이디</th><td><input type="text" name="id" placeholder="아이디" required="required" autofocus="autofocus"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="password" placeholder="비밀번호" required="required" ></td></tr>
			<tr><th colspan="2"><input type="submit" value="확인" ></th></tr>
		</table>
	</form>
	<a href="joinForm.do">회원가입</a>
	<%/* 로그인 했을 때  */
	 	  }else{
	 %>
	  이미 로그인 한 상태입니다.
	 <%
	 	  }
	  %>
</body>
</html>