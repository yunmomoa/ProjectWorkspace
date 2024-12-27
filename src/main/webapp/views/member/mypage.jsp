<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
    body {
       
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #F9F9F9;
        max-width: 900px; /* 최대 너비를 제한 */
		margin: 0 auto; /* 화면 가운데 정렬 */
    }
    .sidebar {
        height: 100vh;
        background-color: #78A778;
        color : #fff;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        padding: 10px;
        width : 180px
    }
    .sidebar h1 {
        font-size: 24px;
        margin-bottom: 30px;
        color: #333;
       
    }
    .menu {
        list-style: none;
        padding: 0;
        margin: 0;
        color : #fff;
    }
    .menu li {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        color : #fff;
    }
    .menu li:last-child {
        margin-bottom: 0;
        color : #fff;
    }
    .menu li a {
        text-decoration: none;
        color: #333;
        font-size: 16px;
        flex-grow: 1;
        color : #fff;
    }
    .menu li .icon {
        margin-right: 10px;
        font-size: 18px;
        color: #666;
    }
    .menu li .button {
        background-color: #DFF1D7;
        border: none;
        border-radius: 20px;
        padding: 10px 15px;
        font-size: 14px;
        color: #333;
        cursor: pointer;
        flex-grow: 1;
        text-align: center;
        color : #fff;
    }
    .content {
        margin-left: 270px;
        padding: 20px;
        color : #fff;
    }
</style>
</head>

<body>

	<%@ include file="/views/common/main.jsp" %>
	
	<form id="mypage-form" action="<%= contextPath %>/member/mypage" method="post">
	
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
    
    
    <div class="content">
        <!-- 이 영역에 본문 콘텐츠를 추가 -->
        <h2>마이페이지 콘텐츠</h2>
        <p>이곳에 마이페이지의 본문 콘텐츠가 들어갑니다.</p>
        
    </div>
    </form>

</body>
</html>