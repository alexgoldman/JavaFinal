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
  <li><a href="javaFinalGame.jsp">Blackjack</a></li>
  <li><a href="javaFinalStore.jsp">Store</a></li>
  <li><a href="javaFinalHelp.jsp">Help</a></li>
  
 </ul>
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">


</head>
<body>
<form method="post" action="CreateAccountServlet">
<h3>First Name: 
<input required name="fname" type="text"/></h3>
<h3>Last Name: 
<input required name="lname" type="text"/></h3>
<h3>Email: 
<input required name="email" type="text"/><%
    if(null!=request.getAttribute("emailError"))
    {
        out.println(request.getAttribute("emailError"));
    }
%>
</h3>
<h3>Username: 
<input required name="username" type="text"/><%
    if(null!=request.getAttribute("usernameError"))
    {
        out.println(request.getAttribute("usernameError"));
    }
%>
</h3>
<h3>Password:
<input required name="password" type="password" /></h3>
<input type="submit" name="submit" value="Create" />
</form>


 <%  
     if (session.getAttribute("user") != null) {  
        %><jsp:forward page="javaFinalHome.jsp"/>  <%
     } else { %><h2>Session user null</h2> <%
     }
 %>

</body>
</html>