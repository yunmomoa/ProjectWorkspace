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

	public int enroll(Connection conn, Member m) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getTeamNo());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberPwd());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getNickName());
			pstmt.setString(8, m.getGender());
			pstmt.setString(9, m.getSsn());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}
}
