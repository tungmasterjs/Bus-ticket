package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import model.Users;

@WebServlet("/cus/login")
public class CustomLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CustomLog() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Users users = new Users();
		
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		if(username.isEmpty()||pass.isEmpty()) {
			req.setAttribute("ERROR", "Please fill username or password !!");
			req.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(req, res);
			return;
		}
		Users user = users.login(username, pass);
		if((username.equals(user.getUsername())||username.equals(user.getEmail()))&&pass.equals(user.getPassword())) {
			HttpSession session = req.getSession();
			session.setAttribute("USER", user);
			res.sendRedirect(req.getContextPath()+"/cus/dashboard");
		}
		if(user.getUsername()==null && user.getEmail()==null) {
			req.setAttribute("ERROR", "Wrong username or password !!!");
			req.getRequestDispatcher("../WEB-INF/Customer/Login.jsp").forward(req, res);
			return;
		}
		
	}

}
