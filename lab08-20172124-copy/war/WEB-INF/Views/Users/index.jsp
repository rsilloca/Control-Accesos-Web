<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.User"%>
<%@ page import="java.util.List"%>
<%
	List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Users</title>
<link rel="stylesheet" type="text/css" href="styles.css" />
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
			<li><a href="/users/login">Back</a></li>
		</ul>
		</nav>
		<div class="usersIndex">

			<center>
			<a href="/users/add">Add User</a>
				<%
					if (users.size() > 0) {
				%>
				<h1>Users</h1>
				<table>
					<tr>
						<td class="title"><center>
								<h3>Role</h3>
							</center></td>
						<td class="title"><center>
								<h3>Email</h3>
							</center></td>
						<td class="title"><center>
								<h3>Status</h3>
							</center></td>
						<td class="title"><center>
								<h3>Creation date</h3>
							</center></td>
						<td class="title"><center>
								<h3>Actions</h3>
							</center></td>
					</tr>
					<%
						for (int i = users.size() - 1; i >= 0; i--) {
					%>
					<tr>
						<td class="content"><%=users.get(i).getIdRole()%></td>
						<td class="content"><%=users.get(i).getEmail()%></td>
						<td class="content"><%=users.get(i).isStatus()%></td>
						<td class="content"><%=users.get(i).getCreated()%></td>
						<td class="content content2"><a
							href="/users/view?id=<%=users.get(i).getId()%>">View</a> <a
							href="/users/edit?id=<%=users.get(i).getId()%>">Edit</a><a
							href="/users/delete?id=<%=users.get(i).getId()%>">Delete</a></td>
					</tr>
					<%
						}
					%>
				</table>

				<%
					} else {
				%>
				<h2>No users found.</h2>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>