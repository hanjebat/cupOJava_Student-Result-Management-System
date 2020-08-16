package jdbc;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/RemoveCourse")

public class RemoveCourse extends HttpServlet {

	private static final long serialVersionUID = 1L;

      
    public RemoveCourse() {

        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int courseid = Integer.parseInt(request.getParameter("id"));
		

		CourseReg course = new CourseReg();

		
		if(course.deleteData(courseid)==true) {

			RequestDispatcher rd = request.getRequestDispatcher("ViewCourse.jsp");

			rd.forward(request, response);

		}else {

			RequestDispatcher rd = request.getRequestDispatcher("ViewCourse.jsp?msg=1");

			rd.forward(request, response);

		}

	}

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);

	}

}
