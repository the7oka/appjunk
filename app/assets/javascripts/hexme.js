	$(document).ready(function(){
		$('#app').html('Hex');
    	$('#junk').html('Me')
		hexme();
	});
	function showh(x){
		document.getElementById("ho").value = x;
	};
	function shows(x){
		document.getElementById("so").value = x;
	};
	function showl(x){
		document.getElementById("lo").value = x;
	};
	function showa(x){
		document.getElementById("ao").value = x;
	};
	function inh(x){
		document.getElementById("h").value = x;
	};
	function ins(x){
		document.getElementById("s").value = x;
	};
	function inl(x){
		document.getElementById("l").value = x;
	};
	function ina(x){
		document.getElementById("a").value = x;
	};
	function hexme() {
		var h = document.getElementById("ho").value;
		var s = document.getElementById("so").value;
		var l = document.getElementById("lo").value;
		var a = document.getElementById("ao").value;
		document.getElementById("output").style.background = "hsla("+h+","+s+"%,"+l+"%,"+a+")";
		document.getElementById("hsl").innerHTML = "<strong>hsla( "+h+" , "+s+"% , "+l+"% , "+a+" )</strong>";
		$("#s").css("background","linear-gradient(to right, hsla("+h+",0%,"+l+"%,"+a+"),hsla("+h+",100%,"+l+"%,"+a+"))");
		$("#l").css("background","linear-gradient(to right, hsla("+h+","+s+"%,0%,"+a+"),hsla("+h+","+s+"%,50%,"+a+"),hsla("+h+","+s+"%,100%,"+a+"))");
		$("#a").css("background","linear-gradient(to right, hsla("+h+","+s+"%,"+l+"%,0),hsla("+h+","+s+"%,"+l+"%,0.5),hsla("+h+","+s+"%,"+l+"%,1))");
		var H = h;
		var S = s/100;
		var L = l/100;
		hslToRgb(H,S,L);
	};
	function hslToRgb(h,s,l){
		var r,g,b,R,G,B;
		var c = (1-(Math.abs((2*l)-1)))*s;
		var hd = h/60;
		var x = c*(1-Math.abs((hd%2)-1));
		if (hd==0){
			r=b=g=0;
		};
		if (hd==6){
			hd=0;
		};
		if (hd >= 0 && hd < 1){
			r = c;
			g = x;
			b = 0;
		};
		if (hd >= 1 && hd < 2){
			r = x;
			g = c;
			b = 0;
		};
		if (hd >= 2 && hd < 3){
			r = 0;
			g = c;
			b = x;
		};
		if (hd >= 3 && hd < 4){
			r = 0;
			g = x;
			b = c;
		};
		if (hd >= 4 && hd < 5){
			r = x;
			g = 0;
			b = c;
		};
		if (hd >= 5 && hd < 6){
			r = c;
			g = 0;
			b = x;
		};
		var m = l - (0.5*c);
		function round(f){
			var rgb = Math.round((f+m)*256);
			if (rgb == 256){
				rgb = 255;
			};
			return rgb;
		}
		R = round(r);
		G = round(g);
		B = round(b);

    document.getElementById("rgb").innerHTML="<strong>rgba( "+R+" , "+G+" , "+B+" )</strong>";
    rgbToHex(R,G,B);
}
function componentToHex(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
    document.getElementById("hex").innerHTML= "<strong>#" + componentToHex(r) + componentToHex(g) + componentToHex(b)+"</strong>";

}
function copyfun(){
	var stuff = "holy shit";
	stuff.select();
	var successful = document.execCommand('copy',"hello");
};