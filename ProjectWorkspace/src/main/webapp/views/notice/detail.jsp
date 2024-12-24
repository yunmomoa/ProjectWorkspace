<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.semi.notice.model.vo.Notice" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff; /* 배경 흰색 */
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 8px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #fff;
    }

    th, td {
        border: 1px solid #000;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #e6e6fa; /* 연한 하늘색 */
        font-weight: bold;
    }

    .btn {
        display: block;
        width: 100px;
        padding: 10px;
        margin: 20px auto;
        text-align: center;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <% 
        String contextPath = request.getContextPath();
        Notice notice = (Notice) request.getAttribute("notice");
    %>

    <div class="container">
        <h2>공지사항 상세보기</h2>
        <table>
            <tr>
                <th>제목</th>
                <td colspan="3"><%= notice.getNoticeTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= notice.getAdminNo() %></td>
                <th>작성일</th>
                <td><%= notice.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" style="text-align: left;"><%= notice.getNoticeContent() %></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                    <%-- <% if (notice.getNoticeFile() != null && !notice.getNoticeFile().isEmpty()) { %>
                        <a href="<%= contextPath %>/upload/<%= notice.getNoticeFile() %>" download><%= notice.getNoticeFile() %></a>
                    <% } else { %> --%>
                   <%--      첨부파일 없음
                    <% } %> --%>
                </td>
            </tr>
        </table>

        <%-- <a href="<%= contextPath %>/notice/list" class="btn">목록으로</a> --%>
    </div>
</body>
</html>
