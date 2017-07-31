$(document).ready(function(){
			$(":file").filestyle({icon: false});
			$(":file").filestyle('size', 'sm');
	})
var likeCCFun = function(id){
	if ($('#upArrow'+id).css('background-position') === '0px 0px'){
		$.ajax({
			url:"/profile/cclike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#comment'+id).html();
				if ($('#downArrow'+id).css('background-position') === '-20px 0px'){
				$('#comment'+id).html((x*1)+1);
				$('#upArrow'+id).css('background-position', '0px -40px');
				$('#downArrow'+id).css('background-position', '-20px 0px');
				}
				else if ($('#downArrow'+id).css('background-position') === '-20px -40px'){
					$('#comment'+id).html((x*1)+2);
				$('#upArrow'+id).css('background-position', '0px -40px');
				$('#downArrow'+id).css('background-position', '-20px 0px');
				}
			}
			
		});
	}
	else if ($('#upArrow'+id).css('background-position') === '0px -40px'){
		$.ajax({
			url:"/profile/ccunlike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#comment'+id).html();
				$('#comment'+id).html((x*1)-1);
				$('#upArrow'+id).css('background-position', '0px 0px');
			}
			
		});
	}
};
var dislikeCCFun = function(id){
	if ($('#downArrow'+id).css('background-position') === '-20px 0px'){
		$.ajax({
			url:"/profile/ccdislike/"+ id,
			type: 'GET',
			success: function(){
				if ($('#upArrow'+id).css('background-position') === '0px 0px'){
				var x = $('#comment'+id).html();
				$('#comment'+id).html((x*1)-1);
				$('#downArrow'+id).css('background-position', '-20px -40px');
				$('#upArrow'+id).css('background-position', '0px 0px');
				}
				else if ($('#upArrow'+id).css('background-position') === '0px -40px'){
					var x = $('#comment'+id).html();
				$('#comment'+id).html((x*1)-2);
				$('#downArrow'+id).css('background-position', '-20px -40px');
				$('#upArrow'+id).css('background-position', '0px 0px');
				}
			}
			
		});
	}
	else if ($('#downArrow'+id).css('background-position') === '-20px -40px'){
		$.ajax({
			url:"/profile/ccundislike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#comment'+id).html();
				$('#comment'+id).html((x*1)+1);
				$('#downArrow'+id).css('background-position', '-20px 0px');
			}
			
		});
	}
};
var validfun = function(id){
	if ($('#cvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/profile/validpost/"+ id,
			type: 'GET',
			success: function(){
				if ($('#cinvalid'+id).hasClass('btn btn-danger')){
					$("#cinvalid"+id).toggleClass('btn btn-danger btn btn-default');
				}
				$("#cvalid"+id).toggleClass('btn btn-default btn btn-success');
			}
		});
};
	if ($('#cvalid'+id).hasClass('btn btn-success')){
		$.ajax({
			url:"/profile/unvalidpost/"+ id,
			type: 'GET',
			success: function(){
				$("#cvalid"+id).toggleClass('btn btn-success btn btn-default');
			}
		});	
	};
};
var invalidfun = function(id){
	if ($('#cinvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/profile/invalidpost/"+ id,
			type: 'GET',
			success: function(){
				if ($('#cvalid'+id).hasClass('btn btn-success')) {
					$("#cvalid"+id).toggleClass('btn btn-success btn btn-default');
				}
				$("#cinvalid"+id).toggleClass('btn btn-default btn btn-danger');
			}
		});
};
	if ($('#cinvalid'+id).hasClass('btn btn-danger')){
		$.ajax({
			url:"/profile/uninvalidpost/"+ id,
			type: 'GET',
			success: function(){
				$("#cinvalid"+id).toggleClass('btn btn-danger btn btn-default');
			}
		});	
	};
};
var deletepost = function(id){
	x = confirm ('Do you really want to delete this post ?')
	if (x = true){
	$.ajax({
			url:"/profile/deletepost/"+ id,
			type: 'GET',
			success: function(){
				$('#postnumber'+id).fadeOut('slow')
			}
		});
}
}