<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.admin.model.vo.Admin" %>
<%
	String contextPath = request.getContextPath();

	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main Page</title>
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
	<% if(loginAdmin != null) { %>		
		<div class="header1">
			<a href="<%= contextPath %>/admin/notice/list" class='log-info' style="text-decoration: none;">공지사항</a>
        	<a href="<%= contextPath %>/admin/logout" class='log-info' style="text-decoration: none;">로그아웃</a>
	    </div>
	<% } %>
</body>
</html>