
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %><!-- 스크립트사용위해  -->
	    <%@ include file="sessionChk.jsp" %>
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
				
			<!-- 로그인 된 사람만 view page볼 수 있음 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">마이페이지<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.jsp">로그아웃</a></li>
							<li><a href="view.jsp">정보수정</a></li>
							<li><a href="#">쓴 글 보기</a></li>
							<li><a href="#">쓴 댓글 보기</a></li>
							<li><a href="#">스크랩 보기</a></li>
						</ul>
					</li>
				</ul>
				
				
				
			</div>
		</div>
	</nav>
<!-- view: 회원정보 조회 페이지----------------------------------------------------->
<%-- <table><caption>회원정보</caption>
	<tr><th>아이디</th><td>${member.id }</td></tr>
	<tr><th>닉네임</th><td>${member.name }</td></tr>
	<tr><th>이메일</th><td>${member.address }</td></tr>
	<tr><th>전화</th><td>${member.tel }</td></tr>
	<tr><th>등록일</th><td>${member.reg_date }</td></tr>
</table> --%>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="join.do">
					<h3 style="text-align: center;">회원정보</h3>
					<!-- <div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" readonly="readonly">
					</div> -->
					
					<span class="form-group">아이디 자리</span>
					<span class="form-group">${member.id }</span>
					<!-- <div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20" required="required">
					</div> 아이디 확인버튼 만들기-->
	 				<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" required="required">
					</div>
					<!-- <div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인" name="password2" maxlength="20" required="required">
					</div> 비밀번호 확인 만들기-->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임" name="name" maxlength="20" required="required">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="address" maxlength="50" required="required">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="전화번호(000-0000-0000)" pattern="\d{3}-\d{3,4}-\d{4}" 
						name="tel" maxlength="20" required="required">
					</div>
					<button type="submit" class="btn btn-primary form-control">회원 가입</button>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>


<a href="main.do">메인</a>
<a href="updateForm.do">회원정보 수정</a>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>