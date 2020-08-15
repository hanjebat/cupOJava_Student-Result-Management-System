<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="jdbc.Login,java.sql.*" %>
<%@ page import="jdbc.LoginBean" %>
<%@ page import="jdbc.Student.*" %>
<%@ include file="header.jsp" %>
<jsp:useBean id="student" class="jdbc.Student" scope="page"/>
<jsp:setProperty name="student" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Student Information</title>

</head>

<body>

<center>

<font face="arial" size="3">

Welcome, <jsp:getProperty name="student" property="username"/>!
<br><br>
<h2>eResult Management System</h2><br>
</font>

<table cellpadding="5" cellspacing="5"  border="0" width="60%" bgcolor="#F4F6F7">
<h2>Student Information</h2>
<%
try{
String username=request.getParameter("username");
String password=request.getParameter("password");
 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT", "root", " ");  
    PreparedStatement pstmt=null; //create statement
    
    pstmt=con.prepareStatement("select * from student where username='"+username+"' and password='"+password+"'"); //sql select query 
    
    ResultSet rs=pstmt.executeQuery(); 
    if(request.getParameter("login")!=null){
          while(rs.next()){

            %>
            

			<tr>

            <th bgcolor="#DEB887">Full Name</th><td><%=rs.getString("full_name")%></td></tr>
            <tr><th bgcolor="#DEB887">Matric Number<td><%=rs.getInt("matric_no")%></td></th></tr>
            <tr><th bgcolor="#DEB887">Kuliyyah</th><td><%=rs.getString("kuliyyah")%></td></tr>
            <tr><th bgcolor="#DEB887">Phone Number</th><td><%=rs.getInt("phone")%></td></tr>
            <tr><th bgcolor="#DEB887">Username</th><td><%=rs.getString("username")%></td></tr>
            <tr><th bgcolor="#DEB887"> Password</th><td><%=rs.getString("password")%></td></tr>     
            
            <tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<a href='editForm.jsp?username=<%=rs.getString("username")%>'>Edit</a>
	    </td></tr> 
            <%

          } pstmt.close();

          con.close();

    	}
                    else
          {
                       System.out.println("No data found!");
          }
}

	catch(Exception e){
    System.out.println(e);
}
%>
</table>

<br><br>
<a href="main.jsp">Logout</a>

</center>
</body>
</html>

