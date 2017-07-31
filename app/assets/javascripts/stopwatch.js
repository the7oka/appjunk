$(document).ready(function(){
	$('#app').html('stop');
			$('#junk').html('watch');
			$("#logolink").attr("href", "/stopwatch");
	$(".stopwatchcontainer").click(function() {
		console.log('hey')
		$(".titlescontainer").css("display", "none")
		$(".stopwatchelements").css("display", "block")
		$(".choosepanel").css("display", "block")
		$(".choosepaneltimer").css("background-color", "grey")
	});	
	$( ".timercontainer" ).click(function() {
		$( ".titlescontainer" ).css("display", "none")
		$( ".timerelements" ).css("display", "block")
		$(".choosepanel").css("display", "block")
		$(".choosepanelstopwatch").css("background-color", "grey")
	});	
	$('#timerseconds').change(function(){
		x = $('#timerseconds').val();
		if (x < 10){
			$('#timerseconds').val("0"+x);
		}
	})
	$('#timerminutes').change(function(){
		y = $('#timerminutes').val();
		if (y < 10){
			$('#timerminutes').val("0"+y);
		}
	})
	$('#timerhours').change(function(){
		z = $('#timerhours').val();
		if (z < 10){
			$('#timerhours').val("0"+z);
		}
	})
	$('#timermilliseconds').change(function(){
		u = $('#timermilliseconds').val();
		if (u < 10){
			$('#timermilliseconds').val("00"+u);
		}
	})
	$('.choosepaneltimer').click(function(){
		resetfunction();
		$(".stopwatchelements").css("display", "none")
		$( ".timerelements" ).css("display", "block")
		$(".choosepanelstopwatch").css("background-color", "grey")
		$(".choosepaneltimer").css("background-color", "#e6e6e6")
	})
	$('.choosepanelstopwatch').click(function(){
		$(".stopwatchelements").css("display", "block")
		$( ".timerelements" ).css("display", "none")
		$(".choosepanelstopwatch").css("background-color", "#e6e6e6")
		$(".choosepaneltimer").css("background-color", "grey")
	})
})
var convert = function(mill){
	years = Math.floor(mill/(1000*60*60*24*365));
	days = Math.floor((mill-(years*(1000*60*60*24*365)))/(1000*60*60*24));
	hours = Math.floor((mill-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		if (hours<10){
			hours="0"+hours
		}
		minutes = Math.floor((mill-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		if (minutes<10){
			minutes="0"+minutes
		}
		seconds = Math.floor((mill-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		if (seconds < 10){
			seconds="0"+seconds
		}
		milliseconds =Math.floor((mill-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)+seconds*(1000))));
		if (milliseconds<10){
			milliseconds ="00"+milliseconds
		}
		else if(milliseconds<100){
			milliseconds ="0"+milliseconds
		}
		return hours+":"+minutes+":"+seconds+":"+milliseconds
}
var startfunction = function(){
		$("#startbutton").attr("onclick","pausefunction()");
		$("#startbutton").html("Stop");
		$("#resetbutton").html("Lap");
		$("#resetbutton").attr("onclick","lapfunction()");
		var zaman = new Date();
timer = window.setInterval(function(){
		var now = new Date();
		age = (now - zaman);
		lapzaman = $('#laptimeall').html();
		lapage = (age - lapzaman*1)
		years = Math.floor(age/(1000*60*60*24*365));
		days = Math.floor((age-(years*(1000*60*60*24*365)))/(1000*60*60*24));
		hours = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		minutes = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		seconds = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		milliseconds =Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)+seconds*(1000))));
		if (hours < 10){
		$('#hours').html("0"+hours)
	}else{
		$('#hours').html(hours)
	}
	if (minutes < 10){
		$('#minutes').html("0"+minutes)
	}else{
		$('#minutes').html(minutes)
	}
	if (seconds < 10){
		$('#seconds').html("0"+seconds)
	}else{
		$('#seconds').html(seconds)
	}
	if (milliseconds < 10){
		$('#milliseconds').html("00"+milliseconds)
	}
	else if ( milliseconds < 100){
		$('#milliseconds').html("0"+milliseconds)
	}
	else{
		$('#milliseconds').html(milliseconds)
	}
	lapyears = Math.floor(lapage/(1000*60*60*24*365));
		lapdays = Math.floor((lapage-(lapyears*(1000*60*60*24*365)))/(1000*60*60*24));
		laphours = Math.floor((lapage-(lapyears*(1000*60*60*24*365)+lapdays*(1000*60*60*24)))/(1000*60*60));
		lapminutes = Math.floor((lapage-(lapyears*(1000*60*60*24*365)+lapdays*(1000*60*60*24)+laphours*(1000*60*60)))/(1000*60));
		lapseconds = Math.floor((lapage-(lapyears*(1000*60*60*24*365)+lapdays*(1000*60*60*24)+laphours*(1000*60*60)+lapminutes*(1000*60)))/(1000));
		lapmilliseconds =Math.floor((lapage-(lapyears*(1000*60*60*24*365)+lapdays*(1000*60*60*24)+laphours*(1000*60*60)+lapminutes*(1000*60)+lapseconds*(1000))));
		if (laphours < 10){
		$('#laphours').html("0"+laphours)
	}else{
		$('#laphours').html(laphours)
	}
	if (lapminutes < 10){
		$('#lapminutes').html("0"+lapminutes)
	}else{
		$('#lapminutes').html(lapminutes)
	}
	if (lapseconds < 10){
		$('#lapseconds').html("0"+lapseconds)
	}else{
		$('#lapseconds').html(lapseconds)
	}
	if (lapmilliseconds < 10){
		$('#lapmilliseconds').html("00"+lapmilliseconds)
	}
	else if ( lapmilliseconds < 100){
		$('#lapmilliseconds').html("0"+lapmilliseconds)
	}
	else{
		$('#lapmilliseconds').html(lapmilliseconds)
	}
		$('#millisecondsall').html(age)
		laptimeall = $('#laptimeall').html()
		$('#laptime').html(age - laptimeall*1)
	}, 101);
};
var lapfunction = function(){
	var lapcount = $('#lapcount').html();
	lapcount = lapcount*1 +1
	$('#lapcount').html(lapcount);
	var laptime = $('#laptime').html();
	$('#laptimeview').append("<div class='col-sm-6 col-xs-4'>Lap"+lapcount+": </div><div class='col-sm-6 col-xs-8'>"+convert(laptime)+"</div>");
	var laptimeall = $('#laptimeall').html();
	laptimeall = laptimeall*1 +laptime*1;
	$('#laptimeall').html(laptimeall);
	max = ($('#max').html())*1;
	min = ($('#min').html())*1;
	average = ($('#average').html())*1;
	if (lapcount > 1){
    		if ( laptime > max){
    			max = laptime
    			$('#maxview').html("<div class='col-sm-6 col-xs-4'>Longest Lap: </div><div class='col-sm-6 col-xs-8'>"+convert(max)+"</div>");
    			$('#max').html(max);
    		}
    		if (laptime < min){
    			min = laptime
    			$('#minview').html("<div class='col-sm-6 col-xs-4'>Shortest Lap: </div><div class='col-sm-6 col-xs-8'>"+convert(min)+"</div>");
    			$('#min').html(min);
    		}
    	}else{
    		max = laptime
    		min = laptime
    		average = laptime
    		$('#maxview').html("<div class='col-sm-6 col-xs-4'>Longest Lap: </div><div class='col-sm-6 col-xs-8'>"+convert(max)+"</div>");
    		$('#minview').html("<div class='col-sm-6 col-xs-4'>Shortest Lap: </div><div class='col-sm-6 col-xs-8'>"+convert(min)+"</div>");
    		$('#max').html(max);
    		$('#min').html(min);
    		$('#average').html("<div class='col-sm-6 col-xs-4'>Average time: </div><div class='col-sm-6 col-xs-8'>"+convert(average)+"</div>");
    	}
    	$('#minview').css("display","block")
    	$('#maxview').css("display","block")
    	average = (laptimeall*1)/(lapcount*1)
    	$('#average').html("<div class='col-sm-6 col-xs-4'>Average time: </div><div class='col-sm-6 col-xs-8'>"+convert(average)+"</div>");
    	$('#average').css("display","block")
    	$('.statisticsbox').css("display","block")
}
var pausefunction = function(){
	clearInterval(timer);
	$("#resetbutton").html("Reset");
	$("#resetbutton").attr("onclick","resetfunction()");
	$("#startbutton").attr("onclick","unpausefunction()");
	$("#startbutton").html("Start");
}
var unpausefunction = function(){
	$("#resetbutton").html("Lap");
	$("#resetbutton").attr("onclick","lapfunction()");
	$("#startbutton").attr("onclick","pausefunction()");
	$("#startbutton").html("Stop");
	var millisecondsall = $('#millisecondsall').html();
	var now = new Date();
	var zaman = (now - millisecondsall);
	timer = window.setInterval(function(){
		var now = new Date();
		age = (now - zaman);
		years = Math.floor(age/(1000*60*60*24*365));
		days = Math.floor((age-(years*(1000*60*60*24*365)))/(1000*60*60*24));
		hours = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		minutes = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		seconds = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		milliseconds =Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)+seconds*(1000))));
		if (hours < 10){
		$('#hours').html("0"+hours)
	}else{
		$('#hours').html(hours)
	}
	if (minutes < 10){
		$('#minutes').html("0"+minutes)
	}else{
		$('#minutes').html(minutes)
	}
	if (seconds < 10){
		$('#seconds').html("0"+seconds)
	}else{
		$('#seconds').html(seconds)
	}
	if (milliseconds < 10){
		$('#milliseconds').html("00"+milliseconds)
	}else{
		$('#milliseconds').html(milliseconds)
	}
		$('#millisecondsall').html(age)
		laptimeall = $('#laptimeall').html()
		$('#laptime').html(age - laptimeall*1)
	}, 101);
}
var resetfunction = function(){
	if(typeof timer !== 'undefined'){
	clearInterval(timer);
	}
	$("#startbutton").attr("onclick","startfunction()");
	$("#startbutton").html("Start");
	$('#hours').html("00")
	$('#minutes').html("00")
	$('#seconds').html("00")
	$('#milliseconds').html("000")
	$('#millisecondsall').html("000")
	$('#laptimeall').html("0")
	$('#laptime').html("0")
	$('#lapcount').html("0")
	$('#laptimeview').html("")
	$('#min').html("0");
    $('#max').html("0");
    $('#minview').css("display","none");
    $('#maxview').css("display","none");
    $('#laphours').html("00")
	$('#lapminutes').html("00")
	$('#lapseconds').html("00")
	$('#lapmilliseconds').html("000")
	$('.statisticsbox').css("display","none");
}


