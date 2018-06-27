<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.User"%>
<%
	List<User> users = (List<User>) request.getAttribute("users");
	User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Add User</title>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<link rel="icon" type="image/png" href="indiceBlack.png" />
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
</head>
<body>
	<div class="main">
		<nav class="nav">
		<ul>
			<li><a href="/users/logout">Logout</a></li>
			<li><a href="/users/login">My account</a></li>
			<li><a href="/messages">Messages</a></li>
			<li><a href="/access">Access</a></li>
			<li><a href="/resources">Resources</a></li>
			<li><a href="/roles">Roles</a></li>
			<li><a href="/users">Users</a></li>
			<li><a href="/index.html">Home</a></li>
			<li><a href="/users">Back</a></li>
		</ul>
		</nav>
		<div class="form">
			<center>
				<img src="../user.png" />
				<h3>New Message</h3>
			</center>
			<form action="/messages/add" method="post">
				<p>Name:</p>
				<input type="hidden" name="idUser" value="<%=user.getId()%>">
				<input type="text" name="emailUser" value="<%=user.getEmail()%>"
					disabled> <br> <br>
				<p>Email receiver:</p>
				<select name="idReceiver">
					<%
						for (int i = 0; i < users.size(); i++) {
							User u = users.get(i);
							if (!u.getEmail().equals(user.getEmail())) {
					%>
					<option value="<%=u.getId()%>"><%=u.getEmail()%></option>
					<%
						}
						}
					%>
				</select><br>
				<p>Affair:</p>
				<input type="text" name="affair" id="text" onkeyup="validar()"
					required> <br> <br>
				<p>Message:</p>
				<input type="text" name="message" id="text2" onkeyup="validar()2"
					required> <br> <br>
				<center>
					<input type="submit" id="submit" value="Send">
				</center>
			</form>
		</div>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="../motor.js"></script>
	</div>
</body>
</html>