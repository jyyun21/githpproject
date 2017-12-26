<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="board/sessionChk.jsp" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#chk').click(function() {
			var str = $('form').serialize();
			$('#result').text(str);
		});
	})
</script>
</head>
<body>
	<!-- jsp에서 바로 받을 때는 ${param.id}로 받기, do에서 넘어올때는 그냥 ${id}  -->
	<div class="container" style="text-align: left;">
		<h4 class="text-primary">${id }님의 신고페이지</h4>
		<form role="form" action="boardReport.do">
			<input type="hidden" name="num" value="${num }"> 
			<input type="hidden" name="id" value="${id }"> 
			<input type="hidden" name="category" value="${category }"> 
			<div class="form-group">
				<label for="Name">신고타입</label> 
				<select name = r_type>
					<option>욕설</option>
					<option>광고</option>
					<option>음란물</option>
					<option>기타</option>
				</select>
			</div>
				<label for="r_content">신고내용</label> 
			<div class="form-group">
				<textarea rows="10" cols="30" id="r_content" name="r_content" placeholder="자세한 내용을 적어주세요."></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-info" onclick="location.href='board/boardReport.do'" id="chk" >신고하기</button>
			</div>
		</form>
		<div id="result"></div>
	</div>
	
</body>
</html>