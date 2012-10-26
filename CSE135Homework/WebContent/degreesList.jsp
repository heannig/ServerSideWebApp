<%@page import="support.*, application.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Vector<Degree> degreesList = (Vector)session.getAttribute("degreesList");

	// if method is get, remove degree from degrees list else finish the new degree
	if(request.getMethod().equals("GET")) {
		for(int i = 0; i < degreesList.size(); i++) {
			Degree current = degreesList.get(i);
			if(current.getId().toString().equals(request.getParameter("id"))) {
				degreesList.removeElement(current);				
			}
		}
	// else the user creates a new degree so get all the parameters
	} else {
		degreesList.lastElement().setYear(request.getParameter("year"));
		degreesList.lastElement().setMonth(request.getParameter("month"));
		degreesList.lastElement().setGpa(request.getParameter("gpa"));
		degreesList.lastElement().setTitle(request.getParameter("title"));
		if(request.getParameter("ownDiscipline") == "") {
			degreesList.lastElement().setDiscipline(request.getParameter("discipline"));
		} else {
			degreesList.lastElement().setDiscipline(request.getParameter("ownDiscipline"));
		}
	}

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Degrees List</title>
</head>
<body>
<h1>Degrees List (4/4)</h1>
<table>
	<thead>
	<tr>
		<th>Country/State</th>
		<th>University</th>
		<th>Discipline</th>
		<th>Month</th>
		<th>Year</th>
		<th>GPA</th>
		<th>Title-of-degree</th>
		<th>Option</th></tr>
	</thead>
	
	<tbody>
	<%
		// print out the degrees list
		for (int i = 0; i < degreesList.size(); i++) {
			Degree d = degreesList.get(i);
	%>
		<tr>
			<td><%=d.getLocation() %></td>
			<td><%=d.getUniversity() %></td>
			<td><%=d.getDiscipline() %></td>
			<td><%=d.getMonth() %></td>
			<td><%=d.getYear() %></td>
			<td><%=d.getGpa() %></td>
			<td><%=d.getTitle() %></td>
			<td><a href="./degreesList?id=<%=d.getId() %>">Delete</a></td>
	<%
		}
	%>
	</tbody>
</table>

<form action="./degreeLocation" method="POST">
	<input type="submit" value="Submit Next Degree" />
</form>
<form action="./specialization" method="POST">
	<input type="submit" value="Done" />
</form>

</body>
</html>