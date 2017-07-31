$(document).ready(function(){
	$('#junk').html('junk shop')
	$('.offerlink').click(function(){
		x = $(this).attr("href")
		window.location = x;
	})
	$(":file").filestyle({icon: false});
});
var validfun = function(id){
	var x = $('#pointscount'+id).html();
	if ($('#vvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/offers/like/"+ id,
			type: 'GET',
			success: function(){
				if ($('#vinvalid'+id).hasClass('btn btn-danger')){
					$('#pointscount'+id).html((x*1)+1);
					$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
				}
				$("#vvalid"+id).toggleClass('btn btn-default btn btn-success');
				var x = $('#pointscount'+id).html();
				$('#pointscount'+id).html((x*1)+1);

			}
		});
};
	if ($('#vvalid'+id).hasClass('btn btn-success')){
		$.ajax({
			url:"/offers/unlike/"+ id,
			type: 'GET',
			success: function(){
				$('#pointscount'+id).html((x*1)-1);
				$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
			}
		});	
	};
};
var invalidfun = function(id){
	var x = $('#pointscount'+id).html();
	if ($('#vinvalid'+id).hasClass('btn btn-default')){
		$.ajax({
			url:"/offers/dislike/"+ id,
			type: 'GET',
			success: function(){
				if ($('#vvalid'+id).hasClass('btn btn-success')) {
					$('#pointscount'+id).html((x*1)-1);
					$("#vvalid"+id).toggleClass('btn btn-success btn btn-default');
				}
				$("#vinvalid"+id).toggleClass('btn btn-default btn btn-danger');
				var x = $('#pointscount'+id).html();
				$('#pointscount'+id).html((x*1)-1);
			}
		});
};
	if ($('#vinvalid'+id).hasClass('btn btn-danger')){
		$.ajax({
			url:"/offers/undislike/"+ id,
			type: 'GET',
			success: function(){
				$('#pointscount'+id).html((x*1)+1);
				$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
			}
		});	
	};
};