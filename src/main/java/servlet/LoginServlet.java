package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TbUserDao;
import dao.TbUserDaoImpl;
import dto.TbUser;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 페이지를 보여주고
		RequestDispatcher dis = request.getRequestDispatcher("/login.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 원래는 doGet으로 보내지는데
		// post  데이터를 가지고 여기로 들어오면 Login처리
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("password");
		
		System.out.println(userID +"\n"+ userPW);
		
		TbUserDao dao = new TbUserDaoImpl();
		TbUser dto = dao.selectLogin(userID, userPW);
		
		// 메세지
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//out.println("<script>alert('로그인이 실패\n아이디가 없거나 \n아이디 또는 비밀번호가 틀렸습니다'); location.href='/login.menu';</script>");
		if(dto == null) {
			// 로그인 실패 메세지를 보내고 로그인 페이지로 이동
			response.sendRedirect("/loginerr.jsp"); // 정보를 담은걸 see.jsp로 이동
			
			
		}else {
			HttpSession session = request.getSession();
			// 로그인(유저) 정보를 저장
			session.setAttribute("user", dto); 
			// 로그인 성공 메인으로 가서 메뉴 입력이 보여야 되고
			response.sendRedirect("/"); // 정보를 담은걸 see.jsp로 이동
			// 로그인 메뉴가 로그아웃으로 변경
			
		}
		
	}

}
