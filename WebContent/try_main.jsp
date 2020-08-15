<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
</head>
<body>

	
<table cellspacing="1" cellpadding="1" border="0" width="300" bgcolor="#F4F6F7">
<tr bgcolor="#EEEEEE">
<td align="center">No</td>
<td align="center">Course Code</td>
<td align="center">Course Name</td>
<td> </td>
<td></td>
</tr>
<% 
           String sql = "";
           int count = 0;
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eresult?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","hannah");
           sql="SELECT * FROM course";
           Statement statement = con.createStatement();                
           ResultSet resultSet = statement.executeQuery(sql);
           
           while (resultSet.next()){
        	   count++;
        
        	 int id = resultSet.getInt("courseid");
        	 String code = resultSet.getString("course_code");
        	 String coursename = resultSet.getString("course_name");
%>
<tr bgcolor="#FFFFFF">
<td align="center"><%= count %></td>
<td align="center"><%= code %></td>
<td align="center">&nbsp;&nbsp;<%= coursename %></td>
<td><a href="editCourse.jsp?id=<%=id%>">Edit</a></td>
<td><a href="Delete?id=<%=id%>">Delete</a></td>

</tr>
<% 	 
           }
           statement.close();
           con.close();
        
    
 %>
 
 
 
 </table>


<br><br>


<a href="newCourse.jsp">Add New Course</a>


<%
String msg = request.getParameter("msg");
if(msg!=null && msg.equals("1")){%>
There is an error! Please check !	
<%	
}
%>
</body>
</html>