package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateData
 */
@WebServlet("/UpdateData")
public class UpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateData() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		 try

	        {
			 
		     String name = request.getParameter("name");	     
		     String kuliyyah = request.getParameter("kuliyyah");	     
		     String username = request.getParameter("username");
		     String password = request.getParameter("password");

			    String sql = "";

	            Class.forName("com.mysql.jdbc.Driver");

	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

	            sql="UPDATE student SET full_name=?, matric_no=?, kuliyyah=?, phone=?, username=?, password=? WHERE username=? AND password=?";

	            PreparedStatement statement = con.prepareStatement(sql);                

	           
			  
			 if(name != null && request.getParameter("matric") != null && kuliyyah != null && request.getParameter("phone") != null && username != null && password != null) 
	           {
        	   
	        	int matric=Integer.parseInt(request.getParameter("matric"));
	   			int phone=Integer.parseInt(request.getParameter("phone"));
	   			
	   			
	           
		           statement.setString(1, name);
		           statement.setInt(2, matric);
		           statement.setString(3, kuliyyah);
		           statement.setInt(4, phone);
		           statement.setString(5, username);
		           statement.setString(6, password);
		           statement.setString(7, username);
		           statement.setString(8, password);
		     
					
					statement.executeUpdate();

					statement.close();

					con.close();

					
	           }System.out.print("Successfully updated");
				RequestDispatcher rd = request.getRequestDispatcher("editForm.jsp");
				rd.forward(request, response);


	        }

	        catch(Exception ex)

	        {

	        	System.out.println(ex);

	        }   
			
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				doPost(request,response);

	}

	
}
