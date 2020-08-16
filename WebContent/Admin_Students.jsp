<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
<link rel="stylesheet" type="text/css" href="header.css">
</head>
<body>
<ul>
  	<li><a href="Admin_Course.jsp">Course</a>
	<li><a href="Admin_Students.jsp">Student</a>
	<li><a href="Admin_Lecturer.jsp">Lecturer</a>
</ul>

	<div align=center>
		<h1>List of Students</h1>
	
	<form>
		<table cellspacing="1" cellpadding="1" border="0" width="800" bgcolor="#F4F6F7">
		<colgroup>
       		<col span="1" style="width: 7%;">
       		<col span="1" align="left" style="width: 20%;">
       		<col span="1" style="width: 13%;">
       		<col span="1" style="width: 13%;">
       		<col span="1" style="width: 13%;">
       		<col span="1" style="width: 13%;">
       		<col span="1" style="width: 23%;">
    	</colgroup>
		<tr bgcolor="#4CAF50">
			<td align="center" style="font-size:16px">Id</td>
			<td align="center" style="font-size:16px">Full Name</td>
			<td align="center" style="font-size:16px">Matric No</td>
			<td align="center" style="font-size:16px">Kuliyyah</td>
			<td align="center" style="font-size:16px">Phone</td>
			<td align="center" style="font-size:16px">Username</td>
			<td align="center" style="font-size:16px">Password</td>
		</tr>
<%
int count=0;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
String sql="SELECT * FROM student";
Statement statement = con.createStatement(); //for retrieving data from db
ResultSet resultSet = statement.executeQuery(sql);
		
while(resultSet.next()){
	count++;
	int id = resultSet.getInt("student_id");
	String full_name = resultSet.getString("full_name");
	String matric_no = resultSet.getString("matric_no");
	String kuliyyah= resultSet.getString("kuliyyah");
	String phone = resultSet.getString("phone");
	String username = resultSet.getString("username");
	String password = resultSet.getString("password");
%>
		<tr bgcolor="#FFFFFF">
			<td align="center"><%= id %></td>
			<td align="left"><%= full_name %></td>
			<td align="center"><%= matric_no %></td>
			<td align="center"><%= kuliyyah %></td>
			<td align="center"><%= phone %></td>
			<td align="center"><%= username %></td>
			<td align="center"><%= password %></td>
			<td><a href="EditStudent.jsp?id=<%=id%>">Edit</a></td>
			<td><a href="DeleteStudent?id=<%=id%>">Delete</a></td>
			
		</tr>
<%}
statement.close();
con.close();
%>
		</table>
	</form>
	</div>
<br>
<br>
<div align="center"><form>
<input type="submit" value="New Student" formaction="StudentRegister.jsp"/>
<input type="submit" value="Back to Menu" formaction="Admin_Main.jsp"/>
</form></div>

<%
String msg = request.getParameter("msg");
if(msg!=null && msg.equals("1")){%>
There is an error! Please check !	
<%	
}
%>

</body>
</html>