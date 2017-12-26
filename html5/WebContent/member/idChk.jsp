<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id = request.getParameter("id");%> 
<script type="text/javascript">
	function idChk(){
		if(!frm.id.value){alert("id입력후에 체크하세요");
		frm.id.focus(); return false;
		}
		var url = "idChk.do?id="+frm.id.value; 
		window.open(url, "", "width=500 height=300");
	}
	function winCl(){
		opener.frm.id.value ="<%=id%>";
		window.close();
	}
</script>
<c:if test="${ result == 1}">
	<script type="text/javascript">
		alert("아이디를 사용할 수 없습니다.. 다른 아이디를 사용하세요");
	</script>
	<form >
		<fieldset><legend>아이디 입력</legend>
			<input type="text" name="id" required="required" autofocus="autofocus"  ><p>
			<input type="submit" value="확인" onclick="idChk()"><p>
		</fieldset>
	</form>
</c:if>
	
<c:if test="${result==0}">
	<h2>사용 가능한 아이디 입니다.</h2><!-- 새로운창에서 다시입력한 값.  -->
	<button onclick="winCl()">창닫기</button>
</c:if>
</body>
</html>