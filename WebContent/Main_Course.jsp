<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>
</head>
<body>
	<div align=center>
		<h1>Course Details</h1>
	
	<form>
		<table cellspacing="1" cellpadding="1" border="0" width="600" bgcolor="#F4F6F7">
		<colgroup>
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" align="left" style="width: 30%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" align="left" style="width: 30%;">
    	</colgroup>
		<tr bgcolor="#EEEEEE">
			<td align="center">Course Id</td>
			<td align="center">Course Code</td>
			<td align="center">Course Name</td>
			<td align="center">Credit Hour</td>
			<td align="center">Lecturer</td>
		</tr>
<%
int count=0;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
String sql="SELECT * FROM course";
Statement statement = con.createStatement(); //for retrieving data from db
ResultSet resultSet = statement.executeQuery(sql);
		
while(resultSet.next()){
	count++;
	int courseid = resultSet.getInt("courseid");
	String course_code = resultSet.getString("course_code");
	String course_name = resultSet.getString("course_name");
	int credit_hour = resultSet.getInt("credit_hour");
	String lect_name = resultSet.getString("lect_name");
%>
		<tr bgcolor="#FFFFFF">
			<td align="center"><%= courseid %></td>
			<td align="center"><%= course_code %></td>
			<td align="center"><%= course_name %></td>
			<td align="center"><%= credit_hour %></td>
			<td align="center"><%= lect_name %></td>
			<td><a href="EditCourse.jsp?id=<%=courseid%>">Edit</a></td>
			<td><a href="DeleteCourse?id=<%=courseid%>">Delete</a></td>
			
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
<input type="submit" value="New Course" formaction="NewCourse.jsp"/>
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