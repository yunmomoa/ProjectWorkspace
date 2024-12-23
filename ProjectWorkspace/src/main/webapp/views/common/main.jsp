<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); //main.jsp

	Member loginMember = (Member)session.getAttribute("loginMember");
	
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common.css">
    <style>
        .header1 {
            width: 1204px;
            text-align: right;
        }

        .log-info {
            background: none;
            border: none;
            color: #888;
            cursor: pointer;
            text-align: right;
            font-size: 14px;
            margin-left: 7px
        }
    </style>
<script>
	var msg = "<%= alertMsg %>"; // var msg = "로그인성공!";
	
	if(msg != "null"){
		alert(msg); // 문자값 즉 msg 로그인성공! 메세지가 있다면 알럿뜨게한다.
	}
	<% session.removeAttribute("alertMsg");%> // 로그인 후 새로고침할때마다 뜨게되는 알럿 삭제
</script>    
</head>
<body>
	<header>
		<%if(loginMember == null) { %>
		<div class="header1">
			<a href="<%= contextPath %>/member/login" class='log-info' style="text-decoration: none;">로그인</a>
	        <input type="button" class='log-info' value="회원가입" onclick="moveToEnroll()">
	    </div>
	    <script>
	    	function moveToEnroll() {
	    		location.assign("<%=contextPath %>/member/enroll")
	    	}
	    </script>
	    <% } else { %>
	    	<div class="header1">
	        	<a href="<%= contextPath %>/member/mypage" class='log-info' style="text-decoration: none;">마이페이지</a>
	        	<a href="<%= contextPath %>/member/logout" class='log-info' style="text-decoration: none;">로그아웃</a>
	    	</div>
	    <% } %>
    </header>

	<nav class="nav-area" style="text-align: center;">
            <!-- HOME 버튼에 로고 이미지 추가 -->
            <div class="menu">
                <a href="/semi/index.jsp">
                    <img src="/resources/images/mainlogo.png" alt="홈 로고" style="height: 40px; vertical-align: middle;">
                </a>
            </div>
            <!-- 자유석 카테고리 -->
            <div class="menu">
                <a href="#">자유석</a>
                <ul class="submenu">
                    <li><a href="<%= contextPath %>/board/list">각종 꿀팁 공유</a></li>
                    <li><a href="#">좌석 시야 리뷰</a></li>
                    <li><a href="#">굿즈 자랑하기</a></li>
                </ul>
            </div>
            <!-- 응원석 카테고리 -->
            <div class="menu">
                <a href="#">응원석</a>
                <ul class="submenu">
                    <li><a href="#">구단별 모임</a></li>
                    <li><a href="#">소모임</a></li>
                </ul>
            </div>
            <!-- 중계석 카테고리 -->
            <div class="menu">
                <a href="#">중계석</a>
                <ul class="submenu">
                    <li><a href="#">경기 일정 및 순위</a></li>
                    <li><a href="#">뉴스 및 선수 동향</a></li>
                </ul>
            </div>
        </nav>
</body>
</html>