<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Blackjack Party!</title>
<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>

<h1 id="headTitle">Blackjack Party!!!!</h1>

<ul>
	
  <li><a href="javaFinalHome.jsp">My Account</a></li>
  <li><a href="javaFinalGame.jsp">Blackjack</a></li>
  <li><a href="javaFinalStore.jsp">Store</a></li>
  <li><a href="javaFinalHelp.jsp">Help</a></li>
   <%  
     if (session.getAttribute("user") != null ) {  
        %><li><a href="LogoutServlet">Sign Out</a></li>  <%
     } else { %><li><a href="javaFinalLogin.jsp">Sign In</a></li> <%
     }
 %>
     
  
 </ul>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<h1>Gambling problem? We are here to help</h1>

<img  src="gamblinghelp.jpg" style="width:80%; height: 300px;"></img>
<h2>If you are struggling with gambling addiction please visit one of the following websites:</h2>
<ol id="websites">
	<!--  -->
	<!--  -->
	<!--  -->
  <li class="weblist"><a href="http://www.gamblersanonymous.org/ga/">Gamblers Anonymous</a></li></br>
  <li class="weblist"><a href="http://www.ncpgambling.org/help-treatment/national-helpline-1-800-522-4700/">National Gamblers Society</a></li></br>
  <li class="weblist"><a href="https://www.helpguide.org/articles/addiction/gambling-addiction-and-problem-gambling.htm">Gambling Help Guide</a></li></br>
  <li class="weblist"><a href="http://www.wikihow.com/Deal-With-a-Gambling-Addiction">Gambling Addiction Wiki How</a></li>

     
  
 </ol>
</body>
</html>