<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
     <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #topMenu {
            height: 30px;  /* 메인 메뉴의 높이 */
            width: 750px;  /* 메인 메뉴의 넓이 */
                  margin-left: auto;
 				margin-right: auto;
            
    }
    #topMenu ul {           /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
        list-style-type: none;  /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
         margin: 0px;            /* 메인 메뉴 안의 ul의 margin을 없앰 */ 
        padding: 0px;           /* 메인 메뉴 안의 ul의 padding을 없앰 */
 
        
    }
    #topMenu ul li {            /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
        color: white;               /* 글씨 색을 흰색으로 설정 */
        background-color: #2d2d2d;  /* 배경 색을 RGB(2D2D2D)로 설정 */
        float: left;                /* 왼쪽으로 나열되도록 설정 */
        line-height: 30px;          /* 텍스트 한 줄의 높이를 30px로 설정 */
        vertical-align: middle;     /* 세로 정렬을 가운데로 설정 */
        text-align: center;         /* 텍스트를 가운데로 정렬 */
        position: relative;         /* 해당 li 태그 내부의 top/left 포지션 초기화 */
    }
    .menuLink, .submenuLink {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
        text-decoration:none;               /* a 태그의 꾸밈 효과 제거 */
        display: block;                     /* a 태그의 클릭 범위를 넓힘 */
        width: 150px;                       /* 기본 넓이를 150px로 설정 */
        font-size: 12px;                    /* 폰트 사이즈를 12px로 설정 */
        font-weight: bold;                  /* 폰트를 굵게 설정 */
        font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
    }
    .menuLink {     /* 상위 메뉴의 글씨색을 흰색으로 설정 */
        color: white;
    }
    .menuLink {color: white !important;}

    .topMenuLi:hover .menuLink {    /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
        color: red;                 /* 글씨 색 빨간색 */
        background-color: #4d4d4d;  /* 배경색을 밝은 회색으로 설정 */
    }
    .submenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
        color: #2d2d2d;             /* 글씨 색을 RGB(2D2D2D)로 설정 */
        background-color: white;    /* 배경색을 흰색으로 설정 */
        border: solid 1px black;    /* 테두리를 설정 */
        margin-top: -1px;           /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
    }
    .longLink {     /* 좀 더 긴 메뉴 스타일 설정 */
        width: 190px;   /* 넓이는 190px로 설정 */
    }
    .submenu {              /* 하위 메뉴 스타일 설정 */
        position: absolute;     /* html의 flow에 영향을 미치지 않게 absolute 설정 */
        height: 0px;            /* 초기 높이는 0px로 설정 */
        overflow: hidden;       /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
        transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
        -webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
        -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
        -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
    }
    .topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
        height: 155px;           /* 높이를 93px로 설정 *//* 155로 늘림. 서브메뉴5개 */
    }
    .submenuLink:hover {        /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
        color: red;                 /* 글씨색을 빨간색으로 설정 */
        background-color: #dddddd;  /* 배경을 RGB(DDDDDD)로 설정 */
    }
    
    
 /*로고, 검색창, 로그인  */   
   #logo_line_container{width:100%;text-align:center;padding: 5px 0;width:1005px;margin:0 auto}


#logo_line{
	position:relative;
	width:1005px;
	margin:0 auto;
	vertical-align: middle;
    display: table-cell;
    /*padding:45px 0;*/
    height:70px;
    overflow:visible;
}



#logo_toplogo{ float:left; }
#logo_toplogo img{float:left;border:0;visibility:visible;}

#logo_menu{float:left;margin: 11px 14px 0 0;}
#logo_menu a {float:left;background-image: url('/board/images/sprites_top_table_inc.png?t120');height:16px;margin-right: 5px;}

#btn_topmenu_announce { background-position:0 -102px; width:44px; } 
#btn_topmenu_total { background-position:0 -721px; width:61px; } 
#btn_topmenu_total_memo { background-position:0 -737px; width:46px; }
#btn_topmenu_control_panel { background-position:-47px -737px; width:40px; }

#logo_line1 {
	display:inline-block; 
	float:left;
}

