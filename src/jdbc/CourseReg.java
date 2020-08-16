package jdbc;

import java.sql.*;


public class CourseReg {

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

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

			String sql = "INSERT INTO courseregister (course_code, course_name, credit_hour, lect_name) VALUES (?,?,?,?)";

			PreparedStatement statement = con.prepareStatement(sql); 

			statement.setString(1, getCourse_code());
			statement.setString(2, getCourse_name());
			statement.setInt(3, getCredit_hour());
			statement.setString(4, getLect_name());
			statement.executeUpdate();

			statement.close(); 

			con.close();

			return true;

		}catch(Exception ex) {

			return false;

		}

	}

	

	public boolean updateData(int id) {

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

			String sql = "UPDATE courseregister SET course_code =?, course_name = ?, credit_hour=?, lect_name=?  WHERE courseid=?";

			PreparedStatement statement = con.prepareStatement(sql);

			statement.setString(1, getCourse_code());
			statement.setString(2, getCourse_name());
			statement.setInt(3, getCredit_hour());
			statement.setString(4, getLect_name());
			statement.setInt(5, id);

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

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

			String sql = "DELETE From courseregister WHERE courseid = ?";

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



}
