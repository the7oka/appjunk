var random;
var mybirth;
function ageFunction(){
	$.ajax({
			url: "/amioldyet/click",
    		type: 'GET'
		});
	$("#result").css("display","none");
	$("#result2").css("display","none");
	$("#message").css("display","none");
	$("#loader").css("display","block");
	random = Math.floor(Math.random()*11);
	mybirth = new Date(document.getElementById("birth").value);
	window.setInterval(function(){
		$("#loader").css("display","none");
		var now = new Date();
		var age = (now - mybirth);
		years = Math.floor(age/(1000*60*60*24*365));
		days = Math.floor((age-(years*(1000*60*60*24*365)))/(1000*60*60*24));
		hours = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		minutes = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		seconds = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		miliseconds =(age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)+seconds*(1000)));
		daysAll = Math.floor((age)/(1000*60*60*24));
		hoursAll = Math.floor((age)/(1000*60*60));
		minutesAll = Math.floor((age)/(1000*60));
		secondsAll = Math.floor((age)/(1000));
		document.getElementById("result").innerHTML= "You've been alive for <span class='number'>"+years+"</span> years <span class='number'>"+days+"</span> days <span class='number'>"+hours+"</span> hours <span class='number'>"+minutes+"</span> minute and <span class='number'>"+seconds+"</span> seconds "
		$("#result").css("display","block");
		document.getElementById("result2").innerHTML= "You have lived a total of <span class='number'>"+daysAll+"</span> days<br>A total of <span class='number'>"+hoursAll+"</span> hours <br>A total of <span class='number'>"+minutesAll+"</span> minutes<br>A total of <span class='number'>"+secondsAll+"</span> seconds"
		$("#result2").css("display","block");
		var messageOld = ["Damn! you're OLD!",
	"Holy crap you've been living for a very long time now",
	"We should start preparing for your funeral",
	"Your age is closer to my grandma than mine",
	"Soon, young people are going to call you sir",
	"Are you sure you're not dead yet",
	"You don't have much longer..start praying",
	"How do you even know about internet.. You're too old!",
	"Whatever you do.. don't walk into the white light when you see one",
	"I adore old people.. like you",
	"Come sit on my seat, old man"]
		if (years > 18){
			
		document.getElementById("message").innerHTML=messageOld[random];
		
		}
		else {
		document.getElementById("message").innerHTML="Don't worry. You still got it!"	
		}
		$("#message").css("display","block");
	}, 1000);
};