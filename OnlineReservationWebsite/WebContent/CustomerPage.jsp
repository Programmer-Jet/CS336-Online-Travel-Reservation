<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<meta charset="UTF-8">
<style> 

body {
  background-image: url("CloudImage.jpeg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: fixed;
  background-top:0;
  background-left:0;
  background-min-width: 100%;
  background-min-height: 100%;
  
}
h1 {
	color: #0074D9;
  	font-family: geometric sans-serif;
  	font-size: 200%;
  	text-align: right;
  	
}
h2 {
	color: #0074D9;
  	font-family: geometric sans-serif;
  	font-size: 200%;
  	text-align: left;
  	
}
p {
	font-size: 200%;
	text-align: left;
}
input {
	background-color: transparent;
	font-family: geometric sans-serif;
	font-size: 90%;
	border-style: solid;
  	border-width: 1px;
  	border-color: black;
}
div {
	text-align:right; 
}
hr {
border-color: black;
}
option {
font-family: geometric sans-serif;
font-size: 150%;
}

</style>
<title>Customer Page</title>
</head>
<body>

<% 	String currentUserName = session.getAttribute("CurrentUser").toString();
	out.print("<h1>Welcome, " + currentUserName + "!</h1> ");
	out.println("<div> Can work on this later ...  <input type = \"submit\" value = \"EDIT PERSONAL INFO\"> </div>");
	out.println("<div> <form method = \"post\" action = \"LogOutPage.jsp\"> <input type = \"submit\" value = \"LOG OUT\"></form> </div>");
	
	
	out.print("<h2> Where would you like to take your next adventure? </h2>");
	
	// connect to a DB and try to make a drop down table of all the contries and airports to start a flight from
	try {
		//Get the database connection
		//Get the database connection
				
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
				
			//get the names of all the countries for now
			String select = "SELECT Country FROM OnlineResTravelSystem.Airports ORDER BY Country ASC";
						
			// put the results in the Result Set to be read
			PreparedStatement ps = con.prepareStatement(select);
			ResultSet result = ps.executeQuery();
			
			out.print("Country of Departure  <select name= \"Country\"");
			while (result.next()) {
				out.print( "<option>" +result.getString("Country")+ "</option> " );
			}
			out.print("</select> ");
			out.print("Departure date:  <input type=\"date\" name=\"depart\" /input> <small> Format: YYYY:MM:DD </small>");
			
			
			db = new ApplicationDB();	
			con = db.getConnection();

			//Create a SQL statement
			stmt = con.createStatement();
				
			//get the names of all the countries for now
			select = "SELECT Country FROM OnlineResTravelSystem.Airports ORDER BY Country ASC";
						
			// put the results in the Result Set to be read
			ps = con.prepareStatement(select);
			result = ps.executeQuery();
			
			out.print("<br><br>Country of Arrival <select name= \"Country\"");
			while (result.next()) {
				out.print( "<option>" +result.getString("Country")+ "</option> " );
			}
			out.print("</select>");
			out.print("Arrival date: <input type=\"date\" name=\"depart\" /input> <small> Format: YYYY:MM:DD </small>");
			out.print("<br><input type = \"submit\" value = \"FIND FLIGHTS\">");
				
		
	} 
	catch (Exception ex) {
		out.print("Could not establish a connection.");
	}
%>
	<hr />
	
	<h2> Current Flight Reservations </h2>


</body>
</html>