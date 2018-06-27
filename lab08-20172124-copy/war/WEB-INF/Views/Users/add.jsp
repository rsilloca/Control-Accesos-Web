<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.Role"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
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

			<%
				if (roles.size() > 0) {
			%>
			<center>
				<img src="../user.png" />
				<h3>Add user</h3>
			</center>
			<form action="/users/add" method="post">
				<p>Name:</p>
				<input type="text" name="name" id="text" onkeyup="validar()" required> <br> <br>
				<p>Surname:</p>
				<input type="text" name="surname" id="text2" onkeyup="validar2()" required> <br> <br>
				<p>Email:</p>
				<input type="text" name="email"> <br> <br>
				<p class="time">Birthdate</p>
				<div class="float">
					<p>Day:</p>
					<select name="day">
						<%
							for (int i = 1; i <= 31; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="float">
					<p>Month:</p>
					<select name="month">
						<%
							for (int i = 1; i <= 12; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="float">
					<p>Year:</p>
					<select name="year">
						<%
							for (int i = 2018; i >= 1900; i--) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>
				</div>
				<br> <br> <br> <br>
				<p>Gender:</p>
				<input type="radio" name="gender" value="mujer">Female <input
					type="radio" name="gender" value="hombre" checked>Male <br>
				<br>
				<p>Role:</p>
				<select name="role">
					<%
						for (int i = 0; i < roles.size(); i++) {
								Role r = roles.get(i);
					%>
					<option value="<%=r.getId()%>"><%=r.getName()%></option>
					<%
						}
					%>
				</select><br>
				<center>
					<input type="submit" id="submit" value="Send">
				</center>
			</form>
			<%
				} else {
			%>
			<h2>Please make sure you have created roles.</h2>
			<%
				}
			%>
		</div>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="../motor.js"></script>
	</div>
</body>
</html>