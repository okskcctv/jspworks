package com.controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.repository.Board;
import com.repository.BoardDAO;
import com.repository.Member;
import com.repository.MemberDAO;

@WebServlet("*.do")
public class MainControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO memberDAO;
	BoardDAO boardDAO;

	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
		boardDAO = new BoardDAO();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		String nextPage = null;
		
		HttpSession session = request.getSession(); // 세션 객체 생성
		
		if(command.equals("/memberForm.do")) {
			nextPage = "/memberForm.jsp";
		}
		if(command.equals("/memberList.do")) {
			ArrayList<Member> memberList = memberDAO.getListAll();
			
			request.setAttribute("memberList", memberList);
			
			nextPage = "/memberList.jsp";
		}
		if(command.equals("/addMember.do")) {
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			if(!memberDAO.IdCheck(memberId)){
				nextPage = "/addError.jsp";
			}else{
				Member member = new Member();
				member.setMemberId(memberId);
				member.setPasswd(passwd);
				member.setName(name);
				member.setGender(gender);
				
				memberDAO.addMember(member);
				
				request.setAttribute("msg", "register");
				
				nextPage = "/memberResult.jsp";
			}
		}
		if(command.equals("/login.do")) {
			nextPage = "/loginMember.jsp";
		}
		if(command.equals("/loginProcess.do")) {
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = memberDAO.getMember(memberId).getName();
			
			boolean result = memberDAO.checkLogin(memberId, passwd);
			
			if(result){
				session.setAttribute("sessionId", memberId); // 세션 발급
				session.setAttribute("name", name);
				request.setAttribute("msg", "login");
				nextPage = "/memberResult.jsp";
			}else{
				nextPage = "/loginError.jsp";
			}
		}
		if(command.equals("/logout.do")) {
			
			session.invalidate();
			
			request.setAttribute("msg", "logout");

			nextPage = "/memberResult.jsp";
		}
		if(command.equals("/deleteMember.do")) {
			String memberId = request.getParameter("memberId");
			
			memberDAO.deleteMember(memberId);
			
			nextPage = "/memberList.do";
		}
		if(command.equals("/memberView.do")) {
			String memberId = (String)session.getAttribute("sessionId");
			if(memberId == null) {
				nextPage = "login.do";
			}
			else {
				Member member = memberDAO.getMember(memberId);
			
				request.setAttribute("member", member);
			
				nextPage = "/memberView.jsp";
			}
			
		}
		if(command.equals("/updateMember.do")) {
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(passwd);
			member.setName(name);
			member.setGender(gender);
			
			memberDAO.updateMember(member);
			
			request.setAttribute("msg", "update");
			
			nextPage = "/memberResult.jsp";
		}
		if(command.equals("/boardList.do")) {
			String memberId = (String)session.getAttribute("sessionId");
			if(memberId == null) {
				nextPage = "login.do";
			}
			else {
				ArrayList<Board> boardList = boardDAO.getListAll();
				
				request.setAttribute("boardList", boardList);
				
				nextPage = "board/boardList.jsp";
			}
		}
		if(command.equals("/writeForm.do")) {
			String memberId = (String)session.getAttribute("sessionId");
			if(memberId == null) {
				request.setAttribute("msg", "write_error");
				
				nextPage = "board/boardResult.jsp";
			}
			else {
				nextPage = "board/writeForm.jsp";
			}
		}
		if(command.equals("/writeBoard.do")) {
			String memberId = (String)session.getAttribute("sessionId");
			if(memberId == null) {
				request.setAttribute("msg", "write_error");
				
				nextPage = "board/boardResult.jsp";
			}
			else {
				Board board = new Board();
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				board.setTitle(title);
				board.setContent(content);
				board.setMemberId(memberId);
				
				boardDAO.insertBoard(board);
				
				request.setAttribute("msg", "write");
				
				nextPage = "board/boardResult.jsp";
			}
		}
		if(command.equals("/boardView.do")) {
			int bnum = 0;
			if(request.getParameter("bnum") != null) {
				bnum = Integer.parseInt(request.getParameter("bnum"));
			}
			if(bnum == 0) {
				nextPage = "login.do";
			}
			else {
				boardDAO.updateHit(bnum);
				Board board = boardDAO.getBoard(bnum);
				String sessionId = (String)session.getAttribute("sessionId");
				
				request.setAttribute("board", board);
				request.setAttribute("sessionId", sessionId);
				
				nextPage = "board/boardView.jsp";
			}
		}
		if(command.equals("/updateBoard.do")) {
			Board board = new Board();
			
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			board.setBnum(bnum);
			board.setTitle(title);
			board.setContent(content);
			
			boardDAO.updateBoard(board);
			
			request.setAttribute("msg", "update");
			
			nextPage = "board/boardResult.jsp";
		}
		if(command.equals("/deleteBoard.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			boardDAO.deleteBoard(bnum);
			
			request.setAttribute("msg", "delete");
			
			nextPage = "board/boardResult.jsp";
		}
		
		// 포워딩
		RequestDispatcher dispatcher
				= request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
