$(document).ready(function(){
	$('#app').html('Garag');
	$('#junk').html('ak');
	$("#logolink").attr("href", "/garagak");
	$('.sellcontainer').click(function(){
		window.location = "/garagak/new";
	})
	$('.buycontainer').click(function(){
		window.location = "/garagak/search";
	})
	c="";
	carmodels = $('#carmodelList').html();
	$('#carmodelList').html("<option value="+c+">Select a carbrand first</option>")
	options= null;
	carbrand = $('#carbrandList :selected').text();
		options = $(carmodels).filter("optgroup[label="+'"'+carbrand+'"'+"]").html();
	$('#carbrandList').change(function() {
		carbrand = $('#carbrandList :selected').text();
		options = $(carmodels).filter("optgroup[label="+'"'+carbrand+'"'+"]").html();
		if (options == null){
			$('#carmodelList').html("<option value="+c+">Select a carbrand first</option>")
		}
		else{
			$('#carmodelList').html(options)
		}
		});
	areas = $('#areaList').html();
	$('#areaList').html("<option value="+c+">Select a city first</option>")
	options= null;
	city = $('#cityList :selected').text();
		options = $(areas).filter("optgroup[label="+'"'+city+'"'+"]").html();
		$('#cityList').change(function() {
		city = $('#cityList :selected').text();
		options = $(areas).filter("optgroup[label="+'"'+city+'"'+"]").html();
		if (options == null){
			$('#areaList').html("<option value="+c+">Select a city first</option>")
		}
		else{
			$('#areaList').html(options)
		}
		});

})