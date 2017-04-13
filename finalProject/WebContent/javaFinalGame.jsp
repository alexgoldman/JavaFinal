<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="javaFinalStyle.css" rel="stylesheet" type="text/css">
<%  
     if (session.getAttribute("user") != null) {  
        %><%
     } else { %><jsp:forward page="javaFinalLogin.jsp"/><%
     }
 %>

<title>Blackjack Party!!!</title>

<script type="text/javascript" src="Card.js"></script>
<script type="text/javascript" src="DisplayedCard.js"></script>
<script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>


<script type="text/javascript">

<!-- -->

var dealerCards = [];  // Arrays holding the DisplayCard objects used to show the cards
var playerCards = [];

dealerCards.count = 0;  // Number of cards actually in the dealer's hand
playerCards.count = 0;   // Number of cards actually in the player's hand

var deck = new Deck();

var gameInProgress = false;

var bet;
var betInput;
var money;
var moneyDisplay;
var message;

var standButton, hitButton, newGameButton;  // objects representing the buttons, so I can enable/disable them

function getCredits() {

	var senderName = (objButton.name);
		
	var teamName = $("#teamName").val();
	
	var recName = $("#recName").val();
	
	var dataString = 'senderName1=' + senderName + '&teamName1=' + teamName + '&recName1=' + recName;

	
	$.ajax({
type: "POST",
url: "getCredits.php",
data: dataString,
cache: false,
success: function(result){
	
	window.location.reload(true); 

}
});
return false;


}



function setup() {
    for (var i = 1; i <= 5; i++) {
       dealerCards[i] = new DisplayedCard("dealer" + i);
       dealerCards[i].cardContainer.style.display = "none";
       playerCards[i] = new DisplayedCard("player" + i);
       playerCards[i].cardContainer.style.display = "none";
    }
    message = document.getElementById("message");
    standButton = document.getElementById("standButton");
    hitButton = document.getElementById("hitButton");
    newGameButton = document.getElementById("newGameButton");
    moneyDisplay = document.getElementById("money");
    money = <%= session.getAttribute("credits") %>;
    moneyDisplay.innerHTML = "$" + money;
    betInput = document.getElementById("bet");
    betInput.value = 10;
    betInput.disabled = false;
    standButton.disabled = true;
    hitButton.disabled = true;
    newGameButton.disabled = false;
}


function dealCard(cards, runOnFinish, faceDown) {
    var crd = deck.nextCard();
    cards.count++;
    if (faceDown)
       cards[cards.count].setFaceDown();
    else
       cards[cards.count].setFaceUp();
    cards[cards.count].setCard(crd);
    new Effect.SlideDown(cards[cards.count].cardContainer, {
       duration: 0.5,
       queue: "end",
       afterFinish: runOnFinish
    });
}

function getTotal(hand) {
   var total = 0;
   var ace = false;
   for (var i = 1; i <= hand.count; i++) {
       total += Math.min(10, hand[i].card.value); 
       if (hand[i].card.value == 1)
          ace = true;
   }
   if (total + 10 <= 21 && ace)
      total += 10;
   return total;
}

function startGame() {
   if (!gameInProgress) {
      var betText = betInput.value;
      if ( ! betText.match(/^[0-9]+$/) || betText < 1 || betText > money) {
          message.innerHTML = "Bet must be a number between 1 and " + money + 
               ".<br>Fix this problem and press New Game again.";
          new Effect.Shake("betdiv");
          return;
      }
      betInput.disabled = true;
      bet = Number(betText);
      for (var i = 1; i <= 5; i++) {
          playerCards[i].cardContainer.style.display = "none";
          playerCards[i].setFaceDown();
          dealerCards[i].cardContainer.style.display = "none";
          dealerCards[i].setFaceDown();
      }
      message.innerHTML = "Dealing Cards";
      deck.shuffle();
      dealerCards.count = 0;
      playerCards.count = 0;
      dealCard(playerCards);
      dealCard(dealerCards);
      dealCard(playerCards);
      dealCard(dealerCards, function() {
             standButton.disabled = false;
             hitButton.disabled = false;
             newGameButton.disabled = true;
             gameInProgress = true;
             var dealerTotal = getTotal(dealerCards);
             var playerTotal = getTotal(playerCards);
             if (dealerTotal == 21) {
                if (playerTotal == 21)
                    endGame(2, "Push");
                else
                    endGame(1, "Dealer has Blackjack.");
             }
             else if (playerTotal == 21)
                endGame(0, "You have Blackjack.");
             else
                message.innerHTML = "You have " + playerTotal +".  Hit or Stand?";
          }, true);
   }
}

