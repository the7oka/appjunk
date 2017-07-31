$(document).ready(function(){
	$('#junk').html('junk videos');
	$('#junk').css('color','white')
	$("#logolink").attr("href", "/videos");
})
var likeCCFun = function(id){
	if ($('#upArrow'+id).css('background-position') === '0px 0px'){
		$.ajax({
			url:"/videos/cclike/"+ id,
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
			url:"/videos/ccunlike/"+ id,
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
			url:"/videos/ccdislike/"+ id,
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
			url:"/videos/ccundislike/"+ id,
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
	if ($('#vvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/videos/like/"+ id,
			type: 'GET',
			success: function(){
				if ($('#vinvalid'+id).hasClass('btn btn-danger')){
					$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
				}
				$("#vvalid"+id).toggleClass('btn btn-default btn btn-success');
			}
		});
};
	if ($('#vvalid'+id).hasClass('btn btn-success')){
		$.ajax({
			url:"/videos/unlike/"+ id,
			type: 'GET',
			success: function(){
				$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
			}
		});	
	};
};
var invalidfun = function(id){
	if ($('#vinvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/videos/dislike/"+ id,
			type: 'GET',
			success: function(){
				if ($('#vvalid'+id).hasClass('btn btn-success')) {
					$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
				}
				$("#vinvalid"+id).toggleClass('btn btn-default btn btn-danger');
			}
		});
};
	if ($('#vinvalid'+id).hasClass('btn btn-danger')){
		$.ajax({
			url:"/videos/undislike/"+ id,
			type: 'GET',
			success: function(){
				$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
			}
		});	
	};
};