#logo_line2{
	display:inline-block;
	float:left;
	position: absolute;
	left: 275px;
}



#logo_line_search_div{
	float: left;
	border: 1px solid #ccc;
	height: 40px;
	border-radius: 19px;
}

#logo_line_search_div form{
	margin: 0;
	line-height: 40px;
}

#logo_line_search_div select{
	margin: 0 0 0px 10px;
	color: #777;
	padding-right: 2px;
	border: 0;	
}

#logo_line_search_div input[type=text]{
	border: 0;
	height: 30px;
	width:150px;
	outline:none	
}



#logo_line_search_div input[type=image]{
  margin: 11px 16px 0px 0;
  float: right;
}



#login_div{
  display:inline-block;
  float:right;
  font-size:12px;
  color: #777;
  margin-top: 9px;
}


#login_div a:link,#login_div a:visited, #login_div a:hover{color: inherit;text-decoration:none;}
#login_div form { float:left; padding:0 6px 0 0; margin:0 6px 0 0; }
#login_div .login_input {float:left;width:60px;margin:0 3px 0 0;background:#ffffff;border: 1px solid #ccc;height: 23px;padding-left: 3px;}
#login_div .login_btn {cursor:pointer;background-color: #fcfcfc;border: solid 1px #ccc;color: #777;font-family:Verdana,Tahoma;font-size: .9em;height: 23px;}
#login_user_info {float:left;margin: 4px 10px 0 0;color: #09f;position:relative;}
#login_user_info * { float:left; }
#login_user_menu {float:left;}

#login_user_menu a, #login_user_menu span { float:left; margin:4px 4px 0 0;border:0; }
#login_user_menu.login a,#login_user_menu.login span {padding: 0 7px 0 3px;border-right: 1px solid #ccc;}

#login_user_menu.login span {cursor: pointer;}


#login_user_menu.login a:last-child{padding: 0 7px 0 3px;border-right:0;}
   
	
</style>
</head>
<!--바디시작------------------------->
<body>
<div id="logo_line_container">
	<div id="logo_line" class='cf'>
		<div id="logo_line1" >
            <div id="logo_toplogo">
              <a href='main.do' target='_top'><img src='images/lasthumor.PNG' style="content:normal !important;"></a></div>
		</div><!--logo_line1-->
        <div id="logo_line2" >
            <div id="logo_menu">
                <a href="#" id="btn_topmenu_announce"></a>
                <a href="#" id="btn_topmenu_control_panel"></a>
            </div>
            <div id="logo_line_search_div">
                <form action="search.do" method="get" name="up_search" id="search" onsubmit="#">
                    <input type="hidden" name="kind" value="search">
                    <select name="keyfield">
                        <option value="subject" selected="selected">제목</option>
                        <option value="id">아이디</option>
                    </select>
                    <select name="category">
                        <option value="humor" selected="selected">유머</option>
                        <option value="free">자유</option>
                    </select>
                    <input type="text" size="20" name="keyword" value="">
                    <input type="image" name="Submit" value="검색" src="images/search.png">
                </form>
            </div>
                       
        </div><!--logo_line2-->
        
     <%/* 로그인 했을때 와 안했을 때 맨 위 구성 변경 - 로그인 안했을 때*/
 	 String id = (String)session.getAttribute("id");
 		if(id == null || id.equals("")){
	 %>
        <div id="login_div" >
            <form name="login" method="post" action="login.do" target="_top">
                <input name="id" type="text" id="id" value="" class="login_input" placeholder="ID" required="required">
                <input name="password" type="password" id="password" class="login_input" placeholder="PASS" required="required">
                <input type="submit" class="login_btn" value="로그인">
            </form>
            <div id="login_user_menu">
                <a href="joinForm.do" target="_top">회원가입</a>
            </div>
        </div>
      <%/* master일때 */
 	  }else if(id.equals("master")){
 	  %>
	 	  <div id="login_div" >
            <form name="login" method="post" action="login.do" target="_top">
                	<h2 style="text-align: left;">관리자님 반갑습니다.</h2>
            </form>
         	 <div id="login_user_menu">
                <a href="logout.do" target="_top">로그아웃</a>
            </div>
        </div> 
 	  <%
 	  }/* 로그인 했을 때  */
 	  else {
 	  %>
	 	  <div id="login_div" >
            <form name="login" method="post" action="login.do" target="_top">
                	<h2 style="text-align: left;">${member==null ? '손' : member.name }님 반갑습니다.</h2>
            </form>
         	 <div id="login_user_menu">
                <a href="logout.do" target="_top">로그아웃</a>
            </div>
        </div> 
 	  <%
 	  }
   	  %>
    </div>
