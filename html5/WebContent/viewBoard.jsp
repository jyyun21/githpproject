<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>마지막유머~마유~</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
</head>
<body>
	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">마지막유머</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main.jsp">메인</a></li>
					<li><a href="boardBestList.jsp">베스트게시판</a></li>
					<li><a href="boardList.jsp">유머게시판</a></li>
					<li><a href="boardFreeList.jsp">자유게시판</a></li>
					<h2 style="text-align: left;">${member==null ? '손' : member.name}님 반갑습니다.</h2>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.jsp">로그인</a></li>
							<li><a href="joinForm.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>


<!-- viewBoard시작 ------------------------------------------------------------------------------------>
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
				var url = "boardReportForm.do?num=${board.num }&category=${board.category }&id=${board.id }&notice=${notice}"
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
						<img alt="사진 없어요!" src="upload/${file.fileName }" width="550px">
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

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>