function endGame(win, why) {
     if (win==0){
         money += bet;
		 why="You win!";}
     else if(win==1){
         money -= bet;
		 why= "You lose!!";}
     else{
		money=money;
		 why="Tie. It's a push.";
	 }
	 message.innerHTML = (win==0 ? "Awoooooga!!!  " : "  ") + why + 
           (money > 0 ? "<br>Click New Game to play again." : "<br>Looks like you've run out of money!");
     standButton.disabled = true;
     hitButton.disabled = true;
     newGameButton.disabled = true;
     gameInProgress = false;
     if (dealerCards[2].faceDown) {
       dealerCards[2].cardContainer.style.display = "none";
       dealerCards[2].setFaceUp();
       new Effect.SlideDown(dealerCards[2].cardContainer, { duration: 0.5, queue: "end" });
     }
     new Effect.Fade(moneyDisplay, {
        duration: 0.5,
        queue: "end",
        afterFinish: function() {
            moneyDisplay.innerHTML = "$" + money;
            new Effect.Appear(moneyDisplay, {
               duration: 0.5,
               queue: "end",
               afterFinish: function() {
                   if (money <= 0) {
                        betInput.value = "BUSTED";
                        new Effect.Shake(moneyDisplay);
                   }
                   else {
                       if (bet > money)
                          betInput.value = money;
                       standButton.disabled = true;
                       hitButton.disabled = true;
                       newGameButton.disabled = false;
                       betInput.disabled = false;
                   }
               }
            });
        }
     });
}


function dealersTurnAndEndGame() {
    message.innerHTML = "Dealer's turn...";
    dealerCards[2].cardContainer.style.display = "none";
    dealerCards[2].setFaceUp();
    var takeNextCardOrFinish = function() {
       new Effect.SlideDown(dealerCards[dealerCards.count].cardContainer, {
          duration: 0.5,
          queue: "end",
          afterFinish: function() {
              var dealerTotal = getTotal(dealerCards);
              if (dealerCards.count < 5 && dealerTotal <= 16) {
                  dealerCards.count++;
                  dealerCards[dealerCards.count].setCard(deck.nextCard());
		          dealerCards[dealerCards.count].setFaceUp();
                  takeNextCardOrFinish();
              }
              else if (dealerTotal > 21)
                 endGame(0, "Dealer has gone over 21.");
              else if (dealerCards.count == 5)
                 endGame(1, "Dealer took 5 cards without going over 21.");
              else {
                 var playerTotal = getTotal(playerCards);
                 if (playerTotal > dealerTotal)
                    endGame(0, "You have " + playerTotal + ". Dealer has " + dealerTotal + ".");
                 else if (playerTotal < dealerTotal)
                    endGame(1, "You have " + playerTotal + ". Dealer has " + dealerTotal + ".");
                 else
                    endGame(2, "You and the dealer are tied at " + playerTotal + ".");
              }
          }
       });
    };
    takeNextCardOrFinish();
}

