<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>마지막유머~마유~</title>

</head>
<body>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
		integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
		crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="default.css" />
	<link rel="stylesheet" type="text/css" href="common.css" />
	<link rel="stylesheet" type="text/css"
		href="jquery.toastmessage.css?t5" />




	<div class="vertical_container"	style="width: 730px; margin: 0 auto; background-color: white;">
		<!-- 베스트 게시판 시작 ------------------------------------------------------------------------->
		<div class="main_table"	style="width: 750px; margin: 0 auto; padding-top: 16px;">
			<div class="leftbox">

				<div class="top center">
					<a href="boardBestList.do"
						style="float: left; color: white; text-decoration: none;">베스트게시판</a><a
						href="boardBestList.do" style="float: right;"><img
						class="more" src="images/butt_more.gif" /></a>
				</div><!-- topcenter끝 -->

				<div class="middle center">
					<c:forEach var="board" items="${boardList }">
					<div class='list list_tr_humordata cf'>
						<div class='okcount'>${board.best }</div>
						<div class='board_icon_mini humordata' style='float: left'></div>
						<div
							style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
							<span class='subject'> <a
								href='viewBoard.do?num=${board.num }&pageNum=1&category=${board.category}&best=best' target='_top'>
									${board.subject }</a></span>
						</div>
					</div>
					</c:forEach>
				</div><!--middle center 끝  -->
				
				<div class="bottom center"></div>
				
			</div> <!-- leftbox끝 -->
			<!--유머게시판 시작 -------------------------------------------->
			<div class="rightbox">
				<div class="top center">
					<a href="boardList.do?category=humor"
						style="float: left; color: white; text-decoration: none;">유머게시판</a><a
						href="boardList.do?category=humor" style="float: right;"><img
						class="more" src="images/butt_more.gif" /></a>
				</div>
				<div class="middle center">
					<c:forEach var="board" items="${list}">
					<div class='list list_tr_humordata cf'>
						<div class='okcount'>${board.best }</div>
						<div class='board_icon_mini humordata' style='float: left'></div>
						<div
							style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
							<span class='subject'> <a
								href="viewBoard.do?num=${board.num }&pageNum=1&category=${board.category}" target='_top'>
									${board.subject }</a></span>
						</div>
					</div>
					</c:forEach>
					<div class="bottom center"></div>
				</div>
			</div><!--right box끝  -->
			<div style="clear: both; padding-top: 20px;"></div>

		</div>
	</div>
<!-- 부트스트랩 캐러솔  -->
<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>	
	</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>


