<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
<style>
        /* 기본 설정 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    min-width: 996px; /* 최소 너비 고정 */
    max-width: 996px; /* 최대 너비 고정 */
    margin: 0 auto; /* 가운데 정렬 */
    overflow-x: auto; /* 가로 스크롤 허용 */
}

/* 로그인 컨테이너 */
.container {
    width: 996px; /* 너비 고정 */
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 30px;
    text-align: center;
}

/* 제목 스타일 */
.title {
	display: flex;
    font-size: 24px;
    font-weight: bold;
    text-align: left;
    margin-bottom: 10px;
}

/* 로그인 박스 */
.login-box {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #f9fafc;
    padding: 30px;
    border-radius: 8px;
}

.login-iogo img{
	width: 25px;
    height: 25px;
}

/* 아이콘 */
.login-icon img {
    width: 120px;
    height: 120px;
}

/* 로그인 폼 */
.login-form {
    flex: 1;
    margin-left: 30px;
}

/* 입력 그룹 */
.form-group {
    margin-bottom: 20px;
    text-align: left;
}

.form-group label {
    display: block;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group label span {
    font-weight: bold;
    color: #fff;
    background-color: #d9534f;
    padding: 3px 8px;
    border-radius: 4px;
    margin-right: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* 로그인 버튼 */
.login-button {
    width: 20%;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
    background-color: #6c757d;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.login-button:hover {
    background-color: #5a6268;
}

/* 안내 메시지 */
.login-info {
    margin-top: 15px;
    font-size: 12px;
    color: #666;
    text-align: left;
}
</style>
</head>
<body>
    <div class="container">
        <div class="title">
            <div class="title">
            	<div class="login-iogo">
	                <img src="<%= contextPath %>/resources/images/mainlogo.png" alt="logo">
            	</div>
	            <div>관리자 시스템 로그인</div>
            </div>
        </div>
        <div class="login-box">
            <div class="login-icon">
                <img src="<%= contextPath %>/resources/images/user-gear.png" alt="user-icon">
            </div>
            <form action="<%= contextPath %>/admin" class="login-form" method="post">
                <div class="form-group">
                    <label for="admin-id">관리자 ID</label>
                    <input type="text" name="adminId" placeholder="ID를 입력하세요">
                </div>
                <div class="form-group">
                    <label for="admin-pw">비밀번호</label>
                    <input type="password" name="adminPwd" placeholder="비밀번호를 입력하세요">
                    <p class="login-info">* 비밀번호 분실 시 master에게 문의하시기 바랍니다.</p>
                </div>
                <input type="submit" class="login-button" value="login">
            </form>
        </div>
    </div>
</body>
</html>