<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
 <style>
        /* 컨테이너 전체 너비 설정 */
        #container {
            width: 900px; /* 너비를 1204px로 고정 */
            margin: 0 auto; /* 중앙 정렬 */
            border: 1px solid #ccc; /* 외곽선 */
            padding: 20px;
        }

        /* 상단 섹션 (Login 제목) */
        
        .section1 {
            font-size: 32px;
            font-weight: bold;
            color: hsl(104, 23%, 54%); /* 녹색 톤 */
            padding: 10px;
            text-align: left; /* 왼쪽 정렬 */
            margin-bottom: 70px;
        }

        /* 중앙 로그인 섹션 */
        .section2 {
            width: 30%; /* 부모 컨테이너의 50% */
            margin: 0 auto; /* 가운데 정렬 */
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        /* 로고 및 설명 */
        .logo-img img {
            width: 150px;
            margin-bottom: 10px;
        }

        .logo_disc {
            margin: 5px 0;
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }

        /* 폼 스타일 */
        form {
            margin-top: 20px;
        }

        form div {
            margin-bottom: 15px;
            text-align: left; /* ID, Password 텍스트 왼쪽 정렬 */
        }

        /* ID, Password 레이블 */
        .userId,
        .userPwd {
            text-align: left;
            font-size: 14px;
            margin-bottom: 5px;
            padding-right: 10px;
            font-weight: bold;
        }

        /* 입력 필드 */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        /* 버튼 */
        input[type="button"] {
            background: none;
            border: none;
            color: #888;
            cursor: pointer;
            text-align: right;
            font-size: 14px;
        }
        
        /* 아이디 비밀번호 찾기 */
        .searchID {
          text-align: right;
        }

        /* 로그인 버튼 */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #5a7c4e;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        /* 회원가입 영역 */
        .enroll {
            margin-top: 15px;
            font-size: 14px;
            color: #9b9a9a;
            text-align: center;
        }

        .enroll input[type="button"] {
            font-weight: bold;
            color: #333;
            cursor: pointer;
        }
    </style>
    <script>
   		window.onload = function() {
   			
		<% 
			String errorMsg = (String)session.getAttribute("errorMsg"); 
	   		if(errorMsg != null) {
		%>   		
   			alert('<%= errorMsg %>');
   		<%
   				session.removeAttribute("errorMsg");
	   		}
		%>
		
		<%
			String alertMsg = (String)session.getAttribute("alertMsg");
		 		if(alertMsg != null) {
		%>  		
					alert('<%= alertMsg %>');
		<%
						session.removeAttribute("alertMsg");
						}
		%>
		
   		}
   	</script>
</head>
<body>
	<div id="container">
        <div class="section1">Login</div>
        <div class="section2">
            <div>
                <div class="logo-img">
                    <img src="<%= contextPath %>/resources/images/mainlogo.png" alt="logo">
                    <div class="logo_disc">로그인하고 <span style="color: #5a7c4e;">야구</span>의 즐거움을</div>
                    <div class="logo_disc">더 크게 나눠보세요</div>
                </div>
                <form action="<%= contextPath %>/member/login" method="post">
                    <div class="userId">ID</div>
                    <div>
                        <input type="text" name="memberId" placeholder="아이디를 입력하세요" required>
                    </div>
                    <div class="userPwd">Password</div>
                    <div>
                        <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요" required>
                    </div>
                    <div class="searchID">
                        <input type="button" value="아이디 | 비밀번호 찾기">
                    </div>
                    <div>
                        <input type="submit" value="Login">
                    </div>
                    <div class="enroll">
                        야!구했어? 회원이 아니신가요?
                        <input type="button" value="회원가입"> 
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>