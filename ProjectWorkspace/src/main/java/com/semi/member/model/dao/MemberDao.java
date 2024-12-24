package com.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.semi.common.template.JDBCTemplate.*;
import com.semi.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
	
	public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member login(Connection conn, String memberId, String memberPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("login");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				m = Member.builder().memberNo(rset.getInt("MEMBER_NO"))
									.teamNo(rset.getInt("TEAM_NO"))
									.memberId(memberId)
									.memberName(rset.getString("MEMBER_NAME"))
									.memberPwd(memberPwd)
									.email(rset.getString("EMAIL"))
									.phone(rset.getString("PHONE"))
									.nickName(rset.getString("NICKNAME"))
									.gender(rset.getString("GENDER"))
									.birth(rset.getString("BIRTH"))
									.createDate(rset.getDate("CREATE_DATE"))
									.profileImg(rset.getString("PROFILE_IMG"))
									.memberStatus(rset.getString("MEMBER_STATUS"))
									.build();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
}
