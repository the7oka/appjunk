$(document).ready(function(){
	$('#app').html('tweeta');
	$('#junk').html('mela5er');
	$("a.embed").oembed(null,{
   	includeHandle: false
   });
	$('#newbutton').click(function(){
		$('#tweetamela5erintro').css('display','none')
		$('#tweetamela5ernew').css('display','block')
	})
		$('#gobackbutton').click(function(){
		$('#tweetamela5ernew').css('display','none')
		$('#tweetamela5erintro').css('display','block')
	})
		$('#unapprovedpage').click(function(){
		window.location = '/tweetamela5er/unapproved'
	})
		$('#approvedpage').click(function(){
		window.location = '/tweetamela5er'
	})
		$('.approvedbutton').click(function(){
    	x = $(this).attr('href')
    	y = $(this).attr('id')
    	$.ajax({
    		url: x,
    		type: 'GET',
    		success: function(){
    			$('#'+y).fadeOut()
    		}
    	})
    })
		$('.deletebutton').click(function(){
    	x = $(this).attr('href')
    	y = $(this).attr('id')
    	$.ajax({
    		url: x,
    		type: 'GET',
    		success: function(){
    			$('#'+y).fadeOut()
    		}
    	})
    })
})
var likeCCFun = function(id){
	if ($('#upArrow'+id).css('background-position') === '0px 0px'){
		$.ajax({
			url:"/tweetamela5er/cclike/"+ id,
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
			url:"/tweetamela5er/ccunlike/"+ id,
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
			url:"/tweetamela5er/ccdislike/"+ id,
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
			url:"/tweetamela5er/ccundislike/"+ id,
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
	var x = $('#pointscount'+id).html();
	if ($('#vvalid'+id).hasClass('btn btn-default')){
		console.log('hi')
		$.ajax({
			url:"/tweetamela5er/like/"+ id,
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
			url:"/tweetamela5er/unlike/"+ id,
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
			url:"/tweetamela5er/dislike/"+ id,
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
			url:"/tweetamela5er/undislike/"+ id,
			type: 'GET',
			success: function(){
				$('#pointscount'+id).html((x*1)+1);
				$("#vinvalid"+id).toggleClass('btn btn-danger btn btn-default');
			}
		});	
	};
};
var likeCCFun = function(id){
	if ($('#upArrow'+id).css('background-position') === '0px 0px'){
		$.ajax({
			url:"/tweetamela5er/cclike/"+ id,
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
			url:"/tweetamela5er/ccunlike/"+ id,
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
			url:"/tweetamela5er/ccdislike/"+ id,
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
			url:"/tweetamela5er/ccundislike/"+ id,
			type: 'GET',
			success: function(){
				var x = $('#comment'+id).html();
				$('#comment'+id).html((x*1)+1);
				$('#downArrow'+id).css('background-position', '-20px 0px');
			}
			
		});
	}
};