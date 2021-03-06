package com.kh.cscenter.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.cscenter.model.service.GuideService;
import com.kh.cscenter.model.vo.Guide;

/**
 * Servlet implementation class AdminGuideListController
 */
@WebServlet("/adminList.gu")
public class AdminGuideListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGuideListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new GuideService().selectListCount(); // 총 게시글 수
		currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 요청한 페이지
		pageLimit = 10; // 하단 페이징바 최대 페이지 수
		boardLimit = 10; // 한 페이지당 보여질 게시글 수
		maxPage = (int)Math.ceil((double)listCount / boardLimit); // 총 페이지 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 페이징바의 시작 수
		endPage = startPage + pageLimit - 1; // 페이징바의 끝 수
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Guide> list = new GuideService().selectList(pi); 
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/cscenter/admin/adminGuideMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
