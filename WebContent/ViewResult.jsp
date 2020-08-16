<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
<center><h1>Result</h1></center>
<%

int count=0;

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");

String sql="SELECT * FROM result";

Statement statement = con.createStatement(); 

ResultSet resultSet = statement.executeQuery(sql);

		

while(resultSet.next()){


	int id = resultSet.getInt("student_id");
	
	String course_name = resultSet.getString("course_name");

	String course_code = resultSet.getString("course_code");

	String grade = resultSet.getString("grade");

	double result = resultSet.getDouble("calculate_cgpa");

%>
			   <table style="width:40%" align="center">
			   
			    <tr>
			    <th bgcolor="#DEB887">Course ID</th>
			    <td bgcolor="#C0C0C0"><%=id %></td>
			    </tr>
			    
			    <tr>
			     <th bgcolor="#DEB887">Course Name</th>
			     <td bgcolor="#C0C0C0"><%=course_name %></td>
			    </tr>
			    
			    <tr>
			    <th bgcolor="#DEB887">Course code</th>
			     <td bgcolor="#C0C0C0"><%=course_code %></td>
			    </tr>
			    
			    
			    <tr>
			     <th bgcolor="#DEB887">Grade</th>
			     <td bgcolor="#C0C0C0"><%=grade %></td>
			    </tr>
			    <tr>
			     <th bgcolor="#DEB887">GPA</th>
			     <td bgcolor="#C0C0C0"><%=result %></td>
			    </tr>
			    
			    </table>

<%}

statement.close();

con.close();

%>
<div style="text-align:center"><a href="Welcome.jsp"/>Back</a></div>
<br>
<div style="text-align:center"><input type="submit" value="Print" onClick="window.print()" style="width:100px; margin:0 auto"/></div>
<%

String msg = request.getParameter("msg");

if(msg!=null && msg.equals("1")){%>

There is an error! Please check !	

<%	

}

%>


		
</body>
</html>
