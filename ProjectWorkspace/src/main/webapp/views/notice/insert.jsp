<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.semi.notice.model.vo.Notice" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 20px;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-top: 20px;
        font-weight: bold;
    }

    input[type="text"], textarea, input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #fff;
    }

    textarea {
        resize: none;
        height: 150px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 20px;
        display: block;
        width: 100%;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <% 
        String contextPath = request.getContextPath();

        /* String userSelection = request.getParameter("noticeLevel");
         String DEFAULT = request.getParameter("noticeStatus") != null ? request.getParameter("noticeStatus") : "Y"; */

    %>

    <div class="container">
        <h2>공지 작성</h2>
        <form action="<%= contextPath %>/admin/notice/insert" method="post" id="enroll-form" enctype="multipart/form-data">

            <!-- 제목 -->
            <label for="noticeTitle">제목</label>
            <input type="text" name="noticeTitle" id="noticeTitle" required>

            <!-- 내용 -->
            <label for="noticeContent">내용</label>
            <textarea name="noticeContent" id="noticeContent" required></textarea>

            <!-- 공지 구분 -->
            <label for="noticeLevel">공지 구분 (1, 2번으로 입력)</label>
            <input type="text" name="noticeLevel" id="noticeLevel" required>

            <!-- 작성자 번호 -->
            <label for="adminNo">작성자 번호</label>
            <input type="text" name="adminNo" id="adminNo" required>

            <!-- 첨부파일 -->
            <label for="noticeFile">첨부파일</label>
            <input type="file" name="noticeFile" id="noticeFile">

            <!-- 등록 버튼 -->
            <input type="submit" value="등록">
        </form>
    </div>
</body>
</html>
