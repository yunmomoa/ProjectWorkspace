 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMainPage</title>
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

   

    tbody tr{
        background-color: rgb(255, 255, 255); 
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
<%@ page import="java.util.List, com.semi.notice.model.vo.Notice" %>
</head>
<body>
    <div class="ad-main">
        <h2>공지사항</h2>
        <div style="display:flex; justify-content: flex-end; margin-bottom: 20px;" >
        <input type="button" value="모두보기" onclick="/admin/notice/list">
        </div>
        <!--onclick시 notice list페이지로 이동하게 코드 수정하기-->
        <div >
            <table>
                <thead>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>중요공지</th>
                </thead>
                <tbody>
                <% List<Notice> list = (List<Notice>) request.getAttribute("list"); %>
                <% for(Notice n : list) { %>
                <tr>
                    <td><%= n.getNoticeTitle() %></td>
                    <td><%= n.getCreateDate() %></td>
                    <td><%= n.getNoticeLevel() == 1 ? "증요공지" : "일반공지"%></td>
                </tr>
                <% } %>
                
                <!-- body안에  여기는 1:1문의 완성 시 표 넣어놓기!! -->
            </tbody>
            </table>
        </div>
        <h2>1:1 문의</h2>
    </div>
</body>
</html> 