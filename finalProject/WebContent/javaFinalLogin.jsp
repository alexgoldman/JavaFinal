<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Blackjack Party Login</title>
<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>

<h1 id="headTitle">Blackjack Party!</h1>
<ul>
	
  <li><a href="javaFinalHome.jsp">My Account</a></li>
  <li><a href="javaFinalGame.html">Blackjack</a></li>
  <li><a href="javaFinalStore.html">Store</a></li>
  <li><a href="javaFinalHelp.html">Help</a></li>
  
 </ul>
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">


</head>
<body>
<form method="post" action="LoginServlet">
<h3>Username: 
<input name="username" type="text"/></h3>
<h3>Password:
<input name="password" type="password" /></h3>
<input type="submit" name="submit" value="Login" />
</form>

<%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>
 <%  
     if (session.getAttribute("user") != null) {  
        %><jsp:forward page="javaFinalHome.jsp"/>  <%
     } else { %><h2>Session user null</h2> <%
     }
 %>
<h2> Don't have an account?  Create one:</h2>
<input name="createAccount" type="button" value="Create Account" onClick="window.location.href='javaFinalCreateAccount.jsp'" />
</body>
</html>