function hit() {
   if (!gameInProgress)
      return;
   standButton.disabled = true;
   hitButton.disabled = true;
   dealCard(playerCards, function() {
      var playerTotal = getTotal(playerCards);
      if (playerTotal > 21)
         endGame(1, "YOU WENT OVER 21!");
      else if (playerCards.count == 5)
         endGame(0, "You took 5 cards without going over 21.");
      else if (playerTotal == 21)
         dealersTurnAndEndGame();
      else {
         message.innerHTML = "You have " + playerTotal + ". Hit or Stand?";
         hitButton.disabled = false;
         standButton.disabled = false;
      }
   });
}

function stand() {
   if (!gameInProgress)
      return;
   hitButton.disabled = true;
   standButton.disabled = true;
   dealersTurnAndEndGame();
}

onload=setup;

</script>
</head>
<body>

<img id="head" src="blackjack.jpg" style="width:80%; height: 300px;"></img>

<h1 id="headTitle">Blackjack Party!</h1>

<ul>
	
  <li><a href="javaFinalHome.jsp">My Account</a></li>
  <li><a href="javaFinalGame.jsp">Blackjack</a></li>
  <li><a href="javaFinalStore.html">Store</a></li>
  <li><a href="javaFinalHelp.html">Help</a></li>
  <%  
     if (session.getAttribute("user") != null ) {  
        %><li><a href="LogoutServlet">Sign Out</a></li>  <%
     } else { %><%
     }
 %>
  
 </ul>
<input type='text' id='identifier' value='' style='display:none' />


<p id="test">
</p>

<table align=center cellpadding=0 cellspacing=10 border=0;>
<tr><td>
<div style="position: relative; border: thick solid #660; background-color: #280; width: 579px; height:500px">
    <div style="position: absolute; left:20px; top:15px; color:#9F9; font-size:large">Dealer's cards:</div>
    <div id="dealer1" style="position: absolute; left: 50px; top:50px;  border: 2px solid #660; background-color: #660"></div>
    <div id="dealer2" style="position: absolute; left: 150px; top:50px;  border: 2px solid #660; background-color: #660"></div>
    <div id="dealer3" style="position: absolute; left: 250px; top:50px;  border: 2px solid #660; background-color: #660"></div>
    <div id="dealer4" style="position: absolute; left: 350px; top:50px;  border: 2px solid #660; background-color: #660"></div>
    <div id="dealer5" style="position: absolute; left: 450px; top:50px;  border: 2px solid #660; background-color: #660"></div>
    <div style="position: absolute; left:20px; top:210px; color:#9F9; font-size:large">Your cards:</div>
    <div id="player1" style="position: absolute; left: 50px; top:250px;  border: 2px solid #660; background-color: #660"></div>
    <div id="player2" style="position: absolute; left: 150px; top:250px;  border: 2px solid #660; background-color: #660"></div>
    <div id="player3" style="position: absolute; left: 250px; top:250px;  border: 2px solid #660; background-color: #660"></div>
    <div id="player4" style="position: absolute; left: 350px; top:250px;  border: 2px solid #660; background-color: #660"></div>
    <div id="player5" style="position: absolute; left: 450px; top:250px;  border: 2px solid #660; background-color: #660"></div>
    <div style="position: absolute; left:20px; top: 410px; color:#9F9; font-size:large">You have:</div>
    <div id="money" style="position: absolute; left: 70px; top:445px; color:yellow; font-size:x-large"></div>
    <div id="betdiv" style="position:absolute; left:300px; top:425px">
       <span style="color:#9F9">Your bet:</span>&nbsp; <input type=text size=6 id="bet">
    </div>
</div>
</td></tr>
<tr><td align=center>
<input type=button id="hitButton" value="Hit" onclick="hit()" disabled>
<input type=button id="standButton" value="Stand" onclick="stand()" disabled>
<input type=button id="newGameButton" value="New Game" onClick="startGame()">
</td></tr>
<tr><td align=center>
<span id="message" style="color:#FAFAD2; font-weight:bold">Welcome to Blackjack!<br>Click "New Game" to Begin.</span>
</td></tr>
</table>

</body>