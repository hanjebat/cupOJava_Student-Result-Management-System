package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class result {
	
	private double total_cgpa;
	private int total_chr;
	

	public boolean storeData() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","username","password");
			String sql = "INSERT INTO result (total_cgpa, total_chr) VALUES (?,?)";
			PreparedStatement statement = con.prepareStatement(sql); //include sql query
			statement.setDouble(1, getTotal_cgpa());
			statement.setInt(2, getTotal_chr());
			statement.executeUpdate();
			statement.close(); //close connection
			con.close();
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean updateData(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","username","password");
			String sql = "UPDATE result SET total_cgpa =?, total_chr = ? WHERE studentid=?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setDouble(1, getTotal_cgpa());
			statement.setInt(2, getTotal_chr());
			statement.setInt(3, id);
			statement.executeUpdate();
			statement.close();
			con.close();
			return true;
			
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean deleteData(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","SatAfiqah!1997!");
			String sql = "DELETE From result WHERE studentid = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			statement.executeUpdate();
			statement.close();
			con.close();
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public double getTotal_cgpa() {
		return total_cgpa;
	}

	public void setTotal_cgpa(double total_cgpa) {
		this.total_cgpa = total_cgpa;
	}

	public int getTotal_chr() {
		return total_chr;
	}

	public void setTotal_chr(int total_chr) {
		this.total_chr = total_chr;
	}
	
}
