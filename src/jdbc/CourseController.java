package jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseController
 */
@WebServlet("/CourseController")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String course_code = request.getParameter("course_code");
		String course_name = request.getParameter("course_name");
		int credit_hour = Integer.parseInt(request.getParameter("credit_hour"));
		String lect_name = request.getParameter("lect_name");
		
		if(course_code != null && course_name != null && request.getParameter("credit_hour") != null && lect_name != null) {
			
			course course = new course();
			
			course.setCourse_code(course_code);
			course.setCourse_name(course_name);
			course.setCredit_hour(credit_hour);
			course.setLect_name(lect_name);
			
			if(request.getParameter("id")!= null && !request.getParameter("id").isEmpty()) {
				
				int courseid = Integer.parseInt(request.getParameter("id"));
				
				if(course.updateData(courseid)==true) {
					RequestDispatcher rd = request.getRequestDispatcher("Main_Course.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("EditCourse.jsp");
					rd.forward(request, response);
				}
			}
			else {
			if(course.storeData()==true) {
				RequestDispatcher rd = request.getRequestDispatcher("Main_Course.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("NewCourse.jsp");
				rd.forward(request, response);
			}
		}
	}
}
}
