package com.kh.cscenter.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cscenter.model.service.QnaService;

/**
 * Servlet implementation class AdminQnaUpdateController
 */
@WebServlet("/adminUpdate.qa")
public class AdminQnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int qNo = Integer.parseInt(request.getParameter("qno"));
		int adminNo = Integer.parseInt(request.getParameter("adminNo"));
		String answer = request.getParameter("answer");
		
		int result = new QnaService().insertQnA(qNo, answer, adminNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변이 성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adminDetail.qa?qno=" + Integer.parseInt(request.getParameter("qno")));
		}else { //에러페이지
			
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
