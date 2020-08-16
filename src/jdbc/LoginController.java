package jdbc;

import jdbc.Login;
import jdbc.LoginBean;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control","no-cache"); 

		response.setHeader("Cache-Control","no-store"); 

		response.setDateHeader("Expires", 0); 

		response.setHeader("Pragma","no-cache");
		
		if(request.getParameter("login")!=null) //check button click event not null from login.jsp page button
        {
            String username=request.getParameter("username"); //get textbox name "username"
            String password=request.getParameter("password"); //get textbox name "password"
            
            LoginBean loginBean=new LoginBean();  
            
            loginBean.setUsername(username); //set username through loginBean object
            loginBean.setPassword(password); //set password through loginBean object
            
            Login login=new Login(); //this class contain main logic to perform function calling and database operation
            
            boolean authorize=login.authorizeLogin(loginBean); //send loginBean object values into authorizeLogin() function in LoginDao class
            
            if(authorize==true) //check calling authorizeLogin() function receive string "SUCCESS LOGIN" message after continue process
            {
                HttpSession session=request.getSession(); //session is created
                session.setAttribute("Sign in",loginBean.getUsername()); 
                RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp"); //redirect to welcome.jsp page
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("WrongLoginMsg",authorize); //wrong login error message is "WrongLoginMsg"
                RequestDispatcher rd=request.getRequestDispatcher("LoginValidate.jsp?error=1"); //redirect to welcome.jsp page
                rd.forward(request, response);
            }
        }else{

	           // if login and password contain null or empty values.

		       RequestDispatcher dispatch = request.getRequestDispatcher("LoginValidate.jsp?error=2");  

	           dispatch.forward(request, response);  

	         } 
    }


	}
