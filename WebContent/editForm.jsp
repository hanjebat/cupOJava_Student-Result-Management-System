<%@ page session="true" %>

<%@ page import="jdbc.Login" %>

<%@ page import="java.sql.*" %>>

<%@ page import="jdbc.Student.*" %>

<%@ include file="header.jsp" %>

<jsp:useBean id="student" class="jdbc.Student" scope="page"/>

<jsp:setProperty name="student" property="*"/>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>



<head>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<title>Update Student Information</title>



</head>



<body>



<center>



<font face="arial" size="3">



Welcome, <jsp:getProperty name="student" property="username"/>!

<br><br>



<h2>eResult Management System</h2><br>



</font>



<h2>Update Student Information</h2>



<form method="post" name="myform" action="UpdateData">



<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>



<table cellpadding="5" cellspacing="5"  border="0" width="60%" bgcolor="#F4F6F7">





<%





String username = request.getParameter("username");



Class.forName("com.mysql.cj.jdbc.Driver");



Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");



String sql = "select * from student where username='"+username+"'";



PreparedStatement statement = con.prepareStatement(sql);



ResultSet res = statement.executeQuery();



while(res.next()){



%>

			<tr>



            <th bgcolor="#DEB887">Full Name</th>

            <td><input type="text" name="name" value='<%= res.getString("full_name")%>'/></td></tr>

            <tr><th bgcolor="#DEB887">Matric Number

            <td><input type="number" name="matric" value='<%= res.getString("matric_no")%>'></td></th></tr>

            <tr><th bgcolor="#DEB887">Kuliyyah</th>

            <td><input type="text" name="kuliyyah" value='<%= res.getString("kuliyyah")%>'/></td></tr>

            <tr><th bgcolor="#DEB887">Phone Number</th>

            <td><input type="number" name="kuliyyah" value='<%= res.getString("phone")%>'/></td></tr>

            <tr><th bgcolor="#DEB887">Username</th>

            <td><input type="text" name="username" value='<%= res.getString("username")%>'/></td></tr>

            <tr><th bgcolor="#DEB887"> Password</th>

            <td><input type="password" name="password" value='<%= res.getString("password")%>'/></td></tr>     

         



			<tr><td></td><td><input type="submit" value="Submit"/></td></tr> 

			<%} 



	statement.close();



	con.close();%>

	

</table>

</form>



<br><br>

			<a href="main.jsp">Logout</a></center>

	

</body>



</html>
