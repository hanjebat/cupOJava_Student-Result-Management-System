package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Lecturer {
	
	private String name;
	private int staffno;
	private String username;
	private String password;
	private String kuliyyah;
	private int phone;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStaffno() {
		return staffno;
	}
	public void setStaffno(int staffno) {
		this.staffno = staffno;
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
	public String getKuliyyah() {
		return kuliyyah;
	}
	public void setKuliyyah(String kuliyyah) {
		this.kuliyyah = kuliyyah;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
	public boolean storeData(){

		 try

	        {

	           String sql = "";

	           Class.forName("com.mysql.jdbc.Driver");

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","SatAfiqah!1997!");

	           sql="INSERT INTO lecturer(full_name, kuliyyah, phone, username, password,) VALUES (?,?,?,?,?)";

	           PreparedStatement statement = con.prepareStatement(sql);      
	           
	           statement.setString(1, getName());
	           statement.setString(2, getKuliyyah());
	           statement.setInt(3, getPhone());
	           statement.setString(4, getUsername());
	           statement.setString(5, getPassword());
	        

	           statement.executeUpdate();

	           statement.close();

	           con.close();

	           return true;    

	        }

	        catch(Exception ex)

	        {

	        	return false;

	        }   

	}

	

	public boolean deleteData(int id){

		 try

	        {

	           String sql = "";

	           Class.forName("com.mysql.jdbc.Driver");

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?autoReconnect=true&useSSL=false","root","SatAfiqah!1997!");

	           sql="DELETE FROM lecture WHERE lecture_id = ?";

	           PreparedStatement statement = con.prepareStatement(sql);                

	           statement.setInt(1, id);

	           statement.executeUpdate();

	           statement.close();

	           con.close();

	           return true;    

	        }

	        catch(Exception ex)

	        {

	        	return false;

	        }   

	}

	

	public boolean updateData(int id){

		 try

	        {

	           String sql = "";

	           Class.forName("com.mysql.jdbc.Driver");

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","SatAFiqah!1997!");

	           sql="UPDATE lecturer SET full_name=?, kuliyyah=?, phone=?, username=?, password=? WHERE lecturer_id = ?";

	           PreparedStatement statement = con.prepareStatement(sql);                

	           statement.setString(1, getName());
	           statement.setString(2, getKuliyyah());
	           statement.setInt(3, getPhone());
	           statement.setString(4, getUsername());
	           statement.setString(5, getPassword());
	           statement.setInt(6, id);

	           statement.executeUpdate();
			   statement.close();

				con.close();

				return true;

	        }

	        catch(Exception ex)

	        {

	        	return false;

	        }   

	}
	


	}

