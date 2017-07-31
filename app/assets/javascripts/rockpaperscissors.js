$(document).ready(function(){
	$('#classic').click(function(){
			window.location = "/rockpaperscissors";
		})
	$('#app').html('rock paper scissors');
	$('#junk').html(' lizard spock');
})
//rock=0 paper=1 scissors=2 lizard=3 spock=4  
function rock(){
	$.ajax({
			url: "/rpsls/click",
    		type: 'GET'
		});
	$("#user").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
	document.getElementById("user").innerHTML="";
	document.getElementById("computer").innerHTML="";
	$("#computer").css("display","none");
	$("#loader").css("display","block");
	document.getElementById("result").innerHTML="loading..";
	setTimeout(function(){
		$("#loader").css("display","none");
		$("#computer").css("display","block");

	var c = Math.floor(Math.random()*5);
	switch(c){
		case 0:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
			document.getElementById("result").innerHTML="It's a tie!";
		break;
		case 1:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 2:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 3:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 4:
		case 5:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
	};
}
, 2000);
};
//rock=0 paper=1 scissors=2 lizard=3 spock=4  
function paper(){
	$.ajax({
			url: "/rpsls/click",
    		type: 'GET'
		});
	$("#user").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
	document.getElementById("user").innerHTML="";
	document.getElementById("computer").innerHTML="";
		$("#computer").css("display","none");
	$("#loader").css("display","block");
	document.getElementById("result").innerHTML="loading..";
	setTimeout(function(){
		$("#loader").css("display","none");
		$("#computer").css("display","block");
	var c = Math.floor(Math.random()*5);
	switch(c){
		case 0:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 1:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="It's a tie!";
		break;
		case 2:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 3:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 4:
		case 5:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
	};
	}
, 2000);
};
//rock=0 paper=1 scissors=2 lizard=3 spock=4  
function scissors(){
	$.ajax({
			url: "/rpsls/click",
    		type: 'GET'
		});
	$("#user").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
	document.getElementById("user").innerHTML="";
	document.getElementById("computer").innerHTML="";
		$("#computer").css("display","none");
	$("#loader").css("display","block");
	document.getElementById("result").innerHTML="loading..";
	setTimeout(function(){
		$("#loader").css("display","none");
		$("#computer").css("display","block");
	var c = Math.floor(Math.random()*5);
	switch(c){
		case 0:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 1:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 2:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="It's a tie!";
		break;
		case 3:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 4:
		case 5:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
	};
	}
, 2000);
};
//rock=0 paper=1 scissors=2 lizard=3 spock=4  
function lizard(){
	$.ajax({
			url: "/rpsls/click",
    		type: 'GET'
		});
	$("#user").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
	document.getElementById("user").innerHTML="";
	document.getElementById("computer").innerHTML="";
		$("#computer").css("display","none");
	$("#loader").css("display","block");
	document.getElementById("result").innerHTML="loading..";
	setTimeout(function(){
		$("#loader").css("display","none");
		$("#computer").css("display","block");
	var c = Math.floor(Math.random()*5);
	switch(c){
		case 0:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 1:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 2:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 3:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="It's a tie!";
		break;
		case 4:
		case 5:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
	};
	}
, 2000);
};
//rock=0 paper=1 scissors=2 lizard=3 spock=4  
function spock(){
	$.ajax({
			url: "/rpsls/click",
    		type: 'GET'
		});
	$("#user").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
	document.getElementById("user").innerHTML="";
	document.getElementById("computer").innerHTML="";
		$("#computer").css("display","none");
	$("#loader").css("display","block");
	document.getElementById("result").innerHTML="loading..";
	setTimeout(function(){
		$("#loader").css("display","none");
		$("#computer").css("display","block");
	var c = Math.floor(Math.random()*5);
	switch(c){
		case 0:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"50.01% 20.8%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 1:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"65.8% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 2:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"60.3% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You lose!";
		break;
		case 3:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"40.25% 83.1%","background-size":"710%"});
			document.getElementById("result").innerHTML="You win!";
		break;
		case 4:
		case 5:
			$("#computer").css({"background-image":"url(/assets/maxresdefault.jpg)","background-position":"34.3% 45%","background-size":"710%"});
			document.getElementById("result").innerHTML="It's a tie!";
		break;
	};
	}
, 2000);
};