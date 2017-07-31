$(document).ready(function(){
			$('#app').html('shopping');
			$('#junk').html(' blacklist');
			$("#logolink").attr("href", "/blacklist");
    var RTL = ['ا','ب','پ','ت','س','ج','چ','ح','خ','د','ذ','ر','ز','ژ','س','ش','ص','ض','ط','ظ','ع','غ','ف','ق','ک','گ','ل','م','ن','و','ه','ی'];
	$(".ctext").each(function() {
    var current = $(this);
    if (RTL.indexOf(current.text().charAt(0)) > -1) {
    	current.toggleClass('ctext rtl');
    }
});
	$('#companychange').click(function(){
    	$('#companymanual').toggle()
    	$('#companyList').toggle()
    	$('#categoryList').toggle()
    	$('#companychange').text( $('#companychange').text() == 'Or enter the company name manually..' ? "Or choose from category list.." : "Or enter the company name manually..");
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
    $('.complaintlink').click(function(){
    	x = $(this).attr('href')
    	console.log('hello'+x)
    	window.location = x
    })
    
})
var pleaseSignIn = function(id){
	$('.cnotice'+id).html('Did you find this complaint valid ?<br><span style="font-weight:normal">Please sign in to be able to vote!</span>')
	console.log('hi')
}
var likeCCFun = function(id){
	if ($('#upArrow'+id).css('background-position') === '0px 0px'){
		$.ajax({
			url:"/blacklist/cclike/"+ id,
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
			url:"/blacklist/ccunlike/"+ id,
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
			url:"/blacklist/ccdislike/"+ id,
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
			url:"/blacklist/ccundislike/"+ id,
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
			url:"/blacklist/validcomplaint/"+ id,
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
			url:"/blacklist/unvalidcomplaint/"+ id,
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
			url:"/blacklist/invalidcomplaint/"+ id,
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
			url:"/blacklist/uninvalidcomplaint/"+ id,
			type: 'GET',
			success: function(){
				$("#cinvalid"+id).toggleClass('btn btn-danger btn btn-default');
			}
		});	
	};
};
var categoryFun = function(){
	$('#welcoming').hide();
	$('#categoriesPanel').show();
}
var reversecategoryFun = function(){
	$('#categoriesPanel').hide();
	$('#welcoming').show();
}
var newCFun = function(){
	$('#welcoming').hide();
	$('#newPanel').show();
}
var reversenewCFun = function(){
	$('#newPanel').hide();
	$('#welcoming').show();
}