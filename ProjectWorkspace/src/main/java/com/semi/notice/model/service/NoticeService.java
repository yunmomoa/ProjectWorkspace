package com.semi.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.semi.common.model.vo.Attachment;
import static com.semi.common.template.JDBCTemplate.*;

import com.semi.notice.model.dao.NoticeDao;

import com.semi.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao dao = new NoticeDao();
	
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		int result = dao.insertNotice(conn, n);
		
		if(result > 0 && at!= null) {
			result = dao.insertAttachment(conn, at);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public List<Notice> selectList() {
		Connection conn = getConnection();
		
		List<Notice> list = NoticeDao.selectList(conn);
		
		close(conn);
		
		return list;
	}

//	public NoticeDTO selectNotice(int noticeNo) {
//		return null;
//	}
}
