<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@page import="humorProject.dao.*"%>
	<%@page import="humorProject.model.*"%>
    <%@include file = "sessionChk.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	
	if(!id.equals("master")){
%>
<script type="text/javascript">
	alert("회원목록을 볼 권한이 없습니다.");
	location.href = "main.jsp";
</script>
<%  }%>
<%
	final int ROWPERPAGE=10;
	final int PAGEPERBLOCK =10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null||pageNum.equals(""))pageNum = "1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*ROWPERPAGE+1;
	int endRow = startRow + ROWPERPAGE-1;
	MemberDao md = MemberDao.getInstance(); 
	int total = md.total();
	int totPage = (int)Math.ceil((double)total/ROWPERPAGE);
	int startPage = currentPage -(currentPage-1)%PAGEPERBLOCK;
	int endPage = startPage +PAGEPERBLOCK -1;
	if(endPage>totPage)endPage = totPage;
	List<Member> list = md.list(startRow, endRow);
%>

<table><caption>회원목록</caption>
	<tr><th>아이디</th><th>이름</th><th>주소</th><th>전화</th><th>탈퇴여부</th></tr>
	
<%	for(Member member : list) {  %>
	<tr><td><%=member.getId()%></td><td><%=member.getName()%></td>
		<td><%=member.getAddress()%></td><td><%=member.getTel()%></td>
		<td><%=member.getDel()%></td></tr>
<%  } %>

</table>
<div align="center">
<% if(startPage>PAGEPERBLOCK){//11페이지로 넘어갔을때 %>
	<a href="memberList.jsp?pageNum=<%=startPage-1%>"> [이전]</a>
<%} %>
<%for(int i=startPage;i<=endPage;i++){
	if(i==currentPage){%>
	<a href="memberList.jsp?pageNum=<%=i%>" style="color: pink" > [<%=i %>]</a>
	<%}else{ %>
	<a href="memberList.jsp?pageNum=<%=i%>"> [<%=i %>]</a>
	<%} %>
<%} %>
<% if(endPage<totPage){//아직 볼게 남아있다 %>
	<a href="memberList.jsp?pageNum=<%=endPage+1%>"> [다음]</a>
<%} %>
</div>
</div>
</body>
</html>