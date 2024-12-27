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
<meta charset="UTF-8">
<title>main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/semi/resources/css/common.css">
  
    
    <script>
	var msg = "<%= alertMsg %>"; // var msg = "로그인성공!";
	
	if(msg != "null"){
		alert(msg);
	}
	<% session.removeAttribute("alertMsg"); %>
	</script>
</head>
<body>
	
		<div id="nav-container">
		<%if(loginMember == null) { %>
		<div class="header1">
			<a href="<%= contextPath %>/member/login" class='log-info'>로그인</a> 
			<input type="button"class='log-info' value="회원가입" onclick="moveToEnroll()">
		</div>
		<script>
	    	function moveToEnroll() {
	    		location.assign("<%=contextPath %>/member/enroll")
	    	}
	    </script>
		<% } else { %>
		<div class="header1">
			<a href="<%= contextPath %>/member/mypage" class='log-info'>마이페이지</a> 
			<a href="<%= contextPath %>/member/logout" class='log-info'>로그아웃</a>
		</div>
		<% } %>
		
		<nav class="nav-area">
			<!-- 로고 -->
			<a href="<%= contextPath %>" class="logo"> <img
				src="<%= contextPath %>/resources/images/mainlogo2.png" alt="홈 로고">
			</a>
			<!-- 자유석 카테고리 -->
			<ul class="menu-list">
				<li class="menu"><a href="#">자유석</a>
					<ul class="submenu">
						<li><a href="<%= contextPath %>/board/list">각종 꿀팁 공유</a></li>
						<li><a href="#">좌석 시야 리뷰</a></li>
						<li><a href="#">굿즈 자랑하기</a></li>
					</ul></li>
				<!-- 응원석 카테고리 -->
				<li class="menu"><a href="#">응원석</a>
					<ul class="submenu">
						<li><a href="<%= contextPath %>">구단별 모임</a></li>
						<li><a href="<%= contextPath %>/board/gatherList">소모임</a></li>
					</ul></li>
				<!-- 중계석 카테고리 -->
				<li class="menu"><a href="#">중계석</a>
					<ul class="submenu">
						<li><a href="#">경기 일정 및 순위</a></li>
						<li><a href="#">뉴스 및 선수 동향</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
	
	
</body>
</html>