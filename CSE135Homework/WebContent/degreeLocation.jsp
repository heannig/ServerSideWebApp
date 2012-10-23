<%@page import="support.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Support s = new Support();
	String path1 = config.getServletContext().getRealPath(
			"database/countries_and_states.txt");
	Vector<CountryState> countries_and_states = s
			.getCountriesAndStates(path1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Degree Location</title>
</head>
<body>
	<h1>Choose Degree Location</h1>

	<%
		out.println("<table><tr>");
		// display links to universities in given state
		for (int i = 0; i < countries_and_states.size(); i++) {
			if (!countries_and_states.get(i).isCountry) {
				out.println("<td>"
						+ "<a href=\" ./chooseUniversity?university="
						+ (String) ((CountryState) countries_and_states
								.get(i)).countryStateName
						+ "\">"
						+ (String) ((CountryState) countries_and_states
								.get(i)).countryStateName + "</a></td>");
				if (i % 3 == 2) {
					out.println("</tr><tr>");
				}
			}

		}
		// Display all countries other than US
		for (int i = 0; i < countries_and_states.size(); i++) {
			if ((countries_and_states.get(i).isCountry)
					&& !(((String) ((CountryState) countries_and_states
							.get(i)).countryStateName).equals("United States"))) {
				out.println("<td>"
						+ "<a href=\" ./chooseUniversity?university="
						+ (String) ((CountryState) countries_and_states
								.get(i)).countryStateName
						+ "\">"
						+ (String) ((CountryState) countries_and_states
								.get(i)).countryStateName + "</a></td>");
				if (i % 3 == 2) {
					out.println("</tr><tr>");
				}
			}

		}
		out.println("</tr><table>");
	%>

</body>
</html>