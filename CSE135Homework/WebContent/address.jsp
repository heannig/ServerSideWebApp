<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adress</title>

<%
	String firstName = request.getParameter("firstName");
	String middleInitial = request.getParameter("middleInitial");
	String lastName = request.getParameter("lastName");

	session.setAttribute("firstName", firstName);
	session.setAttribute("middleInitial", middleInitial);
	session.setAttribute("lastName", lastName);
%>

</head>
<body>
	<h1>Address Page</h1>

	<fieldset>
		<legend>Entry data</legend>
		<p>First name: <%=firstName %></p>
		<p>Middle inital: <%=middleInitial %></p>
		<p>Last name: <%=lastName %></p>
		
	</fieldset>
	
	


</body>
</html>