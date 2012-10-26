<%@page import="support.*,application.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose University</title>
<%
	
	Vector<Degree> degreesList = (Vector) session
			.getAttribute("degreesList");
	degreesList.lastElement().setLocation(
			request.getParameter("location"));
%>
</head>
<body>
	<h1>Choose University (2/4)</h1>

	<%
		// get complete university list
		Support s = new Support();
		String path = config.getServletContext().getRealPath(
				"database/universities.txt");
		Vector universities = s.getUniversities(path);
		Vector universityList = null;

		// get the university list for the chosen state/country
		for (int i = 0; i < universities.size(); i++) {
			Vector currentState = (Vector) universities.get(i);
			if (currentState.get(0)
					.equals(request.getParameter("location"))) {
				universityList = (Vector) currentState.get(1);
			}
		}
		
		%>

		<table><tr>
		
		<%

		// iterate over the univserity list and print out all universities
		for (int i = 0; i < universityList.size(); i++) {
			out.println("<td>" + "<a href=\"./chooseDiscipline?university="
					+ universityList.get(i) + "\">" + universityList.get(i)
					+ "</td>");
			if (i % 3 == 2) {
				out.println("</tr>");
			}
		}
		%>
		
		</tr></table>
		
		<form action="./chooseDiscipline" method="post">
			<label for="university">University not in the list?</label>
			<input type="text" id="university" name="university" />
			<input type="submit" value="Submit other university" />
		</form>



</body>
</html>