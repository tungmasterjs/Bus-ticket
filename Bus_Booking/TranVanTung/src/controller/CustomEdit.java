package controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Users;

@WebServlet("/cus/edit")
public class CustomEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomEdit() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(req.getParameter("logout")==null) {
			if(session.getAttribute("USER")==null) {
				res.sendRedirect(req.getContextPath()+"/cus/login");
			}
			else {
				req.getRequestDispatcher("../WEB-INF/Customer/Edit.jsp").forward(req, res);
			}
		}else {
			session.removeAttribute("username");
			res.sendRedirect(req.getContextPath()+"/cus/login");
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Users user = new Users();
		HttpSession session = req.getSession();
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String newPassword = req.getParameter("passwordEdit");
		String phone = req.getParameter("phone");
		String cmnd = req.getParameter("cmnd");
		
		user.setId(id);
		user.setUsername(username);
		user.setEmail(email);
		user.setName(name);
		
		if(newPassword=="")
			user.setPassword(password);
		else
			user.setPassword(newPassword);
		user.setPhone(phone);
		user.setRole(0);
		user.setIdentify(cmnd);
		
		user.updateUsers();
		session.setAttribute("USER", user);
		res.sendRedirect(req.getContextPath()+"/cus/dashboard");
	}

}
