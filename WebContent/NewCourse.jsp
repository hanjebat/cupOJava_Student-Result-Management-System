<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Course</title>

</head>

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
		<td><input type="text" name="lect_name"/></td>
	  </tr>
	 </table>
	<input type="submit" value="Submit"/>
	</form>
  </div>
</body>
</html>