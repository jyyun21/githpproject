<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript" src="../js/jquery.js"></script>
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
			//신고하기
			$('#report').click(function() {
				var url = "../boardReportForm.do?num=${board.num }&category=${board.category }&id=${board.id }&notice=${notice}"
				window.open(url,"","width =450 height=420"); //새로운창(idChk.jsp)을 띄움 
			});
			/*
			$('#best').click(function() {
				var sendData = "num="+${board.num}+"&pageNum="+${pageNum }+"&category="+${board.category};
				//var sendData = $('form').serialize();
				$.post('clickbest.do',sendData, function(data) {
					$('#disp').html(data);
				});
			});*/
			//best게시판에서 추천을눌렀을때
			$('#bestClick').click(function() {
				location.href='clickbest.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }&best=best'; 
				/*파라미터를 넘겨줄때 ""를 안붙이고 그냥 값을 써서 넘긴다. best="best"가 아니라 best=best이렇게쓴다.  */
			});
			//유게랑 자게에서 들어와서 추천을 눌렀을때
			$('#normalClick').click(function() {
				location.href='clickbest.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }'; 
			});
			//스크랩에서 추천
			$('#scrapClick').click(function() {
				location.href='clickbest.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }&scrap=scrap'; 
			});
			//스크랩하기
			$('#scrap').click(function() {
				//location.href='boardScrap.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }';
				var check = confirm("스크랩하시겠습니까?");
				if(check){
					//스크랩할때 폴더를 분류해서 넣을건가? -> 우선 그냥 스크랩한것만 넣자
					var url = '../boardScrap.do?num=${board.num}&pageNum=${pageNum }&category=${board.category }';
					window.open(url,"","width =450 height=300"); //새로운창을 띄움 
				}
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
						<img alt="사진 없어요!" src="../upload/${file.fileName }" width="550px">
						<%-- <video src="upload/${file.fileName }" controls="controls"></video> --%>
					</c:forEach> 
				</c:if>
				<pre width="600" id="pre" style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">${board.content }</pre>
				<span >
					<c:if test="${best ==null &&scrap ==null}">
						<button id="normalClick" >추천
						<img alt="" src="thumb.PNG" width="20px">
						</button>
					</c:if>
					<c:if test="${best!=null }">
						<button id="bestClick" >추천
						<img alt="" src="thumb.PNG" width="20px">
						</button>
					</c:if>
					<c:if test="${scrap!=null }">
						<button id="scrapClick" >추천
						<img alt="" src="thumb.PNG" width="20px">
						</button>
					</c:if>
						&nbsp; &nbsp;
					<button id="report">신고
<%-- 					<button onclick="location.href='boardReportForm.do?num=${board.num }
							&category=${board.category }&id=${board.id }'">신고 --%>
						<img alt="" src="singo.PNG" width="20px">
					</button>
				</span>
				<button id="scrap" style="float: right" ><img alt="" src="scrap.PNG">스크랩</button>
			</td>
		</tr>
	</table>
	<!-- notice는 category가 notice니까 head를 통해 list를 판별하자 그래서 head를 보내줌 -->
	<c:if test="${best!= null }">
	<a href="boardBestList.do?pageNum=${pageNum }&category=${board.category}&head=${board.head}" style="float: left;">목록</a>
	</c:if>
	<c:if test="${scrap != null}">
	<a href="boardScrapList.do?pageNum=${pageNum }&category=${board.category}&head=${board.head}" style="float: left;">목록</a>
	</c:if>
	<c:if test="${best ==null && scrap ==null }">
	<a href="boardList.do?pageNum=${pageNum }&category=${board.category}&head=${board.head}" style="float: left;">목록</a>
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
</body>
</html>