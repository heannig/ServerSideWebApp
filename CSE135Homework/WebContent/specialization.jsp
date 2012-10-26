<%@page import="support.*, application.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Specialization</title>
</head>
<body>
	<h1>Specialization</h1>

	<form action="./verification" method="post">
	<select name="specialization">
	<%
		Support s = new Support();

		String path = config.getServletContext().getRealPath(
				"database/specializations.txt");
		Vector specializations = s.getSpecializations(path);
		
		// print out the specialization list
		for(int i=0; i<specializations.size(); i++)
		      out.println("<option value=\"" + specializations.get(i) + "\">" + specializations.get(i) + "</option>");
	%>
	</select>
	
	<input type="submit" value="Verification" />
	</form>

</body>
</html>