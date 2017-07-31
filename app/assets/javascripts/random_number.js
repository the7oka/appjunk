$(document).ready(function(){
	$('#app').html('Random');
	$('#junk').html(' Number');
	$('#myCheck').click(function(){
		myFunction();
	})
})
function myFunction() {
	$.ajax({
			url: "/random_number_generator/click",
    		type: 'GET'
		});
var i = document.getElementById("myCheck").checked;
if(i === true){
    var min = document.getElementById("min").value;
	var max = document.getElementById("max").value;
	var x = ((max - min)+1);
	var y = (Math.random()*x);
	var z = Math.floor((min*1)+(y*1));
	document.getElementById("demoss").innerHTML = z;
	}
	else{
	var min = document.getElementById("min").value;
	var max = document.getElementById("max").value;
	var x = ((max - min));
	var y = (Math.random()*x);
	var z = ((min*1)+(y*1));
	document.getElementById("demoss").innerHTML = z;
	}
}