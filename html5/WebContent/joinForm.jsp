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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function registerChk() {
		var id = $('#id').val();
			$.ajax({type:'post',
				url: 'idChk.jsp',
				dataType:'text',
				data:{data:id},
				success: function(data) {
				alert(data);
				}
			})
			$.ajax({data:id})
	}
	function passwordCheckFunction() {
		var password=$('#password').val();
		var password2=$('#password2').val();
		if(password != password2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}


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
		<tr><th>아이디</th><td align="left"><input type="text" name="id" maxlength="20" 
						required="required" autofocus="autofocus" placeholder="아이디를 입력해주세요">
						<input type="button" value="중복확인" onclick="registerChk()"></td></tr><!-- idchk대신 registerChk시도  -->
		<tr><th>비밀번호</th><td align="left"><input type="password" onkeyup="passwordCheckFunction();" name="password" maxlength="20"
						 required="required" placeholder="비밀번호를 입력해주세요"></td></tr>
		<tr><th>비밀번호 확인</th><td align="left"><input type="password" onkeyup="passwordCheckFunction();" name="password2" maxlength="20"
						 required="required" placeholder="비밀번호 확인을 입력해주세요"></td></tr>
						 <tr><td><h5 style="color: red;" id="passwordCheckMessage"></h5></td></tr>
		<tr><th>이름</th><td align="left"><input type="text" name="name" maxlength="20"
						 required="required" placeholder="이름을 입력해주세요"></td></tr>
		<tr><th>주소</th><td align="left"><input type="text" name="address" maxlength="20"
						 required="required" placeholder="주소를 입력해주세요"></td></tr>
		<tr><th>전화번호</th><td align="left"><input type="text" name="tel" maxlength="20" required="required"
								 pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"></td></tr>
		<tr>
			<td colspan="2"><input type="submit"  value="회원가입" ></td></tr>
	</table>
</form>
</body>
</html>