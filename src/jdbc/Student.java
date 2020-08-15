package jdbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Student {

	private int matric;
	private String name;
	private String username;
	private String password;
	private String kuliyyah;
	private int phone;

	public int getMatric() {
		return matric;
	}
	public void setMatric(int matric) {
		this.matric = matric;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

	           sql="INSERT INTO student(full_name, matric_no, kuliyyah, phone, username, password) VALUES (?,?,?,?,?,?)";

	           PreparedStatement statement = con.prepareStatement(sql);      
	           
	           statement.setString(1, getName());
	           statement.setInt(2, getMatric());
	           statement.setString(3, getKuliyyah());
	           statement.setInt(4, getPhone());
	           statement.setString(5, getUsername());
	           statement.setString(6, getPassword());

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

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?autoReconnect=true&useSSL=false","root"," ");

	           sql="DELETE FROM student WHERE student_id = ?";

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

	           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

	           sql="UPDATE student SET full_name=?, matric_no=?, kuliyyah=?, phone=?, username=?, password=? WHERE student_id = ?";

	           PreparedStatement statement = con.prepareStatement(sql);                

	           statement.setString(1, getName());
	           statement.setInt(2, getMatric());
	           statement.setString(3, getKuliyyah());
	           statement.setInt(4, getPhone());
	           statement.setString(5, getUsername());
	           statement.setString(6, getPassword());
	           statement.setInt(7, id);

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

