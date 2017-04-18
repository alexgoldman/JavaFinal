<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Blackjack Party Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
function purchaseDeck(el){

	var theme = el.id;
	
	var price = el.name;
	
	
	
	var dataString = 'theme1=' + theme + '&price1=' + price;
	console.log(dataString);
	
	jQuery.ajax({
type: "GET",
url: "PurchaseServlet",
data: dataString,
cache: false,
success: function(response){
	//alert(result);
	if(response=="no good" && theme==1){
		console.log("in the no good statement");
		document.getElementById("errorHandler1").innerHTML="Not enough credits";
	} 
	if(response=="no good" && theme==2){
		
		document.getElementById("errorHandler2").innerHTML="Not enough credits";
	} 
	if(response=="no good" && theme==3){
		
		document.getElementById("errorHandler3").innerHTML="Not enough credits";
	} 
	if(response=="good"){
		window.location.reload(true); 
	}



}
});
return false;


	
}
</script>
<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>
 <%  
     if (session.getAttribute("user") != null) {  
        %>  <%
     } else { %> <jsp:forward page="javaFinalLogin.jsp"/><%
     }
 %>
<h1 id="headTitle">Blackjack Party!</h1>
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
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">


</head>
<body>
<%  
     if (session.getAttribute("purchase1") != null) {  
        %> <div class="deckBorder"> <h2>Purchased</h2> <img src="newcard.jpg" style="width:60%; height: auto;"></img> </div><%
     } else { %> <div class="deckBorder"> <h2>Theme Pack 1</h2> <img src="newcard2.jpg" style="width:60%; height: auto;"></img><h2>150 Credits</h2>
     <div id="errorHandler1"></div><input name="150" id="1" type="button" value="Purchase" onclick="purchaseDeck(this)"/></div> <%
     }
 %>


<%  
     if (session.getAttribute("purchase2") != null) {  
        %> <div class="deckBorder"><h2>Purchased</h2>  <img src="newcard2.jpg" style="width:60%; height: auto;" ></img></div> <%
     } else { %><div class="deckBorder"> <h2>Theme Pack 2</h2> <img src="newcard2.jpg" style="width:60%; height: auto;"></img><h2>200 Credits</h2>
     <div id="errorHandler2"></div><input name="200" id="2" type="button" value="Purchase" onclick="purchaseDeck(this)"/></div> <%
     }
 %>


<%  
     if (session.getAttribute("purchase3") != null) {  
        %> <div class="deckBorder"> <h2>Purchased</h2> <img src="newcard3.jpg" style="width:60%; height: auto;"></img></div> <%
     } else { %> <div class="deckBorder"> <h2>Theme Pack 3</h2> <img src="newcard3.jpg" style="width:60%; height: auto;"></img><h2>10 Credits</h2>
      <div id="errorHandler3"></div><input name="10" id="3" type="button" value="Purchase" onclick="purchaseDeck(this)"/> </div><%
     } 
 %>



</body>
</html>