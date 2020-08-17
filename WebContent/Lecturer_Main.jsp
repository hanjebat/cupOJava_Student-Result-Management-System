<!-- set the session to true -->

<%@ page session="true" %>



<!-- repeating set Header --> 

<%@ include file="header.jsp" %>



<!-- remove and destroy any contents in session -->

<%
session.removeAttribute("bean");
session.invalidate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="loginStyle.css">

<title>Login</title>

</head>

<body>

<h1>eResult Management System</h1>

<form method = "post" action="LoginControllerLecturer">


<div class="login-box">
	      <h2>Login</h2>
	      <div class="textbox">
	        <i class="fa fa-user" aria-hidden="true"></i>
	        <input type="text" placeholder="Student Username" name="username" required="">
	      </div>	
	      <div class="textbox">
	        <i class="fa fa-lock" aria-hidden="true"></i>
	        <input type="password" placeholder="Password" name="password" required="">
	      </div>
	
	    <input class="btn" type="submit" name="login" value="Sign in">
	    
<a href="LectRegister.jsp">Register</a>

<font color="red">



<!-- Unauthorized User -->

<%
String error = request.getParameter("error");
if(error != null && error.equals("1")){
%>

Invalid Username and Password!



<!-- both login and password are empty. -->

<%
}
else if(error != null && error.equals("2")){
%>

Empty Username and Password!

<%
}
%>
</font>
</div>

</form>
</body>
</html>