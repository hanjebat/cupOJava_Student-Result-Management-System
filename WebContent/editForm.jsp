<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Course</title>
</head>
<body>
  <div align="center">

<form method="post" action="StudentController">
<input type="hidden" name="id" value="<%=request.getParameter("id") %>"/>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root"," ");
	String sql = "SELECT * From student WHERE student_id=?";
	PreparedStatement statement = con.prepareStatement(sql);
	statement.setInt(1,id);
	ResultSet resultset = statement.executeQuery();
	while(resultset.next()){
%>
  <h1>Update Student Information</h1>
   <table style="with: 80%">
    
    <tr>
     <td>Full Name</td>
     <td><input type="text" name="name" value="<%= resultset.getString("full_name")%>"/></td>
    </tr>
    
    <tr>
     <td>Matric No</td>
     <td><input type="text" name="matric" value="<%= resultset.getString("matric_no")%>"/></td>
    </tr>
    
     <tr>
     <td>Kuliyyah</td>
     <td><input type="text" name="kuliyyah" value="<%= resultset.getString("kuliyyah")%>"/></td>
     </tr>
     
     <tr>
     <td>Phone Number</td>
     <td><input type="number" name="phone" value="<%= resultset.getString("phone")%>"/></td>
     </tr>
    
     <tr>
     <td>Username</td>
     <td><input type="text" name="username" value="<%= resultset.getString("username")%>"/></td>
     </tr>
     
     <tr>
     <td>Password</td>
     <td><input type="password" name="password" value="<%= resultset.getString("password")%>"/></td>
     </tr>

    
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>

<%} 
	statement.close();
	con.close();%>
</body>
</html>
