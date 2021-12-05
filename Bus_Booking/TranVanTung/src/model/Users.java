package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Users {
	private String name, email, password, phone, identify,username;
	private int id,role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	public void updateRole(int Id,int role) {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "update users set role=? where Id=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setInt(1, role);
			ps.setInt(2, Id);
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public Users login(String username, String pass) {
		
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "select * from users where (username=? or email=?) and password=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, username);
			ps.setString(3, pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				this.setId(rs.getInt("Id"));
				this.setName(rs.getString("name"));
				this.setUsername(rs.getString("username"));
				this.setPassword(rs.getString("password"));
				this.setRole(rs.getInt("role"));
				this.setPhone(rs.getString("phone"));
				this.setIdentify(rs.getString("cmnd"));
				this.setEmail(rs.getString("email"));
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this;
	}
	public List<Users> AllUsers(){
		List<Users> list = new ArrayList<Users>();
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "SELECT * from users order by Id desc";
			PreparedStatement ps =cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Users user = new Users();
				user.setId(rs.getInt("Id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setIdentify(rs.getString("cmnd"));
				user.setRole(rs.getInt("role"));
				list.add(user);
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
	
	public void updateUsers() {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "update users set name=?, email=?, password=?, phone=?, cmnd=?, role=?, username=? where Id=?";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setString(1, this.getName());
			ps.setString(2, this.getEmail());
			ps.setString(3, this.getPassword());
			ps.setString(4, this.getPhone());
			ps.setString(5, this.getIdentify());
			ps.setInt(6, this.getRole());
			ps.setString(7, this.getUsername());
			ps.setInt(8, this.getId());
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void Resign() {
		try {
			Class.forName(DBConn.jdbc_driver);
			Connection cn = DriverManager.getConnection(DBConn.url,DBConn.user,DBConn.pass);
			String sql = "insert into users (name,email,username,password,phone,cmnd,role) "
					+ "values(?,?,?,?,?,?,?)";
			PreparedStatement ps =cn.prepareStatement(sql);
			ps.setString(1, this.getName());
			ps.setString(2, this.getEmail());
			ps.setString(3, this.getUsername());
			ps.setString(4, this.getPassword());
			ps.setString(5, this.getPhone());
			ps.setString(6, this.getIdentify());
			ps.setInt(7, this.getRole());
			
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
