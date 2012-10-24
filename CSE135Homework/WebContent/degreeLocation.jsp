<%@page import="support.*, application.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if(request.getParameter("streetAddress") != null) {
		session.setAttribute("streetAddress", request.getParameter("streetAddress"));
	}
	if(request.getParameter("city") != null) {
		session.setAttribute("city", request.getParameter("city"));
	}
	if(request.getParameter("zip") != null) {
			session.setAttribute("zip", request.getParameter("zip"));
	}

	Support s = new Support();
	String path = config.getServletContext().getRealPath(
			"database/universities.txt");
	Vector universities = s.getUniversities(path);

	// create a new degreelist if it not exists
	if (session.getAttribute("degreesList") == null) {
		session.setAttribute("degreesList", new Vector<Degree>());
	}

	Vector<Degree> degreesList = (Vector) session
			.getAttribute("degreesList");
	degreesList.add(new Degree());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Degree Location</title>
</head>
<body>
	<h1>Choose Degree Location (1/4)</h1>

	<%
		out.println("<table><tr>");

		for (int i = 0; i < universities.size(); i++) {
			Vector tuple = (Vector) universities.get(i);
			String state = (String) tuple.get(0);
			out.println("<td>" + "<a href=\" ./chooseUniversity?location="
					+ state + "\">" + state + "</a></td>");
			if (i % 3 == 2) {
				out.println("</tr><tr>");
			}

		}

		out.println("</tr><table></fieldset>");
	%>

</body>
</html>