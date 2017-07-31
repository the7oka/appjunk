var viewfunction = function(launchtime){
	var now = new Date();
		var age = (launchtime*1 - now*1)
		years = Math.floor(age/(1000*60*60*24*365));
		days = Math.floor((age-(years*(1000*60*60*24*365)))/(1000*60*60*24));
		hours = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)))/(1000*60*60));
		minutes = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)))/(1000*60));
		seconds = Math.floor((age-(years*(1000*60*60*24*365)+days*(1000*60*60*24)+hours*(1000*60*60)+minutes*(1000*60)))/(1000));
		if (days < 10){
			$('#daysview').html("0"+days)
		}else{
			$('#daysview').html(days)
		}
		if (hours < 10){
			$('#hoursview').html("0"+hours)
		}else{
			$('#hoursview').html(hours)
		}
		if (minutes < 10){
			$('#minutesview').html("0"+minutes)
		}else{
			$('#minutesview').html(minutes)
		}
		if (seconds < 10){
			$('#secondsview').html("0"+seconds)
		}else{
			$('#secondsview').html(seconds)
		}
}
$(document).ready(function(){
	var launchtime = new Date(2016, 11, 1, 0, 0, 0);
		viewfunction(launchtime)
	timer = window.setInterval(function(){
		viewfunction(launchtime)
	}, 1000);
		
})