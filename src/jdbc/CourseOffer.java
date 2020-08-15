package jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class CourseOffer
 */
@WebServlet("/CourseOffer")
public class CourseOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CourseOffer() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String[] values = request.getParameterValues("checkbox");
		
		if(request.getParameter("credit_hour")!=null) {
			
			try {
				PreparedStatement pst=null;
				ResultSet rst=null;
				
				
				String mySubject="";
				
				String course_code = request.getParameter("course_code");

				String course_name = request.getParameter("course_name");

				int credit_hour = Integer.parseInt(request.getParameter("credit_hour"));
				
				String lect_name = request.getParameter("lect_name");
				
				String[] courseCheck= request.getParameterValues("courseCheck");
				
				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

				String sql="INSERT INTO courseregister (course_code, course_name, credit_hour, lect_name) VALUES (?,?,?,?)";

				for(int i =0; i<courseCheck.length; i++) {
					mySubject+=courseCheck[i]+",";
				}		
		
				
				pst.setString(1, mySubject);
				pst.setString(2, course_name);
				pst.setInt(3, credit_hour);
				pst.setString(4, lect_name );
				
				pst.execute();
				
				pst.close(); //close connection

				con.close();

				
				System.out.println("Courses taken successfully inserted");
				
				RequestDispatcher rd = request.getRequestDispatcher("CourseOffered.jsp");

				rd.forward(request, response);
				
				
			}
			catch(Exception e) {
				System.out.println(e);
				System.out.println("Failed!");
			}
				
		}
	}

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


}
s
