<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enroll Page</title>
    <style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	max-width: 900px; /* 최대 너비를 제한 */
	margin: 0 auto; /* 화면 가운데 정렬 */
	gap: 30px;
}
/* 사이드바 스타일 */
.sidebar {
	background-color: #78A778;
	color: #fff;
	width: 96px; /* 가로 크기 줄임 */
	height: 100vh;
	padding: 15px; /* 여백 줄임 */
}
/* 메인 콘텐츠 스타일 */
.content {
	background-color: #fff;
	flex: 1;
	padding: 15px; /* 여백 줄임 */
}

.sidebar h2 {
	font-size: 24px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar li {
	margin: 15px 0;
}
/* 메인 콘텐츠 스타일 */
.content {
	background-color: #fff;
	flex: 1;
	padding: 20px;
}

.profile-section {
	text-align: center;
	margin-bottom: 20px;
}

.profile-section img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	border: 1px solid #ccc;
}

.profile-section button {
	margin: 5px;
	padding: 5px 10px;
}

.form-section {
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
}

.form-group {
	flex: 1 1 calc(50% - 20px);
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-group input, .form-group select {
	width: 332px;
	padding: 8px;
	box-sizing: border-box;
}

.gender-group, .team-group {
	margin-top: 20px;
}

.gender-group label {
	font-weight: bold;
}

.team-group {
	border: 1px solid #ccc;
	padding: 10px;
	display: flex;
	flex-wrap: wrap;
}

.team-group label {
	margin-right: 10px;
}

.update-button {
	text-align: center;
	margin-top: 20px;
}

.update-button button {
	background-color: #78A778;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

#custom-domain {
	width: 150px; /* 도메인 입력 필드 너비 */
	padding: 8px;
	box-sizing: border-box;
	margin-left: 177px;
}

#email, #email-domain, #custom-domain {
	width: 150px; /* 너비를 조정 */
	padding: 8px;
	box-sizing: border-box;
}

span {
	margin: 0;
	font-size: 16px; /* @ 기호 크기 */
}

