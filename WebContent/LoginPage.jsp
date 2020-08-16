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

<form method="post">

<div class="login-box">
	      <h2>Login</h2>
		<input class="btn" type="submit" name="login" value="Login as Student" formaction="LoginController"><br>
		<input class="btn" type="submit" name="login" value="Login as Lecturer" formaction="LectLoginController"><br>
		<input class="btn" type="submit" name="login" value="Login as Admin" formaction="AdminLoginController">
</div>

</form>
</body>
</html>