var timerfunction = function(){
	var audioElement = document.createElement('audio');
        audioElement.setAttribute('src', '/assets/Annoying_Alarm_Clock.mp3');
        audioElement.load();
	hours = $('#timerhours').val();
	minutes = $('#timerminutes').val();
	seconds = $('#timerseconds').val();
	age = (hours*1000*60*60)+(minutes*1000*60)+(seconds*1000)+1000;
	if (age > 1000){
		$("#timerstartbutton").attr("onclick","timerstopfunction()");
		$("#timerstartbutton").html("Stop");
	var now = new Date();
	var future = (now*1+ age);
	timer2 = window.setInterval(function(){
		now = new Date();
		age = (future - now);
		years = Math.floor(age/(1000*60*60*24*365));
		days = Math.floor((age-(years*(1000*60*60*24*365)))/(1000*60*60*24));
		hours = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		minutes = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		seconds = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		milliseconds =Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)+seconds*(1000))));
		if (hours < 10){
			$('#timerhours').val("0"+hours)
		}else{
		$('#timerhours').val(hours)
		}
		if (minutes < 10){
			$('#timerminutes').val("0"+minutes)
		}else{
		$('#timerminutes').val(minutes)
		}
		if (seconds < 10){
			$('#timerseconds').val("0"+seconds)
		}else{
		$('#timerseconds').val(seconds)
		}
		if (milliseconds < 10){
			$('#timermilliseconds').val("00"+milliseconds)
		}else{
		$('#timermilliseconds').val(milliseconds)
		}
		$('#millisecondsall').html(age)
		if (age < 900){
			clearInterval(timer2);
			console.log("time is up");
			$("#timerstartbutton").attr("onclick","timerresetfunction()");
			$("#timerstartbutton").html("OK");
			$('#timermilliseconds').val("000")
			audioElement.play();
			$( "#timerstartbutton" ).click(function() {
				audioElement.pause();
			});
			$( "#timerresetbutton" ).click(function() {
				audioElement.pause();
			});
        };
	}, 101);
};
}
var timerresetfunction = function(){
	clearInterval(timer2);
	$('#timerhours').val("00")
	$('#timerminutes').val("00")
	$('#timerseconds').val("00")
	$('#timermilliseconds').val("000")
	$('#millisecondsall').html("00")
	$("#timerstartbutton").attr("onclick","timerfunction()");
	$("#timerstartbutton").html("Start");
}
var timerstopfunction = function(){
	clearInterval(timer2);
	$("#timerstartbutton").attr("onclick","timerfunction()");
	$("#timerstartbutton").html("Start");
}