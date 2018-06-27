<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.entity.Message"%>
<%@ page import="java.util.List"%>
<%
	List<Message> messages = (List<Message>) request.getAttribute("messages");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Messages</title>
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
				<a href="/messages/add">Add Message</a>
				<%
					if (messages.size() > 0) {
				%>
				<h1>Messages</h1>
				<table>
					<tr>
						<td class="title"><center>
								<h3>Id User</h3>
							</center></td>
						<td class="title"><center>
								<h3>Id Receiver</h3>
							</center></td>
						<td class="title"><center>
								<h3>Affair</h3>
							</center></td>
						<td class="title"><center>
								<h3>Actions</h3>
							</center></td>
					</tr>
					<%
						for (int i = messages.size() - 1; i >= 0; i--) {
								Message m = messages.get(i);
					%>
					<tr>
						<td class="content"><%=m.getIdUser()%></td>
						<td class="content"><%=m.getIdReceiver()%></td>
						<td class="content"><%=m.getAffair()%></td>
						<td class="content content2"><a
							href="/messages/view?id=<%=m.getId()%>">View</a> <a
							href="/messages/edit?id=<%=m.getId()%>">Edit</a><a
							href="/messages/delete?id=<%=m.getId()%>">Delete</a></td>
					</tr>
					<%
						}
					%>
				</table>

				<%
					} else {
				%>
				<h2>No messages found.</h2>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>