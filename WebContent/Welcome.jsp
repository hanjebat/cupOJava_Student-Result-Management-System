<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="jdbc.Login" %>
<%@ page import="jdbc.LoginBean" %>
<%@ page import="jdbc.Student.*" %>
<%@ include file="header.jsp" %>
<jsp:useBean id="student" class="jdbc.Student" scope="page"/>
<jsp:setProperty name="student" property="*"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<style>

.button {

	font: arial;

	background-color: #4CAF50;

	font-size: 14px;

	border-radius: 10px;

	width: 150px;

	transition-duration: 0.4s;

	padding: 10px 20px;

}



.button:hover{

	background-color: black;

	color: white;

}



* {

  box-sizing: border-box;

  font-family: Arial, Helvetica, sans-serif;

}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Student Information</title>

</head>

<body>

<center>

<font face="arial" size="3">


<h2>eResult Management System</h2><br>
</font>

<table cellpadding="5" cellspacing="5"  border="0" width="60%" bgcolor="#F4F6F7">

<h2>Student Main Page</h2>

<form>
		<div align="center">
			
			
			<input type="submit" class="button" name="student" value="Student Information" formaction="Welcome.jsp"/>


			<input type="submit" class="button" value="Course" formaction="CourseOffered.jsp"/>

			

			<input type="submit" class="button" value="Result" formaction="ViewResult.jsp"/>
			
			
			
			<input type="submit" class="button" value="Logout" formaction="main.jsp"/>

		</div>
	</form>
	<br><br>

<%
int count=0;
String username = request.getParameter("username");

Class.forName("com.mysql.cj.jdbc.Driver");



Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");



String sql = "select * from student where username=?";
PreparedStatement statement = con.prepareStatement(sql);
statement.setString(1,student.getUsername());

ResultSet rs = statement.executeQuery();

if(request.getParameter("username")!=null){

		
while(rs.next()){

            %>
            
			
			<tr>

            <th bgcolor="#DEB887">Full Name</th><td><%=rs.getString("full_name")%></td></tr>
            <tr><th bgcolor="#DEB887">Matric Number<td><%=rs.getString("matric_no")%></td></th></tr>
            <tr><th bgcolor="#DEB887">Kuliyyah</th><td><%=rs.getString("kuliyyah")%></td></tr>
            <tr><th bgcolor="#DEB887">Phone Number</th><td><%=rs.getString("phone")%></td></tr>
            <tr><th bgcolor="#DEB887">Username</th><td><%=rs.getString("username")%></td></tr>
            <tr><th bgcolor="#DEB887"> Password</th><td><%=rs.getString("password")%></td></tr>     
            
            <tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<a href='editForm.jsp?username=<%=rs.getString("username")%>'>Edit</a>
			</td></tr> 
<%



          } statement.close();
		
          con.close();

    	}

                    else

          {

                       System.out.println("No data found!");

          }
%>
</table>

<br><br>


</center>

<%

String msg = request.getParameter("msg");

if(msg!=null && msg.equals("1")){
%>

There is an error! Please check !	

<%
}

%>
</body>
</html>

