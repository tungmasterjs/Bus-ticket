package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Users;

@WebServlet("/cus/resign")
public class CustomReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CustomReg() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("../WEB-INF/Customer/Register.jsp").forward(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		model.Users user = new Users();
		
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String cmnd = req.getParameter("cmnd");
		//
		user.setName(name);
		user.setPhone(phone);
		user.setRole(model.UsersRole.CUS.getValue());
		user.setIdentify(cmnd);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.Resign();
		//
		req.setAttribute("STATUS", "<script>alert('Register Success')</script>");
		req.getRequestDispatcher("../WEB-INF/Customer/Register.jsp").forward(req, res);
	}

}
