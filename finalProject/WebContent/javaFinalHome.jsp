<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Blackjack Party!</title>
<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>

<h1 id="headTitle">Blackjack Party!!!!</h1>

<ul>
	
  <li><a href="javaFinalHome.jsp">My Account</a></li>
  <li><a href="javaFinalGame.jsp">Blackjack</a></li>
  <li><a href="javaFinalStore.html">Store</a></li>
  <li><a href="javaFinalHelp.html">Help</a></li>
   <%  
     if (session.getAttribute("user") != null ) {  
        %><li><a href="LogoutServlet">Sign Out</a></li>  <%
     } else { %><li><a href="javaFinalLogin.jsp">Sign In</a></li> <%
     }
 %>
     
  
 </ul>
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

 

	<!--
    //php
		
			// Initializes a connection to the database.  This is required because it is neccessary to use the forum.
			//require("finalConnector.php");
			
			if(!empty($_SESSION['userID'])){
						echo "<h2>Welcome!</h2>";
					}
					
				
				
				
				
		 else {
				echo "<h2>Sign in to access member features</h2>";
			}
		
		
	//php
	-->


</body>
</html>