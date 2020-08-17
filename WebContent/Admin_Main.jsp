<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="jdbc.Login,java.sql.*"
    session="true"%>

<!DOCTYPE html>
<html>
<head>
<style>
.button {
	font: bebas;
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
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="header.css">
<title>Admin Main Page</title>
</head>
<body>
<h2 align="center">Admin Main Page</h2>
<h3 align="center">Welcome to Admin Page</h3>
	<form>
		<div align="center">
			<input type="submit" class="button" value="Course" formaction="Admin_Course.jsp"/>
			<br><br>
			<input type="submit" class="button" value="Student" formaction="Admin_Students.jsp"/>
			<br><br>
			<input type="submit" class="button" value="Lecturer" formaction="Admin_Lecturer.jsp"/>
			<br><br>
			<input type="submit" class="button" value="Logout" formaction="AdminLoginPage.jsp"/>
		</div>
	</form>
</body>
</html>
