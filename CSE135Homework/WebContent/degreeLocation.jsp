<%@page import="support.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Degree Location</title>
</head>
<body>
	<h1>Choose a degree location</h1>

	<%
	
		Support s = new Support();
		String path = config.getServletContext().getRealPath(
				"database/universities.txt");
		Vector universities = s.getUniversities(path);
		Vector universityList = null;

		if (session.getValue("country") == null) {
			out.println("No country selected!");
		} else {

			// get the university list for the chosen state/country
			for (int i = 0; i < universities.size(); i++) {
				Vector currentState = (Vector) universities.get(i);
				if (currentState.get(0).equals(session.getValue("country"))) {
					universityList = (Vector) currentState.get(1);
				}
			}

			out.println("<table><tr>");

			// iterate over the univserity list
			for (int i = 0; i < universityList.size(); i++) {
				out.println("<td>" + "<a href=\"./chooseUniversity?"
						+ universityList.get(i) + "\">"
						+ universityList.get(i) + "</td>");
				if (i % 3 == 2) {
					out.println("</tr>");
				}
			}
		}
	%>


</body>
</html>