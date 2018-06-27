<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.Role"%>
<%
	Role r = (Role) request.getAttribute("role");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>View Role</title>
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
			<li><a href="/roles">Back</a></li>
		</ul>
		</nav>
		<div class="tableView">
			<center>
				<h1>View Role</h1>
				<table>
					<tr>
						<td class="title"><center>
								<h3>Id</h3>
							</center></td>
						<td class="content"><%=r.getId()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Name</h3>
							</center></td>
						<td class="content"><%=r.getName()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Status</h3>
							</center></td>
						<td class="content"><%=r.isStatus()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Create date</h3>
							</center></td>
						<td class="content"><%=r.getCreated()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Record of editions</h3>
							</center></td>
						<td class="content"><%=r.getEditions()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Actions</h3>
							</center></td>
						<td class="content"><a href="/roles/edit?id=<%=r.getId()%>">Edit</a>
							<a href="/roles/delete?id=<%=r.getId()%>">Delete</a></td>
					</tr>
				</table>
			</center>
		</div>
	</div>
</body>
</html>