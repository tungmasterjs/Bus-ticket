package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Users;

@WebServlet("/log")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Login() {
        super();   
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Users users = new Users();
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		
		if(username.isEmpty()||pass.isEmpty()) {
			req.setAttribute("ERROR", "Please fill username or password !!");
			req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
			return;
		}
		Users user = users.login(username, pass);
		if(user.getUsername()==null) {
			req.setAttribute("ERROR", "Wrong username or password");
			req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
			return;
		}

			
		if(username.equals(user.getUsername())&&pass.equals(user.getPassword())) {
			HttpSession session = req.getSession();
			switch (user.getRole()) {
			case 0:
				
				req.setAttribute("ERROR", "You can't login with cus Account");
				req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, res);
				break;
			case 1:
				
				session.setAttribute("USER", user);
				res.sendRedirect(req.getContextPath()+"/ticket/booked");
				break;
			case 2:

				session.setAttribute("USER", user);
				res.sendRedirect(req.getContextPath()+"/admin/home");
				break;

			default:
				break;
			}

		}
	}

}
