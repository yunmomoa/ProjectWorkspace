package com.semi.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.notice.model.dto.NoticeDTO;
import com.semi.notice.model.service.NoticeService;
import com.semi.notice.model.vo.Notice;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/admin/notice/detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		
		NoticeDTO n = new NoticeService().selectNotice(noticeNo);
		System.out.println(n);
		
		System.out.println("Attachment: " + n.getAt()); // 첨부파일 확인 
	

		if(n != null) {
			request.setAttribute("n", n);
			
			request.getRequestDispatcher("/views/notice/detail.jsp").forward(request, response);
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
