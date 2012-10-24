<%@page import="support.*, application.*, java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Discipline</title>

<%
	// add the university information from the last page to the degree
	Vector<Degree> degreesList = (Vector)session.getAttribute("degreesList");
	degreesList.lastElement().setUniversity(request.getParameter("university"));

	// get discipline list
	Support s = new Support();
	String path = config.getServletContext().getRealPath(
			"database/disciplines.txt");
	
	Vector disciplines = s.getDisciplines(path);
%>

</head>
<body>
	<h1>Choose Discipline (3/4)</h1>

	<form action="./degreesList" method="POST">
	<p>Mature</p>
		<%
			for (int i = 0; i < disciplines.size(); i++) {
				out.println("<label for=\""+(String) disciplines.get(i)+"\">" + (String) disciplines.get(i)
						+ "</label><input type=\"radio\" value=\"" + (String) disciplines.get(i)
						+ "\" name=\"discipline\" id=\"" + (String) disciplines.get(i) + "\"><br />");
			}
		%>
	
	<label for="ownDiscipline">Not listed?</label>
	<input type="text" name="ownDiscipline" /><br /><br /><br />
		
	<label for="month">Month</label>
	<input type="text" name="month" id="month"/><br />
	
	<label for="year">Year</label>
	<input type="text" name="year" id="year"/><br />
	
	<label for="GPA">GPA</label>
	<input type="text" name="gpa" id="gpa"/><br />
	
	<label for="title">Title-of-degree</label>
	<select name="title">
		<option value="Bachelor">Bachelor</option>
		<option value="Master">Master</option>
		<option value="PhD">PhD</option>
	</select><br />

	
	<input type="submit" value="Submit Degree" />

	</form>


</body>
</html>