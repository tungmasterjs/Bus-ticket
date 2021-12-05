package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Users;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Users users = new Users();
		
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		
		if(username.isEmpty()||pass.isEmpty()) {
			request.setAttribute("ERROR", "Please enter username or password");
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
			return;
		}
		Users user = users.login(username, pass);
		if(user.getUsername()==null) {
			request.setAttribute("ERROR", "Wrong username or password");
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
			return;
		}

			
		if(username.equals(user.getUsername())&&pass.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			switch (user.getRole()) {
			case 0:
				
				request.setAttribute("ERROR", "You can't login with cus Account");
				request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
				break;
			case 1:
				
				session.setAttribute("username", username);
				response.sendRedirect(request.getContextPath()+"/ticket/booked");
				break;
			case 2:

				session.setAttribute("username", username);
				response.sendRedirect(request.getContextPath()+"/admin/home");
				break;

			default:
				break;
			}

		}
	}

}
