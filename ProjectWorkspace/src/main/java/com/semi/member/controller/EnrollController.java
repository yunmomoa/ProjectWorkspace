package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

@WebServlet("/member/enroll")
public class EnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/enroll.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String nickName = request.getParameter("nickName");
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone");
		String ssn = request.getParameter("ssn");
		String gender = request.getParameter("gender");
		int teamNo = Integer.parseInt(request.getParameter("teamNo"));
		
		// 파라미터 가져오기
		String emailUser = request.getParameter("emailUser"); // 이메일 아이디
		String emailDomain = request.getParameter("emailDomain"); // 선택한 도메인
		String customDomain = request.getParameter("customDomain"); // 직접 입력 도메인

		// 최종 도메인 결정
		String finalDomain = (emailDomain == null || emailDomain.isEmpty()) ? customDomain : emailDomain;

		// 최종 이메일 주소 조합
		String fullEmail = emailUser + "@" + finalDomain;
		
		// 2) 데이터 가공처리
		Member m = Member.builder()
						.memberId(memberId)
						.memberPwd(memberPwd)
						.nickName(nickName)
						.memberName(memberName)
						.phone(phone)
						.email(fullEmail)
						.ssn(ssn)
						.gender(gender)
						.teamNo(teamNo)
						.build();
		
		// 서비스 메서드 호출 및 결과 값 돌려받기
		int result =  new MemberService().enroll(m);
		
		// 처리결과 후
		if(result > 0 ) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 성공");
			
			response.sendRedirect(request.getContextPath());
					
		}else {
			request.setAttribute("errorMsg", "실패");
			request.getRequestDispatcher("/views/member/enroll.jsp").forward(request, response);
		}
	}

}
