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
<title>Address</title>

<%
	String firstName = request.getParameter("firstName");
	String middleInitial = request.getParameter("middleInitial");
	String lastName = request.getParameter("lastName");
	String country = request.getParameter("country");

	session.setAttribute("firstName", firstName);
	session.setAttribute("middleInitial", middleInitial);
	session.setAttribute("lastName", lastName);
	session.setAttribute("country", country);
%>

</head>
<body>
	<h1>Address Page</h1>

	<fieldset>
		<legend>Entry data</legend>
		<p>
			First name:
			<%=firstName%></p>
		<p>
			Middle inital:
			<%=middleInitial%></p>
		<p>
			Last name:
			<%=lastName%></p>

	</fieldset>
<br/>
<fieldset>
	<%
		if (session.getAttribute("country").equals("United States")) {
	%>
	<FORM ACTION="./degreeLocation" METHOD="post">
		<label FOR="streetAddress">Address</label> <INPUT TYPE="TEXT"
			NAME="streetAddress" /><br /> <label FOR="city">City</label> <INPUT
			TYPE="TEXT" NAME="city" /><br /> <label FOR="zip">Zip Code</label>
		<INPUT TYPE="TEXT" NAME="zip" /><br /> <label FOR="state">State</label>
		<select NAME="state">
			<%
				for (int i = 0; i < countries_and_states.size(); i++) {
						if (!countries_and_states.get(i).isCountry) {
							out.println("<option value=\""
									+ (String) ((CountryState) countries_and_states
											.get(i)).countryStateName
									+ "\">"
									+ (String) ((CountryState) countries_and_states
											.get(i)).countryStateName + "</option>");
						}
					}
			%>
			<br />

		</select> </br>
		<INPUT TYPE="submit" VALUE="Submit Personal Data" />
	</FORM>
</fieldset>
	<%
		} else {
			out.println("<a href=\"degreesLocation\">No further information required. Go to the next step.</a>");
		}
	%>



</body>
</html>