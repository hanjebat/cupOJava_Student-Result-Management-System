<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Course</title>
</head>

<%
int count=0;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
String sql="SELECT full_name FROM lecturer"; //retrieve lect full_name for dropdown in the form
Statement statement = con.createStatement(); //for retrieving data from db
ResultSet resultSet = statement.executeQuery(sql);
%>

<body>
  <div align=center>
	<h1>Course Registration</h1>
	<form method="post" action="CourseController">
	 <table>
	  <tr>
	  	<td>Course Code: </td>
		<td><input type="text" name="course_code"/></td>
	  </tr>
	  <tr>
	  	<td>Course Name: </td>
		<td><input type="text" name="course_name"/></td>
	  </tr>
	  <tr>
	  	<td>Credit Hour: </td>
		<td><input type="text" name="credit_hour"/></td>
	  </tr>
	  <tr>
	  	<td>Lecturer: </td>
		<td><select>
		<% while(resultSet.next()){
			String fname = resultSet.getString("full_name");
		%>
		<option value="<%=fname %>"><%=fname%></option>
		<%} %>
		</select></td>
	  </tr>
	 </table>
	<input type="submit" value="Submit"/>
	</form>
  </div>
</body>
</html>