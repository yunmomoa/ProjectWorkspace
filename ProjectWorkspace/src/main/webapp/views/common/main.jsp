<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); //main.jsp

	Member loginMember = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<meta charset="UTF-8">
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
</head>
<body>
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
</body>
</html>