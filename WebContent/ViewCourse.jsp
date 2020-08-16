<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Course</title>
</head>
<body>
<center><h1>Courses Registered</h1></center>
<%

int count=0;

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

String sql="SELECT * FROM courseregister";

Statement statement = con.createStatement(); 

ResultSet resultSet = statement.executeQuery(sql);

		

while(resultSet.next()){


	int id = resultSet.getInt("courseid");

	String course_code = resultSet.getString("course_code");

	String course_name = resultSet.getString("course_name");

	int credit_hour = resultSet.getInt("credit_hour");

	String lect_name = resultSet.getString("lect_name");

%>
			   <table style="width:40%" align="center">
			   
			    <tr>
			    <th bgcolor="#DEB887">Course ID</th>
			    <td bgcolor="#C0C0C0"><%=id %></td>
			    </tr>
			    
			    <tr>
			    <th bgcolor="#DEB887">Course code</th>
			     <td bgcolor="#C0C0C0"><%=course_code %></td>
			    </tr>
			    
			    <tr>
			     <th bgcolor="#DEB887">Course Name</th>
			     <td bgcolor="#C0C0C0"><%=course_name %></td>
			    </tr>
			    <tr>
			     <th bgcolor="#DEB887">Credit Hour</th>
			     <td bgcolor="#C0C0C0"><%=credit_hour %></td>
			    </tr>
			    <tr>
			     <th bgcolor="#DEB887">Lecturer Name</th>
			     <td bgcolor="#C0C0C0"><%=lect_name %></td>
			    </tr>
			    
			    <tr>
			    <td></td><td>
			    &nbsp;&nbsp;<a href="RemoveCourse?id=<%=id%>">Delete</a></td>
			    </tr>
			    </table>

<%}

statement.close();

con.close();

%>
<br><br>
<center><a href="Welcome.jsp">Back</a>&nbsp;&nbsp;&nbsp;<a href="CourseOffered.jsp">Add</a></center>
<%

String msg = request.getParameter("msg");

if(msg!=null && msg.equals("1")){%>

There is an error! Please check !	

<%	

}

%>


		
</body>
</html>
