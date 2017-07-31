$(document).ready(function(){
	$('#app').html('Geometry')
    $('#junk').html(' swiss army knife')
})
function shapeFunction() {
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
    var i = document.getElementById("mySelect").selectedIndex;
	var r = document.getElementById("demo");
	if (i === 1){
	r.innerHTML = "x being square side length:<br><br> Square perimeter = 4*x<br>Square Area = x<sup>2</sup><br><br>Input x in mm: <br><input type='number' id='width' value='0'></input><br><button class='btn' id='squareButton' onClick='squareResult()'>Calculate Everything</button>";
	}
	else if (i === 2) {
	r.innerHTML = "x,y being rectangle width and length:<br><br> Rectangle perimeter = 2*x+2*y<br>Rectangle Area = x*y<br><br>Input x in mm: <br><input type='number' id='width' value='0'><br>Input y in mm: <br><input type='number' id='length' value='0'></input><br><button class='btn' id='squareButton' onClick='rectangleResult()'>Calculate Everything</button>";
	}
	else if (i === 3){
	r.innerHTML = "x,y being Trianglr base length and side length and &#952; being the angle in between:<br><br> triangle area = 1/2*x*y*sin&#952;<br><br>Input x in mm: <br><input type='number' id='width' value='0'><br>Input y in mm: <br><input type='number' id='length' value='0'></input><br>Input &#952; in deg: <br><input type='number' id='height' value='0'></input><br><button class='btn' id='squareButton' onClick='triangleResult()'>Calculate Everything</button>";
	}
	else if (i === 4){
	r.innerHTML = "x being parallelogram base length and y being parallelogram height:<br><br> parallelogram area = x * h<br><br>Input x in mm: <br><input type='number' id='width' value='0'><br>Input h in mm: <br><input type='number' id='length' value='0'></input><br><button class='btn' id='squareButton' onClick='parallelogramResult()'>Calculate Everything</button>";
	}
	else if (i=== 5){
	r.innerHTML = "r being circle radius:<br><br> Circle perimeter = 2*&#960;*r<br>Circle Area = &#960;*r<sup>2</sup><br><br>Input r in mm: <br><input type='number' id='width' value='0'></input><br><button class='btn' id='squareButton' onClick='circleResult()'>Calculate Everything</button>";
	}
	else if (i === 6){
	r.innerHTML = "r being circle radius:<br><br> Sphere area = 4*&#960;*r<sup>2</sup><br>Sphere volume = (4/3)*&#960;*r<sup>3</sup><br><br>Input r in mm: <br><input type='number' id='width' value='0'></input><br><button class='btn' id='squareButton' onClick='sphereResult()'>Calculate Everything</button>";
	}
	else if (i===7){
	r.innerHTML = "r being cylinder radius <br>and h being cylinder height:<br><br> Cylinder surface area = 2*&#960;*r*h + 2*&#960;*r<sup>2</sup><br>Cylinder volume = &#960;*r<sup>3</sup>*h <br><br>Input r in mm: <br><input type='number' id='width' value='0'><br>Input h in mm: <br><input type='number' id='length' value='0'></input><br><button class='btn' id='squareButton' onClick='cylinderResult()'>Calculate Everything</button>";
	}
	else if (i === 8){
	r.innerHTML = "x being Cube side length:<br><br> Cube surface area = 6*x<sup>2</sup><br>Cube volume = x<sup>3</sup><br><br>Input x in mm: <br><input type='number' id='width' value='0'></input><br><button class='btn' id='squareButton' onClick='cubeResult()'>Calculate Everything</button>";
	}
	else if (i === 9){
	r.innerHTML = "x,y,z being ellipsoid semi-axes length:<br><br> Ellipsoid valume = 4/3*&#960;*x*y*z<br><br>Input x in mm: <br><input type='number' id='width' value='0'><br>Input y in mm: <br><input type='number' id='length' value='0'></input><br>Input z in mm: <br><input type='number' id='height' value='0'></input><br><button class='btn' id='squareButton' onClick='ellipsoidResult()'>Calculate Everything</button>";
	}
}
function squareResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	document.getElementById("demos").innerHTML = "Square parimeter = "+ (x*4)+ " mm<br>Square area = "+(x*x)+" mm<sup>2</sup>";
}
function rectangleResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	y = document.getElementById("length").value;
	document.getElementById("demos").innerHTML = "Rectangle parimeter = "+ ((x*2)+(y*2))+ " mm<br>Rectangle area = "+(x*y)+" mm<sup>2</sup>";
}
function triangleResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	y = document.getElementById("length").value;
	z = document.getElementById("height").value;
	document.getElementById("demos").innerHTML = "Triangle volume = "+((1/2)*x*y*Math.sin((z*Math.PI)/180))+" mm<sup>3</sup>";
}
function parallelogramResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	h = document.getElementById("length").value;
	document.getElementById("demos").innerHTML = "parallelogram area = "+ (x*h)+ " mm<sup>2</sup>";
}
function circleResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	document.getElementById("demos").innerHTML = "Circle parimeter = "+ (2*Math.PI*x)+ " mm<br>Circle area = "+(Math.PI*x*x)+" mm<sup>2</sup>";
}
function sphereResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	document.getElementById("demos").innerHTML = "Sphere area = "+ (4*Math.PI*x*x)+ " mm<br>Circle volume = "+((4/3)*Math.PI*x*x*x)+" mm<sup>2</sup>";
}
function cubeResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	document.getElementById("demos").innerHTML = "Cube area = "+ (6*x*x)+ " mm<sup>2</sup><br>Cube volume = "+(x*x*x)+" mm<sup>3</sup>";
}
function cylinderResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	h = document.getElementById("length").value;
	document.getElementById("demos").innerHTML = "Cylinder surface area = "+ ((2*Math.PI*x*h)+(2*Math.PI*x*x))+ " mm<br>Cylinder volume = "+(Math.PI*x*x*h)+" mm<sup>2</sup>";
}
function ellipsoidResult(){
	$.ajax({
			url: "/geometry_formulas/click",
    		type: 'GET'
		});
	x = document.getElementById("width").value;
	y = document.getElementById("length").value;
	z = document.getElementById("height").value;
	document.getElementById("demos").innerHTML = "Ellipsoid volume = "+((4/3)*Math.PI*x*y*z)+" mm<sup>3</sup>";
}