<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="sessionChk.jsp" %>  <!-- @include는 소스를 가져오는것 -->
<%-- <jsp:include page="sessionChk.jsp" flush="false"></jsp:include> jsp:include는 제어권을 그페이지에 넘겨줬다가 다시 가져옴  --%>

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
	
<!-- writeForm시작-------------------------------------------------------------------------------->
<script type="text/javascript">
function upload(){
	var url = "fileUploadForm.do?category="+frm.category.value;
	window.open(url,"","width =450 height=300"); //새로운창(idChk.jsp)을 띄움 
}
</script>
	<form action="write.do" name="frm" method="post">
	<input type="hidden" name="id" value="${member.id }">
		<table>
			<caption>글 작성</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" required="required" name="subject"></td>
			</tr>
			<tr>
				<td>글쓴이아이디</td>
				<td>${member.id }</td>
			</tr>
			<tr>
				<td>카테고리</td>
<!-- 				<td><input type="text" value="humor" name="category"></td> -->
				<td><select name="category">
					<option value="humor">유머</option>
					<option value="free">자유</option>
					<option value="game">게임</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="50" name="content"></textarea></td>
			</tr>
			 <tr>
				<!--  <td colspan="2"><input type="file" name="originFile" ></td> -->
			 	<td colspan="2"><input type="button" onclick="upload()" value="파일 업로드"></td> 
			 </tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="작성"></td>
			</tr>
		</table>
	</form>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>

