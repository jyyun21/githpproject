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




	<div class="vertical_container"
		style="width: 730px; margin: 0 auto; background-color: white;">
		<!-- 베스트 게시판 시작 ------------------------------------------------------------------------->
		<div class="main_table"
			style="width: 750px; margin: 0 auto; padding-top: 16px;">
			<div class="leftbox">

				<div class="top center">
					<a href="boardBestList.do"
						style="float: left; color: white; text-decoration: none;">베스트게시판</a><a
						href="boardBestList.do" style="float: right;"><img
						class="more" src="images/butt_more.gif" /></a>
				</div>

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
					
					<!-- <div class='list list_tr_humordata cf'>
						<div class='okcount'>53</div>
						<div class='board_icon_mini humordata' style='float: left'></div>
						<div
							style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
							<span class='subject'> <a
								href='board/view.php?table=bestofbest&no=383539' target='_top'>
									기묘한 새.jpg</a></span>
						</div>
					</div>

					<div class='list list_tr_humordata cf'>
						<div class='okcount'>53</div>
						<div class='board_icon_mini humordata' style='float: left'></div>
						<div
							style='white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>
							<span class='subject'> <a
								href='board/view.php?table=bestofbest&no=383539' target='_top'>
									기묘한 새.jpg</a></span>
						</div>
					</div> -->




				</div>
				<div class="bottom center"></div>
			</div>
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
			</div>
			<div style="clear: both; padding-top: 20px;"></div>

		</div>
	</div>

	<div style="overflow: auto; height: 680px;">
		<table width="200" class="table">
			<caption>최신글 모음</caption>
			<tr>
				<td>번호</td>
				<td width="50%">글 제목</td>
				<td>글쓴이</td>
				<td>등록일</td>
				<td>조회</td>
				<td>추천</td>
			</tr>

			<tr>
				<td>1</td>
				<td align="left" style="margin-left: 10px;">최신글 예시 입니다.</td>
				<td>id</td>
				<td>2017/12/27</td>
				<td>100</td>
				<td>2</td>
			</tr>
		</table>

	</div>


</body>
</html>


