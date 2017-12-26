<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	//$(function() {
	//$('#list').load('boardList.do?pageNum=${pageNum }&category=${board.category}');
	//	$('#list').load('hallo.jsp');
//	});
</script>
<script type="text/javascript">
		function del() {
			var check = confirm("삭제하시겠습니까?");
			if (check) {
				location.href = "boardDelete.do?num=${board.num }&category=${board.category }";
			}
		}
		
		$(function() {
			$('#report').click(function() {
				var url = "../boardReportForm.do?num=${board.num }&category=${board.category }&id=${board.id }&notice=${notice}"
				
				window.open(url,"","width =450 height=420"); //새로운창(idChk.jsp)을 띄움 
			});
		});
</script>
	
	<table style="width: 600; height: 300">
		<tr height="10%">
			<td>제목</td>
			<td>글쓴이</td>
			<td>조회</td>
			<td>추천</td>
		</tr>
		<tr height="10%">
			<td width="50%">${board.subject }</td>
			<td>${board.id }</td>
			<td>${board.readcount }</td>
			<td>${board.best}</td>
		</tr>
		<tr align="center" valign="top">
			<td colspan="5">
				<c:if test="${fileList != null }">
					<c:forEach var="file" items="${fileList }">
						<img alt="사진 없어요!" src="../upload/${file.fileName }" width="550px">
						<%-- <video src="upload/${file.fileName }" controls="controls"></video> --%>
					</c:forEach> 
				</c:if>
				<pre>${board.content }</pre>
				<span >
					<button onclick="location.href='clickbest.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }'">추천
						<img alt="" src="thumb.PNG" width="20px">
						</button>
						&nbsp; &nbsp;
					<button id="report">신고
<%-- 					<button onclick="location.href='boardReportForm.do?num=${board.num }
							&category=${board.category }&id=${board.id }'">신고 --%>
						<img alt="" src="singo.PNG" width="20px">
					</button>
				</span>
				</td>
		</tr>
	</table>
	<!-- notice는 category가 notice니까 head를 통해 list를 판별하자 그래서 head를 보내줌 -->
	<c:if test="${best ==null }">
	<a href="boardList.do?pageNum=${pageNum }&category=${board.category}&head=${board.head}" style="float: left;">목록</a>
	</c:if>
	<c:if test="${best!= null }">
	<a href="boardBestList.do?pageNum=${pageNum }&category=${board.category}&head=${board.head}" style="float: left;">목록</a>
	</c:if>
	
	<c:if test="${id != null }">
		<c:if test="${id.equals(board.id) }">
			<c:if test="${board.best>=10 }">
				<span style="float : right;">베스트 게시판에 있는 글은 수정 및 삭제가 불가능합니다.</span>
			</c:if>
			<c:if test="${board.best<10 }">
				<a style="float: right;" onclick="del()">삭제</a>
				<a href="boardUpdateForm.do?num=${board.num }&pageNum=${pageNum }&category=${board.category }" style="float: right;">수정
					&nbsp;&nbsp;</a>
			</c:if>
		</c:if>
	</c:if>
	<div id="list">
	</div>
</body>
</html>