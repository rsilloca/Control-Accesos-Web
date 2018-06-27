<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
	List<Resource> resources = (List<Resource>) request.getAttribute("resources");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Access Add</title>
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
			<li><a href="/access">Back</a></li>
		</ul>
		</nav>
		<div class="form">
			<center>
				<%
					if (roles.size() > 0 && resources.size() > 0) {
				%>
				<h2>Add Access</h2>
				<form action="/access/add" method="post">
					<p>Role:</p>
					<select name="idRole">
						<%
							for (int i = 0; i < roles.size(); i++) {
									Role role = roles.get(i);
						%>
						<option value="<%=role.getId()%>"><%=role.getName()%></option>
						<%
							}
						%>
					</select>
					<p>Resource:</p>
					<select name="idUrl">
						<%
							for (int i = 0; i < resources.size(); i++) {
									Resource resource = resources.get(i);
						%>
						<option value="<%=resource.getId()%>"><%=resource.getUrl()%></option>
						<%
							}
						%>
					</select><br><br><input type="submit" value="Send">
				</form>

				<%
					} else {
				%>

				<h2>Please make sure you have created roles and resources.</h2>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>