<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Course</title>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 30%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>
  <div align=center>
	<h1>Add New Course</h1>
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
