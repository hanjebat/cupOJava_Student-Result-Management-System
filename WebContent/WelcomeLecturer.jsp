<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="jdbc.Login,java.sql.*" %>
<%@ page import="jdbc.LoginBean" %>
<%@ page import="jdbc.Lecturer.*" %>
<%@ include file="header.jsp" %>
<jsp:useBean id="lecturer" class="jdbc.Lecturer" scope="page"/>
<jsp:setProperty name="lecturer" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lecturer Information</title>

</head>

<body>

<center>

<font face="arial" size="3">

Welcome, <jsp:getProperty name="lecturer" property="username"/>!
<br><br>
<h2>eResult Management System</h2><br>
</font>

<table cellpadding="5" cellspacing="5"  border="0" width="60%" bgcolor="#F4F6F7">
<h2>Lecturer Information</h2>
<%
try{
	String username=request.getParameter("username");
	// password=request.getParameter("password");
 	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT", "root", "hannah");  
    String sql = "select * from lecturer where username=?";
    PreparedStatement pstmt=con.prepareStatement(sql); //sql select query 
    pstmt.setString(1,lecturer.getUsername());
    ResultSet rs=pstmt.executeQuery(); 
    if(request.getParameter("username")!=null){
          while(rs.next()){
        	  int id = rs.getInt("lecturer_id");
            %>
			<tr>
            <th bgcolor="#DEB887">Full Name</th><td><%=rs.getString("name")%></td></tr>
            <tr><th bgcolor="#DEB887">Kuliyyah</th><td><%=rs.getString("kuliyyah")%></td></tr>
            <tr><th bgcolor="#DEB887">Phone Number</th><td><%=rs.getInt("phone")%></td></tr>
            <tr><th bgcolor="#DEB887">Username</th><td><%=rs.getString("username")%></td></tr>
            <tr><th bgcolor="#DEB887"> Password</th><td><%=rs.getString("password")%></td></tr>     
            
 			<tr><td></td><td><a href='EditLecturer.jsp?id=<%=id%>'>Edit</a></td></tr> 
            
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
<a href="Lecturer_Main.jsp">Logout</a>

</center>
</body>
</html>
