<%@page import="support.*,java.util.*"%>
<%
	// load the countries and states file
	Support s = new Support();
	String path1 = config.getServletContext().getRealPath(
			"database/countries_and_states.txt");
	Vector<CountryState> countries_and_states = s
			.getCountriesAndStates(path1);
%>
<HTML>
<HEAD>
<TITLE>Entry</TITLE>
</HEAD>
<BODY>
	<h1>Name and Country</h1>
	<FORM ACTION="./address" METHOD="post">
		<label FOR="firstName">First Name</label> <INPUT TYPE="TEXT"
			NAME="firstName" /><br /> <label FOR="middleInitial">Middle
			Initial</label> <INPUT TYPE="TEXT" NAME="middleInitial" /><br /> <label
			FOR="lastName">Last Name</label> <INPUT TYPE="TEXT" NAME="lastName" /><br />
		<label FOR="country">Country</label> <select NAME="country">
			<%
				// print out all countries
				for (int i = 0; i < countries_and_states.size(); i++) {
					if (countries_and_states.get(i).isCountry) {
						out.println("<option value=\""
								+ (String) ((CountryState) countries_and_states
										.get(i)).countryStateName
								+ "\">"
								+ (String) ((CountryState) countries_and_states
										.get(i)).countryStateName + "</option>");
					}
				}
			%>

		</select><br /> <INPUT TYPE="submit" VALUE="Submit Personal Data" />
	</FORM>
</BODY>
</HTML>