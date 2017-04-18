<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}
//hkjh
function updateDeck(el) {
	
	

	var deck = el.name;
	
	
	var elements = document.getElementsByClassName("cardimg");
    for (var i = 0; i < elements.length; i++) {
        elements[i].style.border="none";
    }
	
	
    el.style.border = "3px solid yellow";
	
	
	var dataString = 'deck1=' + deck;
	console.log(dataString);
	
	jQuery.ajax({
type: "GET",
url: "DeckServlet",
data: dataString,
cache: false,
success: function(result){
	//alert(result);
	//window.location.reload(true); 

}
});
return false;


}



</script>

<meta charset="utf-8">
<title>Blackjack Party!</title>
<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>

<%  
if (session.getAttribute("user") != null) {  
   %><%
} else { %><jsp:forward page="javaFinalLogin.jsp"/><%
}
%>
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
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

 <h2>Welcome <%= session.getAttribute("user") %>! </h2></br>
  <h2>You have:  <%= session.getAttribute("credits") %> credits </h2></br>
 <h2>Your theme packs:</h2>
 <img id="a" class="cardimg" src="defaultcard.jpg" name="cards4.png" style="width:10%; height: auto;" onclick="updateDeck(this)"></img>
 <%  
     if (session.getAttribute("purchase1") != null) {  
        %> <img id="b" class="cardimg" src="newcard.jpg" name="cards6.png" style="width:10%; height: auto;" onclick="updateDeck(this)"></img>  <%
     }  %> 



<%  
     if (session.getAttribute("purchase2") != null) {  
        %> <img id="c" class="cardimg" src="newcard2.jpg" name="cards8.png" style="width:10%; height: auto;" onclick="updateDeck(this)"></img> <%
     }  %> 

<%  
     if (session.getAttribute("purchase3") != null) {  
        %> <img id="d" class="cardimg" src="newcard3.jpg" name="cards7.png" style="width:10%; height: auto;" onclick="updateDeck(this)"></img>  <%
     }  %> 
     
 
 


<script>
<%  
if (session.getAttribute("activeDeck").equals("cards4.png")) {  
   %>document.getElementById("a").style.border = "3px solid yellow";<%
} %>
<%  
if (session.getAttribute("activeDeck").equals("cards6.png")) {  
   %>document.getElementById("b").style.border = "3px solid yellow";<%
} %>
<%  
if (session.getAttribute("activeDeck").equals("cards8.png")) {  
   %>document.getElementById("c").style.border = "3px solid yellow";<%
} %>
<%  
if (session.getAttribute("activeDeck").equals("cards7.png")) {  
   %>document.getElementById("d").style.border = "3px solid yellow";<%
} %>

</script>

</body>
</html>