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
					<li><a href="main.jsp">메인</a></li>
					<li><a href="bbs.jsp">베스트게시판</a></li>
					<li><a href="bbs.jsp">유머게시판</a></li>
					<li><a href="bbs.jsp">자유게시판</a></li>
					<li><a href="bbs.jsp">공지게시판</a></li>
					<h2 style="text-align: left;">${member==null ? '손' : member.name}님 반갑습니다.</h2>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.jsp">로그인</a></li>
							<li class="active"><a href="joinForm.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>

<!--  <script type="text/javascript">
function idChk(){
	if(!frm.id.value){alert("id입력후에 체크하세요");
	frm.id.focus(); return false;
	}
	var url = "idChk.do?id="+frm.id.value; 
	window.open(url, "", "width=500 height=300");
}
function chk(){
	if(frm.password.value != frm.password2.value){
		alert("암호와 암호확인이 다릅니다.");
		frm.password.focus();
		return false;
	}
	if(frm.password.value.length<2){
		alert("암호를 2글자 이상 사용하세요.");
		frm.password.focus(); 
		return false;
	}
}
</script>
<form action="join.do" name="frm" onsubmit="return chk()">
	<table><caption>회원 가입</caption>
		<tr><th>아이디</th><td><input type="text" name="id" required="required" autofocus="autofocus">
				<input type="button" value="중복확인" onclick="idChk()"></td></tr>
		<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
		<tr><th>암호확인</th><td><input type="password" name="password2" required="required"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" required="required"></td></tr>
		<tr><th>주소</th><td><input type="text" name="address" required="required"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel" required="required"
								 pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"></td></tr>
		<tr><th colspan="2"><input type="submit"  value="확인" ></th></tr>
	</table> 
</form> 원래 joinForm 
-->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="join.do">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20" required="required">
					</div>
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
					<button type="submit" class="btn btn-primary form-control">로그인</button>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>