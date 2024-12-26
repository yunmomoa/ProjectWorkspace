package com.semi.member.model.service;

import java.sql.Connection;

import static com.semi.common.template.JDBCTemplate.*;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;

public class MemberService {
	
	MemberDao dao = new MemberDao();

	public Member login(String memberId, String memberPwd) {
		Connection conn = getConnection();
		
		Member m = dao.login(conn, memberId, memberPwd);
		
		close(conn);
		
		return m;
	}
}
