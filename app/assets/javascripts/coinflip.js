$(document).ready(function(){
	$('#app').html('Coin');
	$('#junk').html(' Flip');
});
var flips = 0;
var clicker = true;
var headsCounter = 0;
var tailsCounter = 0;
var coin = ""
var r = 1
var flipCoin = function () {
if (document.getElementById("fromHeadsToHeads") !== null) {
	document.getElementById("fromHeadsToHeads").id = "defaultHeads";
}
else if (document.getElementById("fromHeadsToTails") !== null) {
	document.getElementById("fromHeadsToTails").id = "defaultTails";
}
else if (document.getElementById("fromTailsToTails") !== null) {
	document.getElementById("fromTailsToTails").id = "defaultTails";
}
else if (document.getElementById("fromTailsToHeads") !== null) {
	document.getElementById("fromTailsToHeads").id = "defaultHeads";
}

if (clicker === true) {
	clicker = false;
setTimeout(flipCoin2,100);
}
}
var flipCoin2 = function() {
		$.ajax({
			url: "/coinflip/click",
    		type: 'GET',
    		success: function(){
    			x = $('#totalnumFlips').html();
    			x = x*1+1
    			$('#totalnumFlips').html(x)

    		}
		});
		flips ++;
		document.getElementById("numFlips").innerHTML = flips;
	var result = Math.floor(Math.random()*2);
	switch (result) {
		case 1 :
				coin = "Heads"
			if (document.getElementById("defaultHeads") !== null) {
				headsCounter ++;
				document.getElementById("defaultHeads").id = "fromHeadsToHeads";
			}
			else if (document.getElementById("defaultTails") !== null) {
				headsCounter ++;
				document.getElementById("defaultTails").id = "fromTailsToHeads";
			}
		break;
		case 0 :
				coin = "Tails"
			if (document.getElementById("defaultHeads") !== null) {
				tailsCounter ++;
				document.getElementById("defaultHeads").id = "fromHeadsToTails";
			}
			else if (document.getElementById("defaultTails") !== null) {
				tailsCounter ++;
				document.getElementById("defaultTails").id = "fromTailsToTails";
			}
		break;
	}
	setTimeout(flipCoin3,1200);
}
var flipCoin3 = function () {
		clicker = true;
		r++
		y =r-headsCounter
		z =r-tailsCounter
		headsprobability = y/(y+z)
		tailsprobability = z/(y+z)
		$('#writtenResult').html('You got '+coin+'<br>Your chance of getting Heads next is '+roundFun(headsprobability)+'%<br>Your chance of getting Tails next is '+roundFun(tailsprobability)+'%')
};
var roundFun = function(number){
	x = number* 10000
	x = Math.round(x)
	x = x/100
	x= x.toFixed(2)
	return x
    }
