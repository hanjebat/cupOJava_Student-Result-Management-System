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
@WebServlet("/LecturerController")
public class LecturerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LecturerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String kuliyyah = request.getParameter("kuliyyah");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(name != null && kuliyyah != null && request.getParameter("phone") != null && username != null && password != null) {
			
			Lecturer lecturer = new Lecturer();
			
			lecturer.setName(name);
			lecturer.setKuliyyah(kuliyyah);
			lecturer.setPhone(phone);
			lecturer.setUsername(username);
			lecturer.setPassword(password);


			if(request.getParameter("id")!= null && !request.getParameter("id").isEmpty()) {
				
				int id = Integer.parseInt(request.getParameter("id"));

				if(lecturer.updateData(id)==true) {
					RequestDispatcher rd = request.getRequestDispatcher("Admin_Lecturer.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("EditLecturer.jsp");
					rd.forward(request, response);
				}
			}
			else {
			if(lecturer.storeData()==true) {
				RequestDispatcher rd = request.getRequestDispatcher("Admin_Lecturer.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("LectRegister.jsp");
				rd.forward(request, response);
			}
		}
	}
}
}
