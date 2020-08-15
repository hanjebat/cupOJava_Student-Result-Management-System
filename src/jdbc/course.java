package jdbc;

import java.sql.*;

public class course {
	private String course_code;
	private String course_name;
	private int credit_hour;
	private String lect_name;

	public String getCourse_code() {
		return course_code;
	}

	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	
	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	
	public int getCredit_hour() {
		return credit_hour;
	}

	public void setCredit_hour(int credit_hour) {
		this.credit_hour = credit_hour;
	}
	
	public String getLect_name() {
		return lect_name;
	}

	public void setLect_name(String lect_name) {
		this.lect_name = lect_name;
	}
	
	public boolean storeData() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
			String sql = "INSERT INTO course (course_code, course_name, credit_hour, lect_name) VALUES (?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(sql); //include sql query
			statement.setString(1, getCourse_code());
			statement.setString(2, getCourse_name());
			statement.setInt(3, getCredit_hour());
			statement.setString(4, getLect_name());
			statement.executeUpdate();
			statement.close(); //close connection
			con.close();
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean updateData(int courseid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
			String sql = "UPDATE course SET course_code =?, course_name = ?, credit_hour=?, lect_name=?  WHERE courseid=?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, getCourse_code());
			statement.setString(2, getCourse_name());
			statement.setInt(3, getCredit_hour());
			statement.setString(4, getLect_name());
			statement.setInt(5, courseid);
			statement.executeUpdate();
			statement.close();
			con.close();
			return true;
			
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean deleteData(int courseid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
			String sql = "DELETE From course WHERE courseid = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, courseid);
			statement.executeUpdate();
			statement.close();
			con.close();
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

}
