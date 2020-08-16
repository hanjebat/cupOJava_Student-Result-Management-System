package jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/LectController")
public class LectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    

    public LectController() {

        super();


    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 
	     String name = request.getParameter("name");
	     int matric = Integer.parseInt(request.getParameter("staffno"));
	     String kuliyyah = request.getParameter("kuliyyah");
	     int phone = Integer.parseInt(request.getParameter("phone"));
	     String username = request.getParameter("username");
	     String password = request.getParameter("password");


		if(name != null && request.getParameter("staffno") != null && kuliyyah != null && request.getParameter("phone") != null && username != null && password != null) {

			Lecturer lecturer = new Lecturer();

			lecturer.setName(name);
			lecturer.setStaffNo(staffno);
			lecturer.setKuliyyah(kuliyyah);
			lecturer.setPhone(phone);
			lecturer.setUsername(username);
			lecturer.setPassword(password);

			

			if(request.getParameter("id")!= null && !request.getParameter("id").isEmpty()) {

				int lect_id = Integer.parseInt(request.getParameter("id"));

				

				if(lecturer.updateData(lect_id)==true) {

					RequestDispatcher rd = request.getRequestDispatcher("WelcomeLect.jsp");

					rd.forward(request, response);

				}else {

					RequestDispatcher rd = request.getRequestDispatcher("editForm.jsp");

					rd.forward(request, response);


				}

			

			}else {

				if(lecturer.storeData()==true) {

					RequestDispatcher rd = request.getRequestDispatcher("LecturerDetails.jsp");

					rd.forward(request, response);

				}else {

					System.out.println("Data is not found!");

				}			

			}

		}

	}



}