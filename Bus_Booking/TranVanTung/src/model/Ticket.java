package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class Ticket {
	private int id,id_bus,id_user,price,status,seat;
	private String name,road,name_bus;
	private Time time;
	private Date date;
//getter&&setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_bus() {
		return id_bus;
	}
	public void setId_bus(int id_bus) {
		this.id_bus = id_bus;
	}
	public String getName_bus() {
		return name_bus;
	}
	public void setName_bus(String name_bus) {
		this.name_bus = name_bus;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRoad() {
		return road;
	}
	public void setRoad(String road) {
		this.road = road;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getSeat() {
		return seat;
	}
	
	public List<Ticket> AllTicket(int status){
		List<Ticket> list = new ArrayList<Ticket>();
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "SELECT ticket.*, bus.*, users.name,users.Id FROM ticket LEFT JOIN bus ON ticket.Id_bus = bus.Id LEFT JOIN users ON ticket.Id_user = users.Id WHERE users.role = 0 and status=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setInt(1, status);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Ticket tick = new Ticket();
				tick.setId(rs.getInt("Id"));
				tick.setId_bus(rs.getInt("Id_bus"));
				tick.setId_user(rs.getInt("Id_user"));
				tick.setName(rs.getString("name"));
				tick.setName_bus(rs.getString("name_bus"));
				tick.setRoad(rs.getString("road"));
				tick.setPrice(rs.getInt("price"));
				tick.setSeat(rs.getInt("seat"));
				tick.setDate(rs.getDate("date"));
				tick.setTime(rs.getTime("time"));
				tick.setStatus(rs.getInt("status"));
				list.add(tick);
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateTicket() {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "update ticket set price=?, seat=?, date=?, time=?, status=?, name=? where Id=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			
			ps.setInt(1, this.getPrice());
			ps.setInt(2, this.getSeat());
			ps.setDate(3, this.getDate());
			ps.setTime(4, this.getTime());
			ps.setInt(5, this.getStatus());
			ps.setString(6, this.getName());
			ps.setInt(7, this.getId());
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public List<Ticket> SearchTicketAvalible(String road,String date){
		List<Ticket> list = new ArrayList<Ticket>();
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "SELECT ticket.*, bus.*, users.name,users.Id FROM ticket LEFT JOIN bus ON ticket.Id_bus = bus.Id LEFT JOIN users ON ticket.Id_user = users.Id"
					+ " WHERE users.role = 0 and status=0 AND ticket.date='"+date+"' AND bus.road LIKE '%"+road+"%'";
			PreparedStatement ps =cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Ticket tick = new Ticket();
				tick.setId(rs.getInt("Id"));
				tick.setId_bus(rs.getInt("Id_bus"));
				tick.setId_user(rs.getInt("Id_user"));
				tick.setName(rs.getString("name"));
				tick.setName_bus(rs.getString("name_bus"));
				tick.setRoad(rs.getString("road"));
				tick.setPrice(rs.getInt("price"));
				tick.setSeat(rs.getInt("seat"));
				tick.setDate(rs.getDate("date"));
				tick.setTime(rs.getTime("time"));
				tick.setStatus(rs.getInt("status"));
				list.add(tick);
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	public void CancleTicket(int Id) {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "update ticket set status=0 where Id=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setInt(1, Id);
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void bookingticket(int id,int idUser) {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "update ticket set Id_user=?, status=1 where Id=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setInt(1, idUser);
			ps.setInt(2, id);

			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public List<Ticket> AllTicketUserBooked(int idUser){
		List<Ticket> list = new ArrayList<Ticket>();
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "SELECT ticket.*, bus.*, users.name,users.Id FROM ticket LEFT JOIN bus ON ticket.Id_bus = bus.Id LEFT JOIN users ON ticket.Id_user = users.Id WHERE users.role = 0 and status=1 and ticket.Id_user = ?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setInt(1, idUser);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Ticket tick = new Ticket();
				tick.setId(rs.getInt("Id"));
				tick.setId_bus(rs.getInt("Id_bus"));
				tick.setId_user(rs.getInt("Id_user"));
				tick.setName(rs.getString("name"));
				tick.setName_bus(rs.getString("name_bus"));
				tick.setRoad(rs.getString("road"));
				tick.setPrice(rs.getInt("price"));
				tick.setSeat(rs.getInt("seat"));
				tick.setDate(rs.getDate("date"));
				tick.setTime(rs.getTime("time"));
				tick.setStatus(rs.getInt("status"));
				list.add(tick);
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
