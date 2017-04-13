<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="sessionScript.js"></script>
<script type="text/javascript" src="jquery-3.2.0.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Welcome

<form action="LoginServlet" method="post">  
Username:<input type="text" name="username"/><br/><br/>  
Password:<input type="text" name="password"/><br/><br/>  
<input type="submit" value="login"/></br>

<%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>
 <%  
     if (session.getAttribute("user") != null) {  
        %><jsp:forward page="javaFinalHome.html"/>  <%
     } else { %><h2>Session user null</h2> <%
     }
 %>
     
 
  
</form>  
</body>
</html>
