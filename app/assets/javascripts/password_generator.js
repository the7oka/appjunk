$(document).ready(function(){
passwordMaker()
$('#app').html('password')
$('#junk').html(' generator')
})
function passwordMaker(){
    var text = "";
    var x = document.getElementById("length").value;
    var lcl ="abcdefghijklmnopqrstuvwxyz";
    var ucl ="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var n = "0123456789";
    var s ="@!&$";
    var mycheck1 = document.getElementById("myCheck1").checked;
    var mycheck2 = document.getElementById("myCheck2").checked;
    var mycheck3 = document.getElementById("myCheck3").checked;
    var mycheck4 = document.getElementById("myCheck4").checked;
    var target = "";
    var myarray = [];
    if (mycheck1 == 1 ){
    	target += lcl
    }
    if (mycheck2 == 1 ){
    	target += ucl
	}
	if (mycheck3 == 1 ){
    	target += n
	}
	if (mycheck4 == 1 ){
    	target += s
	}
	for( var i=0; i < x; i++ ){
	o = target.charAt(Math.floor(Math.random() * target.length));
	myarray[i] = o;
	}
	text = myarray.join("");
    document.getElementById("password").innerHTML = text
};
function clickFunction(){
    $.ajax({
            url: "/random_password_generator/click",
            type: 'GET'
        });
};