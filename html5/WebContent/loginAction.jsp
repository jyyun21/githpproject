<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="users.*"%>
  
    <%@ page import ="java.io.PrintWriter" %><!-- 자바스크립트 문장을 사용하기 위함  -->
    <% request.setCharacterEncoding("UTF-8"); %><!-- 건너오는 모든 값을 utf-8로 받기 위함 -->
    <jsp:useBean id="user" class = "users.User" scope="page"/><!-- scope=page : 현재페이지안에서만 빈즈사용될 수 있도록 -->
    <jsp:setProperty name="user" property="userID"/><!-- login.jsp페이지에서 넘겨준 userID를 받아서 userID사용  -->
    <jsp:setProperty name="user" property="userPassword"/><!-- 넘어온 아이디와 패스워드 사용  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();/*userDAO라는 하나의 인스턴스만듬  */
		int result = userDAO.login(user.getUserID(),user.getUserPassword() );/* 로그인시도  -2~1값 들어옴.*/
		if(result ==1){
			PrintWriter script = response.getWriter();/* 스크립트 문장 넣어주기 */
			script.println("<script>");
			script.println("location.href= 'main.jsp'");/* 로그인성공시 이페이지로 */
			script.println("</script>");
		}else if(result ==0){
			PrintWriter script = response.getWriter();/* 스크립트 문장 넣어주기 */
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");/* 로그인실패 */
			script.println("history.back()");/* 이전페이지로 */
			script.println("</script>");
		}else if(result ==-1){
			PrintWriter script = response.getWriter();/* 스크립트 문장 넣어주기 */
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");/* 로그인실패 */
			script.println("history.back()");/* 이전페이지로 */
			script.println("</script>");
		}else if(result ==-2){
			PrintWriter script = response.getWriter();/* 스크립트 문장 넣어주기 */
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");/* 로그인실패 */
			script.println("history.back()");/* 이전페이지로 */
			script.println("</script>");
		}
	%>
</body>
</html>