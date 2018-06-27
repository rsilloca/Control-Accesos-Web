<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.Role"%>
<%@ page import="java.util.List"%>
<%
	List<Role> roles = (List<Role>) request.getAttribute("roles");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Roles</title>
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
				<a href="/roles/add">Add Role</a>
				<%
					if (roles.size() > 0) {
				%>
				<h1>Roles</h1>
				<table>
					<tr>
						<td class="title"><center>
								<h3>Id</h3>
							</center></td>
						<td class="title"><center>
								<h3>Name</h3>
							</center></td>
						<td class="title"><center>
								<h3>Status</h3>
							</center></td>
						<td class="title"><center>
								<h3>Create date</h3>
							</center></td>
						<td class="title"><center>
								<h3>Actions</h3>
							</center></td>
					</tr>
					<%
						for (int i = roles.size() - 1; i >= 0; i--) {
					%>
					<tr>
						<td class="content"><%=roles.get(i).getId()%></td>
						<td class="content"><%=roles.get(i).getName()%></td>
						<td class="content"><%=roles.get(i).isStatus()%></td>
						<td class="content"><%=roles.get(i).getCreated()%></td>
						<td class="content content2"><a
							href="roles/view?id=<%=roles.get(i).getId()%>">View</a> <a
							href="roles/edit?id=<%=roles.get(i).getId()%>">Edit</a> <a
							href="roles/delete?id=<%=roles.get(i).getId()%>">Delete</a></td>
					</tr>
					<%
						}
					%>
				</table>

				<%
					} else {
				%>
				<h2>No roles found.</h2>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>