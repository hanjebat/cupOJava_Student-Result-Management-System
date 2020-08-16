package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class Login
{
    public boolean authorizeLogin(LoginBean loginBean) //create authorizeLogin()function
    {
        String username=loginBean.getUsername(); //get username value through loginBean object and store in temporary variable "username"
        String password=loginBean.getPassword(); //get password value through loginBean object and store in temporary variable "password"
        
        String dbusername="";  //create two variable for use next process
        String dbpassword="";
        
        String url="jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT";
        String uname="root"; //database username
        String pass=" "; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,uname,pass); //create connection
            
            PreparedStatement ps=null; //create statement
            
            ps=con.prepareStatement("select * from student where username=? and password=?"); //sql select query 
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery(); //execute query and set in Resultset object rs.
             
            while(rs.next())
            {    
                dbusername=rs.getString("username");   //fetchable database record username and password store in this two variable dbusername,dbpassword above created 
                dbpassword=rs.getString("password"); 
                
                if(username.equals(dbusername) && password.equals(dbpassword))  
                {
                    return true; //if valid condition return string "SUCCESS LOGIN" 
                }
            } 
           
            ps.close(); //close statement
            
            con.close(); //close connection
           
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return false; //if invalid condition return string "WRONG USERNAME AND PASSWORD"
    }
}
