package view;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Ticket;
import model.Users;

/**
 * Servlet implementation class Home_Admin
 */
@WebServlet("/admin/home")
public class AdHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		if(request.getParameter("logout")==null) {
			if(session.getAttribute("USER")==null) {
				response.sendRedirect(request.getContextPath()+"/login");
			}
			else {
				Users user = new Users();
				List<Users> list = user.AllUsers();
				request.setAttribute("LISTALL", list);
				request.setAttribute("USERS", model.UsersRole.values());
				request.getRequestDispatcher("../WEB-INF/Admin/home.jsp").forward(request, response);
			}
		}else {
			session.removeAttribute("USER");
			response.sendRedirect(request.getContextPath()+"/login");
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
