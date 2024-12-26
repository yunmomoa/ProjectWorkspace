package com.semi.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.common.model.vo.Attachment;
import static com.semi.common.template.JDBCTemplate.*;

import com.semi.notice.model.dto.NoticeDTO;
import com.semi.notice.model.vo.Notice;

public class NoticeDao {
	
	private static Properties prop = new Properties();
	String path = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
	
	public NoticeDao() {	
		try {
			prop.loadFromXML(new FileInputStream(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertNotice(Connection conn, Notice n) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeLevel());
			pstmt.setInt(4, n.getAdminNo());
			pstmt.setString(5, n.getNoticeStatus());
			
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public static List<Notice> selectList(Connection conn) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = Notice.builder()
								.noticeNo(rset.getInt("NOTICE_NO"))
								.noticeLevel(rset.getInt("NOTICE_LEVEL"))
								.noticeTitle(rset.getString("NOTICE_TITLE"))
								.noticeStatus(rset.getString("NOTICE_STATUS"))
								.createDate(rset.getDate("CREATE_DATE"))
								.adminNo(rset.getInt("ADMIN_NO"))
								.noticeCount(rset.getInt("NOTICE_COUNT"))
								.build();
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public static NoticeDTO selectNotice(Connection conn, int noticeNo) {
		NoticeDTO n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = NoticeDTO.builder()
							.n(Notice.builder()
									.noticeNo(noticeNo)
									.noticeTitle(rset.getString("NOTICE_TITLE"))
									.noticeContent(rset.getString("NOTICE_CONTENT"))
									.createDate(rset.getDate("CREATE_DATE"))
									.adminNo(rset.getInt("ADMIN_NO"))
									.build())
							.at(Attachment.builder()
									.fileNo(rset.getInt("FILE_NO"))
									.originName(rset.getString("ORIGIN_NAME"))
									.changeName(rset.getString("CHANGE_NAME"))
									.filePath(rset.getString("FILE_PATH"))
									.build()
							).build();
							
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return n;
		
	
	}

}
