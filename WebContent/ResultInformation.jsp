<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="header.css">
<meta charset="ISO-8859-1">
<title>Lecturer Details</title>
</head>
<body>
	<div align=center>
		<h1>Lecturer Information</h1>
	
	<form>
		<table cellspacing="1" cellpadding="1" border="0" width="800" bgcolor="#F4F6F7">
		<colgroup>
       		<col span="1" style="width: 10%;">
       		<col span="1" align="left" style="width: 30%;">
       		<col span="1" style="width: 15%;">
       		<col span="1" style="width: 15%;">
       		<col span="1" style="width: 15%;">
       		<col span="1" style="width: 15%;">
    	</colgroup>
		<tr bgcolor="#4CAF50">
			<td align="center">Id</td>
			<td align="center">Total CGPA</td>
			<td align="center">Total Credit Hour</td>
		</tr>
<%
int count=0;
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","SatAfiqah!1997!");
String sql="SELECT * FROM result";
Statement statement = con.createStatement(); //for retrieving data from db
ResultSet resultSet = statement.executeQuery(sql);
		
while(resultSet.next()){
	count++;
	int id = resultSet.getInt("student_id");
	String name = resultSet.getString("total_cgpa");
	String kuliyyah= resultSet.getString("total_chr");
%>
		<tr bgcolor="#FFFFFF">
			<td align="center"><%= id %></td>
			<td align="left"><%= Total_cgpa %></td>
			<td align="center"><%= Total_chr %></td>
			<td><a href="EditLecturer.jsp?id=<%=id%>">Edit</a></td>
			
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
<input type="submit" value="Edit Result" formaction=EditResult.jsp"/>
<input type="submit" value="Back to Menu" formaction="WelcomeLect.jsp"/>
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