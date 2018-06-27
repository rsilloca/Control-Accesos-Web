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
<title>Edit Role</title>
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
			<li><a href="/roles/view?id=<%=r.getId()%>">Back</a></li>
		</ul>
		</nav>
		<div class="usersEdit">
			<center>
				<h1>Edit Role</h1>
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
						<td><form action="roles/edit" method="post">
								<input type="hidden" name="id" value="<%=r.getId()%>"> <input
									type="text" name="name"></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Status</h3>
							</center></td>
						<td class="content"><%=r.isStatus()%></td>
						<td><input type="radio" name="status" value="true" checked>True
							<input type="radio" name="status" value="false">False</td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Create Date</h3>
							</center></td>
						<td class="content"><%=r.getCreated()%></td>
					</tr>
					<tr>
						<td class="title"><center>
								<h3>Record of editions</h3>
							</center></td>
						<td class="content"><%=r.getEditions()%></td>
					</tr>

				</table>
				<br> <br> <input type="submit" value="Save changes">
				</form>
				<a href="/roles/view?id=<%=r.getId()%>">Cancel</a>
			</center>
		</div>
	</div>
</body>
</html>