</div>
       
        
 <!-- 메뉴시작------------------------------------------------------------------------------------->       
<nav id="topMenu" >
	 <ul> <li class="topMenuLi"><a class="menuLink" href="boardBestList.do">베스트게시판</a></li>
	 	  <li class="topMenuLi"><a class="menuLink" href="boardList.do?category=humor">유머게시판</a></li>
	 	  <li class="topMenuLi"><a class="menuLink" href="boardList.do?category=free">자유게시판</a></li>
	 	  
	 	  <%/* 로그인 했을때 와 안했을 때 메뉴구성 변경 - 로그인 안했을 때*/
	 	  id = (String)session.getAttribute("id");
	 		if(id == null || id.equals("")){
	 	  %>
	 	  <li class="topMenuLi"><a class="menuLink" href="writeForm.do">글쓰기</a></li> 
	 	  <li class="topMenuLi"><a class="menuLink" href="#">접속하기</a>
	 	  	<ul class="submenu"> 
	 	  		<li><a href="loginForm.do" class="submenuLink">로그인</a></li>
	 	  		<li><a href="joinForm.do" class="submenuLink">회원가입</a></li>
	 	  	</ul>
	 	  <%/* 로그인 했을 때  */
	 	  }else{
	 		  if(id.equals("master") ){//마스터의 경우 관리자페이지
	 			  
	 	  %>
	 	  <li class="topMenuLi"><a class="menuLink" href="">관리자페이지</a>
	 	  	<ul class="submenu"> 
	 	  		<li><a href="memberList.jsp" class="submenuLink">회원 목록</a></li>
	 	  		<li><a href="viewReport.do" class="submenuLink">신고 내용</a></li>
	 	  		<li><a href="noticeForm.do" class="submenuLink">공지 작성</a></li>
	 	 	 </ul>
	 	  </li> 
	 	  <li class="topMenuLi"><a class="menuLink" href="#">마이페이지</a>
	 	  <ul class="submenu"> 
	 	  		<li><a href="view.do" class="submenuLink">회원정보 조회</a></li>
	 	  		<li><a href="updateForm.do" class="submenuLink">회원정보 수정</a></li>
	 	  		<li><a href="boardScrapList.do" class="submenuLink">스크랩보기</a></li>
	 	  		<li><a href="deleteForm.do" class="submenuLink">회원 탈퇴</a></li>
	 	  </ul>
	 	 <%
	 		  }else{//일반사용자의 경우 글쓰기 페이지 writeForm.do
	 	 %>
 	 	 <li class="topMenuLi"><a class="menuLink" href="writeForm.do">글쓰기</a></li> 
 	 	 <li class="topMenuLi"><a class="menuLink" href="#">마이페이지</a>
 	  	 <ul class="submenu"> 
	 	  		<li><a href="view.do" class="submenuLink">회원정보 조회</a></li>
	 	  		<li><a href="updateForm.do" class="submenuLink">회원정보 수정</a></li>
	 	  		<li><a href="boardScrapList.do" class="submenuLink">스크랩보기</a></li>
	 	  		<li><a href="deleteForm.do" class="submenuLink">회원 탈퇴</a></li>
	 	  </ul>
	 	 <%
	 	 	 }
	 	  }
	 	 %>
	 	  </li> 
	 </ul> 
</nav>


<div style="width: 750px; text-align: center; margin-left: auto; margin-right: auto" align="center">
<deco:body>

</deco:body>
</div>
</body>
</html>