<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
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

input[type=password], select {
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
<meta charset="UTF-8">
<title>Edit Course</title>
</head>
<body>
<form method="post" action="CourseController">
<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
	String sql = "SELECT * From course WHERE courseid =?";
	PreparedStatement statement = con.prepareStatement(sql);
	statement.setInt(1,id);
	ResultSet resultset = statement.executeQuery();
	while(resultset.next()){
%>
  <div align=center>
	<h1>Edit Course</h1>
	 <table>
	  <tr>
	  	<td>Course Code: </td>
		<td><input type="text" name="course_code" value="<%=resultset.getString("course_code") %>"/></td>
	  </tr>
	  <tr>
	  	<td>Course Name: </td>
		<td><input type="text" name="course_name" value="<%=resultset.getString("course_name")%>"/></td>
	  </tr>
	  <tr>
	  	<td>Credit Hour: </td>
		<td><input type="text" name="credit_hour" value="<%=resultset.getString("credit_hour")%>"/></td>
	  </tr>
	  <tr>
	  	<td>Lecturer: </td>
		<td><input type="text" name="lect_name" value="<%=resultset.getString("lect_name")%>"/></td>
	  </tr>
	 </table>
	<input type="submit" value="Submit"/>
  </div>
<%} 
	statement.close();
	con.close();%>
</form>
</body>
</html>
