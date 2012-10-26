<%@page import="support.*,application.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verification</title>
</head>

<%
	// if the user comes from the specialization site, set session attributes
	if (request.getParameter("specialization") != null) {
		session.setAttribute("specialization",
				request.getParameter("specialization"));
	}
%>

<body>
	<h1>Verification</h1>
	<p>
		First name:
		<%=session.getAttribute("firstName")%></p>
	<p>
		Middle initial:
		<%=session.getAttribute("middleInitial")%></p>
	<p>
		Last name:
		<%=session.getAttribute("lastName")%></p>
	<p>
		Country:
		<%=session.getAttribute("country")%></p>
	<p>
		Street:
		<%=session.getAttribute("streetAddress")%></p>
	<p>
		City:
		<%=session.getAttribute("city")%></p>
	<p>
		Zip:
		<%=session.getAttribute("zip")%></p>

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
			</tr>
		</thead>

		<tbody>
			<%
				Vector degreesList = (Vector) session.getAttribute("degreesList");
				for (int i = 0; i < degreesList.size(); i++) {
					Degree d = (Degree) degreesList.get(i);
			%>
			<tr>
				<td><%=d.getLocation()%></td>
				<td><%=d.getUniversity()%></td>
				<td><%=d.getDiscipline()%></td>
				<td><%=d.getMonth()%></td>
				<td><%=d.getYear()%></td>
				<td><%=d.getGpa()%></td>
				<td><%=d.getTitle()%></td>
				<%
					}
				%>
			
		</tbody>

	</table>
	<p>
		Specialization:
		<%=session.getAttribute("specialization")%></p>

	<form action="">
		<input type="submit" value="Submit Application" /> <input
			type="submit" value="Cancel" />
	</form>

</body>
</html>