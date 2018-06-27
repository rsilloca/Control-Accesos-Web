<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.Access"%>
<%@ page import="java.util.List"%>
<%
	List<Access> access = (List<Access>) request.getAttribute("access");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Access</title>
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
			<a href="/access/add">Add access</a>
				<%
					if (access.size() > 0) {
				%>
				<h1>Access</h1>
				<table>
					<tr>
						<td class="title"><center>
								<h3>Id</h3>
							</center></td>
						<td class="title"><center>
								<h3>Rol</h3>
							</center></td>
						<td class="title"><center>
								<h3>Url</h3>
							</center></td>
						<td class="title"><center>
								<h3>Status</h3>
							</center></td>
						<td class="title"><center>
								<h3>Acciones</h3>
							</center></td>
					</tr>
					<%
						for (int i = access.size() - 1; i >= 0; i--) {
					%>
					<tr>
						<td class="content"><%=access.get(i).getId()%></td>
						<td class="content"><%=access.get(i).getIdRole()%></td>
						<td class="content"><%=access.get(i).getIdUrl()%></td>
						<td class="content"><%=access.get(i).isStatus()%></td>
						<td class="content content2"><a
							href="access/view?id=<%=access.get(i).getId()%>">View</a> <a
							href="access/edit?id=<%=access.get(i).getId()%>">Edit</a> <a
							href="access/delete?id=<%=access.get(i).getId()%>">Delete</a></td>
					</tr>
					<%
						}
					%>
				</table>

				<%
					} else {
				%>
				<h3>No accesses found.</h3>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>