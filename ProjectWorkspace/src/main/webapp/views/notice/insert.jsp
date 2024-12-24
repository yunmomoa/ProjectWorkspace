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
        text-align: left;
        margin-bottom: 30px;
        font-weight: bold;
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
        display: block;
    }

    input[type="text"], textarea {
        width: 97%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #e6e6fa; /* 연한 하늘색 배경 */
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
        font-size: 16px;
        width: auto; /* 버튼 크기를 내용에 맞게 */
        margin-top: 20px;
        display: block;
        margin-left: auto; /* 중앙 정렬 */
        margin-right: auto; /* 중앙 정렬 */ 
        
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .inline-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 20px;
    }

    .inline-group select {
        width: 100%;
        padding: 4px;
        
    }

    .form-group {
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <% 
        String contextPath = request.getContextPath();
        String userSelection = request.getParameter("noticeLevel");
        String DEFAULT = request.getParameter("noticeStatus") != null ? request.getParameter("noticeStatus") : "Y";
    %>

    <div class="container">
        <h2>공지 작성</h2>
        <form action="<%= contextPath %>/admin/notice/insert" method="post" id="enroll-form" enctype="multipart/form-data">

            <!-- 공지 구분 및 공개 여부 -->
            <div class="inline-group">
                <div >
                    <label for="noticeLevel">공지 구분</label>
                    <select name="noticeLevel" id="noticeLevel" required>
                        <option value="1">중요공지</option>
                        <option value="2">일반공지</option>
                    </select>
                </div>
                <div>
                    <label for="noticeStatus">공개 여부</label>
                    <select name="noticeStatus" id="noticeStatus" required>
                        <option value="Y">공개</option>
                        <option value="N">비공개</option>
                    </select>
                </div>
            </div>

			<!-- 작성자 번호 -->
            <div class="form-group">
                <label for="adminNo">작성자 번호</label>
                <input type="text" name="adminNo" id="adminNo" required>
            </div>

            <!-- 제목 -->
            <div class="form-group">
                <label for="noticeTitle">제목</label>
                <input type="text" name="noticeTitle" id="noticeTitle" required placeholder="제목을 입력하세요.">
            </div>

            <!-- 내용 -->
            <div class="form-group">
                <label for="noticeContent">내용</label>
                <textarea name="noticeContent" id="noticeContent" required maxlength="600" placeholder="최대 600자까지 입력 가능합니다."></textarea>
            </div>

            <!-- 첨부파일 -->
            <div class="form-group">
                <label for="noticeFile">첨부파일</label>
                <input type="file" name="noticeFile" id="noticeFile">
            </div>

            <!-- 등록 버튼 -->
            <input type="submit" value="등록" style="width:15%">
        </form>
    </div>
</body>
</html>
