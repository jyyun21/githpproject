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
<c:if test="${result >0 }">
	<script type="text/javascript">
		alert("신고 성공하였습니다.");
		window.close();
	</script>
</c:if>
<c:if test="${result ==0 }">
	<script type="text/javascript">
		alert("신고 실패!");
		history.go(-1);
	</script>
</c:if>
<!-- viewBoard에서 ../boardReportForm.do를 통해 webcontent밑에서 부른다.
viewBoard -> ../boardReportForm.do ->board/boardReportForm.jsp -> board/boardReport.do -> boardReport.jsp(webcontent밑에있다.)



  -->
</body>
</html>