package com.semi.member.model.service;

import java.sql.Connection;

import static com.semi.common.template.JDBCTemplate.*;

import com.semi.common.model.vo.Attachment;
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

	public int enroll(Member m, Attachment at) {
		Connection conn = getConnection();
		
		int result = dao.enroll(conn, m);
		
		if(result > 0 && at != null) {
			result = dao.insertImg(conn,at);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int idCheck(String memberId) {
		Connection conn = getConnection();
		
		int count = dao.idCheck(conn,memberId);
		
		close(conn);
		
		return count;

	
	}
	
	
	
	
	
}
