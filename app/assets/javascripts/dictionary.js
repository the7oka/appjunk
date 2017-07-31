$(document).ready(function(){
var num = Math.floor(Math.random()*5)
	$('#wewantyouphoto').css('background-image','url("/assets/wwy'+num+'")')
})
$(document).ready(function(){
	$('#app').html('evolved');
	$('#junk').html(' Dictionary');
	$("#logolink").attr("href", "/dictionary");
})
var randompage = function(){

	window.location = '/dictionary/random'
}
var validfun = function(id){
	if ($('#vvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/definition/like/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#likes'+id).html();
				var y = $('#dislikes'+id).html();
				if ($('#vinvalid'+id).hasClass('btn btn-danger')){
					$('#dislikes'+id).html((y*1)-1);
					$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
				}
				$("#vvalid"+id).toggleClass('btn btn-default btn btn-success');
				$('#likes'+id).html((x*1)+1);
			}
		});
};
	if ($('#vvalid'+id).hasClass('btn btn-success')){
		$.ajax({
			url:"/definition/unlike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#likes'+id).html();
				$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
				$('#likes'+id).html((x*1)-1);
			}
		});	
	};
};
var invalidfun = function(id){
	if ($('#vinvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/definition/dislike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#likes'+id).html();
				var y = $('#dislikes'+id).html();
				if ($('#vvalid'+id).hasClass('btn btn-success')) {
					$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
					$('#likes'+id).html((x*1)-1);
				}
				$("#vinvalid"+id).toggleClass('btn btn-default btn btn-danger');
				$('#dislikes'+id).html((y*1)+1);
			}
		});
};
	if ($('#vinvalid'+id).hasClass('btn btn-danger')){
		$.ajax({
			url:"/definition/undislike/"+ id,
			type: 'GET',
			success: function(){
				var y = $('#dislikes'+id).html();
				$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
				$('#dislikes'+id).html((y*1)-1);
			}
		});	
	};
};
var fillfunction = function(word){
	$('#word_word').val(word)
}