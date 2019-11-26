<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
<title>Customer Representative Page</title>
</head>
<body>

<% String currentUserName = session.getAttribute("CurrentUser").toString();
out.print("<h1>Dashboard for Customer Representative: " + currentUserName + "</h1> ");
out.println("<div> <input type = \"submit\" value = \"EDIT PERSONAL INFO\"> </div>");
out.println("<div> <form method = \"post\" action = \"LogOutPage.jsp\"> <input type = \"submit\" value = \"LOG OUT\"></form> </div>");


out.print("<h2> Make or edit flight reservations for a user: </h2>");

//connect to DB and make a drop down table of customers
try {
	//Get the database connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	//Create an SQL query to get all users
	//Statement stmt = con.createStatement();
	String select = "SELECT First_Name,Last_Name,Username FROM OnlineResTravelSystem.User WHERE User_Type = \"1\"";
	PreparedStatement ps = con.prepareStatement(select);
	ResultSet result = ps.executeQuery();
	
	//create the form to redirect
	out.print("<form action=\"CustomerRepUserEdit.jsp\"");
	//create the drop down menu of users
	out.print("User: <select name = \"User\"");
	while(result.next()) {
		out.print("<option>" + result.getString("First_Name") + " " + result.getString("Last_Name") + " - " + result.getString("Username") + "</option>");
	}
	out.print("</select>");
	out.print("<input type = \"submit\" value = \"Go\">");
	out.print("</form>");
	
	//create new flight
	out.print("<form method = post action = \"NewFlight.jsp\">");
	out.print("<input type = \"submit\" value = \"Create new flight\"");
	
}
catch (Exception ex) {
	out.print("Could not establish a connection.");
}

%>

</body>
</html>