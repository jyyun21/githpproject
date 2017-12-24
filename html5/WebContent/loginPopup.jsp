<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="지상파 종편 등 실시간TV 무료, 가장빠른 방송다시보기, 전체 방송VOD무제한 15일무료, 무제한영화">
	<meta name="keywords" content="푹, pooq, 푹티비, 무료 실시간TV, 방송다시보기, MBC온에어, SBS온에어, KBS온에어">
	<link rel="stylesheet" href="/css/common.css?v=2017120401"/>
	<link rel="stylesheet" href="/css/popup.css?v=2017120401"/>
	<title>pooq 로그인'</title>
	<style type="text/css">
		html{height:100%}
		fieldset.login{margin:41px auto 0;padding:23px 0 18px;width:440px;background-color:#eee}
		fieldset.login input[type='text'],
		fieldset.login input[type='password']{border:1px solid #a6a6a6;padding:0 10px;margin-bottom:16px;width:226px;height:30px;background-color:#fff;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;box-shadow:3px 3px 0 #d6d6d6, -3px -3px 0 #d6d6d6, 3px -3px 0 #d6d6d6, -3px 3px 0 #d6d6d6;font-size:12px;line-height:30px;color:#000}
		fieldset.login input[type='password']{margin-bottom:11px;}
		fieldset.login label{display:inline-block;padding:9px 5px 0 0;width:160px;font-weight:bold;color:#4f4f4f;text-align:right;vertical-align:top}
		fieldset.login label.option{margin-right:-175px;padding:4px 16px 0 0;width:auto;font-weight:normal;font-family:'돋움',dotum;font-size:11px;color:#777;text-align:left;vertical-align:middle}
		fieldset.login input[type='checkbox']{margin-left:169px}
		.btns button.btn-login{width:156px;background-color:#a962f9}
		.btns button.btn-login span{width:37px;height:12px;color:#fff}
		.btns button.btn-login span:before{content:url(/images/login/btn_login_popup.gif)}
		.popup-footer{line-height:12px}
		.login-util{padding:7px 0}
		.login-util a{overflow:hidden;position:relative;display:inline-block;padding:0 8px 0 11px;height:12px;font-weight:bold;font-size:12px;line-height:12px;color:#7a7a7a;vertical-align:top;letter-spacing:-3px}
		.login-util a:before{content:url(/images/login/txt_util.gif)}
		.login-util a:first-child{width:40px;padding:0 10px 0 0}
		.login-util a:first-child + a{width:53px}
		.login-util a:first-child + a:before{margin-left:-65px}
		.login-util a:first-child + a + a{width:62px}
		.login-util a:first-child + a + a:before{margin-left:-141px}
	</style>
	<script>
	//<![CDATA[
		document.documentElement.className = document.documentElement.className ? 'js ' + document.documentElement.className : 'js' ;
	//]]>
	</script>
</head>
<body class="popup">
	<div class="popup-header">
		<h1>
			<img src="//www.pooq.co.kr/images/login/txt_login_popup_ttl.gif" alt="로그인" />
		</h1>
	</div>
	<div class="popup-main">
		<form name="loginPopupFrm" id="loginPopupFrm">
			<fieldset class="login">
				<legend class="a11y-hidden">로그인 및 관련 설정</legend>
				<label for="userId">로그인ID 또는 이메일ID</label>
				<input type="text" name="userId" id="userId" placeholder="로그인ID 또는 이메일ID" required />
				<label for="userPassword">비밀번호</label>
				<input type="password" name="userPassword" id="userPassword" placeholder="비밀번호" required />
				<input type="checkbox" name="saveId" id="saveId" />
				<label for="saveId" class="option">아이디저장</label>
				<input type="checkbox" name="autoLogin" id="autoLogin" />
				<label for="autoLogin" class="option">자동 로그인</label>
			</fieldset>
			<div class="btns">
				<button type="submit" class="btn-login"><span>로그인</span></button>
			</div>
		</form>
	</div>
	<div class="popup-footer">
		<div class="login-util">
			<a href="https://join.pooq.co.kr/join/join.aspx" target="pooq">회원가입</a>
			<a href="https://join.pooq.co.kr/join/join_id_srch.aspx" target="pooq">아이디찾기</a>
			<a href="https://join.pooq.co.kr/join/join_pwd_reset.aspx" target="pooq">비밀번호변경</a>
		</div>
	</div>
	<script src="/js/min/jquery-1.11.2.min.js?v=2017120401"></script>
	<script src="/js/min/core.js?v=2017120401"></script>
	<script src="/js/min/misc.js?v=2017120401"></script>
	<script src="/js/min/common.model.js?v=2017120401"></script>
	<script>
		if( cookies.hasItem('usrID') ){
			document.getElementById('userId').value = cookies.getItem('usrID');
			document.getElementById('saveId').checked = true;
		}
		$('#autoLogin').on('change', function(){
			if(this.checked){
				toggleCheckState('saveId', false);
				toggleAbleState('saveId', false);
			}else{
				toggleAbleState('saveId', true);
			}
		});
		$('#loginPopupFrm').on('submit', loginProc);
		$('.login-util a').on('click', function(event){
			event = event || window.event;
			event.preventDefault ? event.preventDefault() : event.returnValue = false;
			opener.location.assign(this.getAttribute('href'));
			window.close();
		});
	</script>
</body>
</html>

