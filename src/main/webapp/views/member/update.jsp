<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/member/mypage.jsp" %>


<div class="sidebar">
        <h1>마이페이지</h1>
        <ul class="menu">
            <li>
                <span class="icon"></span>
                <a href="#">내 게시물 조회</a>
            </li>
            <li>
                <span class="icon"></span>
                <a href="#">내 댓글 내역 조회</a>
            </li>
            <li>
                <span class="icon"></span>
                <a href="#">내 문의 내역 조회</a>
            </li>
            <li>
                <span class="icon"></span>
                <a href="#">게시물 삭제 내역 조회</a>
            </li>
            <li>
                <span class="icon"></span>
                <a href="#">관심 구역 저장</a>
            </li>
            <li>
                <span class="icon"></span>
                 <a href="<%= contextPath %>/member/update">프로필 수정</a>
            </li> 
            <li>
                <span class="icon"></span>
                <a href="#">회원탈퇴</a>
            </li>
        </ul>
    </div>

</body>
</html>