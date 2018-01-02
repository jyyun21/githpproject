<%@page import="ch10.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	String id = "a";
	String name = "길동";
	String address ="강남";
	String tel ="010-1111-%04d";
	MemberDao md = MemberDao.getInstance();
	Member member = new Member();
	for(int i=1; i<230; i++){
		member.setId(id+i);
		member.setPassword("1");
		member.setName(name+i);
		member.setAddress(address+" "+i+"번지");
		member.setTel(String.format(tel,i));
		md.insert(member);
	}
	
%>
입력완료
</body>
</html>