package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.SimpleFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.naming.java.javaURLContextFactory;

import com.sun.glass.ui.View;

import model.Ticket;
import model.Users;
import view.status;
import model.Ticket;

/**
 * Servlet implementation class AjaxController
 */
@WebServlet("/AjaxController")
public class ComControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Ticket ticket = new Ticket();
		Users user= new Users();
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		int id;
		int action = Integer.parseInt(request.getParameter("action"));
		
		switch (action) {
		case 0: //Huy Ve
			id = Integer.parseInt(request.getParameter("id"));
			ticket.CancleTicket(id);
			break;
		case 1: //Update ticket and seat
			
			try {
				long ms;
				id = Integer.parseInt(request.getParameter("id"));
				int seat = Integer.parseInt(request.getParameter("seat"));
				int status = Integer.parseInt(request.getParameter("status"));
				int price = Integer.parseInt(request.getParameter("price"));
				String name = request.getParameter("nameUser");
				java.sql.Date date= java.sql.Date.valueOf(request.getParameter("date"));
				
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				ms = sdf.parse(request.getParameter("time")).getTime();
				
				Time time = new Time(ms);
				ticket.setSeat(seat);
				ticket.setStatus(status);
				ticket.setPrice(price);
				ticket.setDate(date);
				ticket.setTime(time);
				ticket.setId(id);
				ticket.setName(name);
				ticket.updateTicket();
				
				out.print(view.status.getStatus(status));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			break;
		case 2:
			id = Integer.parseInt(request.getParameter("id"));
			int role = Integer.parseInt(request.getParameter("role"));
			user.updateRole(id, role);
			out.print(view.Users.getStatus(role));
			break;
		case 3:
			id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String cmnd = request.getParameter("cmnd");
			int roleUser = Integer.parseInt(request.getParameter("role"));
			
			user.setId(id);
			user.setName(name);
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setRole(roleUser);
			user.setIdentify(cmnd);
			
			user.updateUsers();
			out.print(view.Users.getStatus(roleUser));
			break;
			
		case 4: //create new user from admin
			name = request.getParameter("name");
			email = request.getParameter("email");
			username = request.getParameter("username");
			password = request.getParameter("password");
			phone = request.getParameter("phone");
			cmnd = request.getParameter("cmnd");
			role = Integer.parseInt(request.getParameter("role"));
			
			user.setName(name);
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setRole(role);
			user.setIdentify(cmnd);
			
			user.Resign();
		default:
			break;
		}
		
	}

}