</style>
</head>
<body>
    <!-- 사이드바 -->
    <div class="sidebar">
        <h2>Account</h2>
        <ul>
            <li>회원가입</li>
            <li>이용약관</li>
            <li>로그인</li>
        </ul>
    </div>
    <!-- 메인 콘텐츠 -->
    <div class="content">
        <div class="profile-section">
            <img src="https://via.placeholder.com/100" alt="Profile Image">
            <div>
                <button>취소</button>
                <button>확인</button>
            </div>
        </div>
        <form id="enrollr-form" action="<%=contextPath%>/member/enroll" method="post">
            <div class="form-section">
                <div class="form-group">
                    <label for="memberName">이름</label>
                    <input type="text" id="memberName" name="memberName" placeholder="이름을 입력하세요" maxlength="10" required>
                </div>
                <div class="form-group">
                    <label for="memberId">ID</label>
                    <input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요" required>
                    <button type="button" onclick="idCheck();">중복확인</button>
                </div>
                <div class="form-group">
                    <label for="memberPwd">Password</label>
                    <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력하세요" maxlength="15" required
                                pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$"
                                title="비밀번호는 8~15자 사이의 영문자와 숫자를 포함해야 합니다.">
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">Password 재확인</label>
                    <input type="password" id="confirmPwd" placeholder="비밀번호와 동일하게 입력하세요" maxlength="15" required>
                    <div class="error">비밀번호가 일치하지 않습니다.</div>
                </div>
                <div class="form-group">
                    <label for="nickName">닉네임</label>
                    <input type="text" name="nickName" placeholder="닉네임을 입력하세요" maxlength="10" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" name="phone" placeholder="- 없이 숫자만 입력하세요">
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <div style="display: flex; align-items: center; gap: 5px;">
                	<input type="text" id="email" name="emailUser" placeholder="이메일 아이디" maxlength="20" required>
		    		<span>@</span>
		  			<select id="email-domain" name="emailDomain" onchange="updateDomain()">
                		<option value="">직접 입력</option>
                		<option value="naver.com">naver.com</option>
                		<option value="gmail.com">gmail.com</option>
                		<option value="daum.net">daum.net</option>
                		<option value="kakao.com">kakao.com</option>
            		</select>
            		</div>
            		<input type="text" id="custom-domain" name="customDomain" placeholder="도메인 입력" style="display: none; margin-top: 5px;" maxlength="15">
                </div>
                
                <div class="form-group">
                    <label for="ssn">주민등록번호</label>
                    <input type="text" id="ssn" name="ssn" maxlength="14" placeholder=" -포함해서 작성하세요">
                </div>
                
                <div class="gender-group">
                    <label>성별</label>
                    <input type="radio" id="male" name="gender" value="M">
                    <label for="male">남성</label>
                    <input type="radio" id="female" name="gender" value="F">
                    <label for="female">여성</label>
                </div>
            </div>
            <h3 class="team-header">내 구단 선택</h3>
            <div class="team-group">
                    <label><input type="radio" value="1" name="teamNo" id="kia"> KIA</label>
                    <label><input type="radio" value="2" name="teamNo" id="samsung"> 삼성</label>
                    <label><input type="radio" value="3" name="teamNo" id="lg"> LG</label>
                    <label><input type="radio" value="4" name="teamNo" id="doosan"> 두산</label>
                    <label><input type="radio" value="5" name="teamNo" id="kt"> KT</label>
                    <label><input type="radio" value="6" name="teamNo" id="ssg"> SSG</label>
                    <label><input type="radio" value="7" name="teamNo" id="lotte"> 롯데</label>
                    <label><input type="radio" value="8" name="teamNo" id="hanhwa"> 한화</label>
                    <label><input type="radio" value="9" name="teamNo" id="nc"> NC</label>
                    <label><input type="radio" value="10" name="teamNo" id="kiwoom"> 키움</label>
                    <label><input type="radio" value="11" name="teamNo" id="noteam"> 미정</label>
            </div>
            <div class="update-button">
                <button type="submit">회원가입</button>
                <button type="reset">초기화</button>
            </div>
        </form>
    </div>
	<script>
		document
				.getElementById('memberPwd')
				.addEventListener(
						'submit',
						function(event) {
							var password = document.getElementById('memberPwd').value;
							var confirmPassword = document
									.getElementById('confirmPwd').value;
							if (password !== confirmPassword) {
								alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
								event.preventDefault(); // 폼 제출을 막음
							}
						});
		var password = document.getElementById('memberPwd');
		var confirmPassword = document.getElementById('confirmPwd');
		var passwordError = document.getElementById('passwordError');
		function validatePassword() {
			if (password.value !== confirmPassword.value) {
				passwordError.style.display = 'inline';
			} else {
				passwordError.style.display = 'none';
			}
		}
		password.addEventListener('keyup', validatePassword);
		confirmPassword.addEventListener('keyup', validatePassword);
	</script>
	<script>
        function updateDomain() {
            const domainSelect = document.getElementById('email-domain');
            const customDomain = document.getElementById('custom-domain');

            if (domainSelect.value === "") {
                customDomain.style.display = "inline";
                customDomain.value = "";
            } else {
                customDomain.style.display = "none";
                customDomain.value = domainSelect.value;
            }
        }
    </script>
	<script>
		function updateDomain() {
			const domainSelect = document.getElementById('email-domain');
			const customDomain = document.getElementById('custom-domain');
			if (domainSelect.value === "") {
				customDomain.style.display = "block"; // 직접 입력 선택 시 아래로 표시
				customDomain.value = "";
			} else {
				customDomain.style.display = "none"; // 다른 옵션 선택 시 숨김
				customDomain.value = domainSelect.value;
			}
		}
	</script>
</body>
</html>