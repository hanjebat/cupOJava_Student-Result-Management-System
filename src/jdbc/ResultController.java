package jdbc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResultController
 */
@WebServlet("/ResultController")
public class ResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		double total_cgpa = Double.parseDouble(request.getParameter("total_cgpa"));
		int total_chr = Integer.parseInt(request.getParameter("total_chr"));
		
		if( request.getParameter("total_cgpa") != null && request.getParameter("total_chr") != null) {
			
			result result = new result();
			
			result.setTotal_cgpa(total_cgpa);
			result.setTotal_chr(total_chr);

			if(request.getParameter("id")!= null && !request.getParameter("id").isEmpty()) {
				
				int id = Integer.parseInt(request.getParameter("id"));

				if(result.updateData(id)==true) {
					RequestDispatcher rd = request.getRequestDispatcher("WelcomeLect.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("EditResult.jsp");
					rd.forward(request, response);
				}
			}
			else {
			if(result.storeData()==true) {
				RequestDispatcher rd = request.getRequestDispatcher("Welcome_Lect.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("EditResult.jsp");
				rd.forward(request, response);
			}
		}
	}
}
}