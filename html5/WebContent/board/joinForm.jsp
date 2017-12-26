<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<script type="text/javascript">
function idChk(){
	if(!frm.id.value){alert("id입력후에 체크하세요");
	frm.id.focus(); return false;
	}
	var url = "../member/idChk.do?id="+frm.id.value; 
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
<form action="join.do" name="frm" onsubmit="return chk()" >
	<table><caption>회원 가입</caption>
		<tr><th>아이디</th><td><input type="text" name="id" required="required" autofocus="autofocus" placeholder="아이디">
				<input type="button" value="중복확인" onclick="idChk()" ></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="password" required="required" placeholder="비밀번호 "></td></tr>
		<tr><th>암호확인</th><td><input type="password" name="password2" required="required" placeholder="비밀번호 확인"></td></tr>
		<tr><th>닉네임</th><td><input type="text" name="name" required="required" placeholder="닉네임"></td></tr>
		<tr><th>이메일</th><td><input type="email" name="address" required="required" placeholder="이메일 xx@xx.xx"></td></tr>
		<tr><th>전화번호</th><td><input type="text" name="tel" required="required"
								 pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"></td></tr>
		<tr><th colspan="2"><input type="submit"  value="확인" ></th></tr>
	</table>
</form>
</body>
</html>