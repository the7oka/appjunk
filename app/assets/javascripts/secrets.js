$(document).ready(function(){
	var last_secret = '';
	$(".hefzbutton").click(function(){
		secret = $('#secret_content').val();
		if (secret.length < 10) {
			$('.alertbox').hide().text("Your secret is too short. Write in a secret between 10 and 255 characters.").fadeIn(500);
		}else if (secret.length > 255){
			$('.alertbox').hide().text("Your secret is too long. Write in a secret between 10 and 255 characters.").fadeIn(500);
		} else if (secret == last_secret) {
			$('.alertbox').hide().text("You can't think of another secret? I'm sure you have at least a few more secrets to share.").fadeIn(500);
		} else {
			$('.alertbox').hide()
			last_secret = secret;
			$('#secret_content').val('');
		$.ajax({
				type: 'POST',
				dataType: "json",
				url: "/secrets",
				data: {
					new_secret: secret
				},
				complete: function (data) {
		        	$('#thesecret').hide().text(data.responseText).fadeIn(500);
		        }
			});
	}
	})

})