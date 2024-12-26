<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.semi.notice.model.vo.Notice" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>공지관리</title>
<style>
    h2 {
        font-weight: bold;
        margin: 0 100px 30px;
    }

    #list-area {
        background-color: rgb(216, 218, 245); 
        margin: 0 100px;
        padding: 25px;
        border-radius: 8px; /* 모서리 둥글게 */
    }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
        font-family: Arial, sans-serif;
    }

    thead {
        background-color: rgb(230, 230, 250); 
        font-weight: bold;
    }

    th, td {
        padding: 10px 15px;
        border: 1px solid rgb(200, 200, 200); /* 선 색상  */
    }

    tbody tr {
        background-color: rgb(255, 255, 255); 
        cursor: pointer; /* 클릭 가능 표시 */
    }

    tbody tr:hover {
        background-color: rgb(245, 245, 255); 
    }

    input[type="button"] {
        background-color: rgb(100, 149, 237); 
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="button"]:hover {
        background-color: rgb(72, 118, 230); 
    }
</style>
<script>
    function redirectToDetail(noticeNo) {
        const contextPath = '<%= request.getContextPath() %>';
        window.location.href = contextPath + '/admin/notice/detail?noticeNo=' + noticeNo;
    }
</script>
</head>
<body>
    <h2>공지관리</h2>
    <div id="list-area">
        <div class="select-group">
            <label for="important">공지 구분</label>
            <select id="important">
                <option value="중요공지">중요공지</option>
                <option value="일반공지">일반공지</option>
            </select>
            <label for="title">* 제목</label>
            <input type="text" name="title" id="title">
            <input type="button" value="조회">
        </div>
    </div>
    <br>
    <div style="display: flex; justify-content: flex-end; margin: 0 100px;">
        <input type="button" value="공지글 등록" 
       onclick="location.href='<%= request.getContextPath() %>/admin/notice/insert'">
    </div>
    <div id="notice-list" style="margin: 0 100px;">
        <table>
            <thead>
                <tr>
                    <th>게시글번호</th>
                    <th>공지구분</th>
                    <th>제목</th>
                    <th>공개여부</th>
                    <th>작성일시</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <% List<Notice> list = (List<Notice>) request.getAttribute("list"); %>
                <% for(Notice n : list) { %>
                <tr onclick="redirectToDetail(<%= n.getNoticeNo() %>)">
                    <td><%= n.getNoticeNo() %></td>
                    <td><%= n.getNoticeLevel() == 1 ? "중요공지" : "일반공지" %></td>
                    <td><%= n.getNoticeTitle() %></td>
                    <td><%= n.getNoticeStatus().equals("Y") ? "공개" : "비공개" %></td>
                    <td><%= n.getCreateDate() %></td>
                    <td><%= n.getAdminNo() %></td>
                    <td><%= n.getNoticeCount() %></td>
                    <td></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <script>
    $(function () {
        // 공지사항 목록의 행을 클릭했을 때 상세 페이지로 이동
        $("#notice-list>table>tbody>tr").click(function () {
            const noticeNo = $(this).children().eq(0).text(); // 첫 번째 열의 게시글 번호 가져오기
            location.assign("<%= request.getContextPath() %>/admin/notice/detail?noticeNo=" + noticeNo);
        });
    });
</script>
        
    </div>
</body>
</html>
