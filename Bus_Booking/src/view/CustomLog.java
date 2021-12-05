package view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import model.Users;

/**
 * Servlet implementation class Home_Customer
 */
@WebServlet("/cus/login")
public class CustomLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomLog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users users = new Users();
		
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		if(username.isEmpty()||pass.isEmpty()) {
			request.setAttribute("ERROR", "Please enter username or password");
			request.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(request, response);
			return;
		}
		Users user = users.login(username, pass);
		if(user.getUsername()==null && user.getEmail()==null) {
			request.setAttribute("ERROR", "Wrong username or password");
			request.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(request, response);
			return;
		}
		if((username.equals(user.getUsername())||username.equals(user.getEmail()))&&pass.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect(request.getContextPath()+"/cus/dashboard");
		}
	}

}
