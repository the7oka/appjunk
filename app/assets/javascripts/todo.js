$(document).ready(function(){
    $("#addbutton").click(function(){
        $("#taskfield").slideToggle("fast");
        $("#task_title").focus();
    });
    $(".doneboxtoggle").click(function(){
    	$(".deletedbox").slideUp("fast", function(){
    		$(".donebox").slideToggle("slow");
    	});
    });
    $(".deletedboxtoggle").click(function(){
    	$(".donebox").slideUp("fast",function(){
    		$(".deletedbox").slideToggle("slow");
    	});
    });
    $('#app').html('what');
			$('#junk').html(' to-do');
			$("#logolink").attr("href", "/");
});

var deletefunction = function(id){
	$.ajax({
			url:"/todo/delete_task/"+ id,
			type: 'GET',
			success: function(){
				console.log('hi')
				x = $('#notificationdelete').html()
				$('#taskcol'+id).fadeOut("fast", function(){$('.deletedbox').load('/todo/deletedbox');
					$('#alltasksrender').load('/todo/alltasks');
			})
				$('#notificationdelete').html(x*1+1)
				
			}
});
}
var donefunction = function(id){
	$.ajax({
			url:"/todo/done_task/"+ id,
			type: 'GET',
			success: function(){
				console.log('hi')
				$('#taskdone'+id).fadeOut("fast",function(){
					$('#taskdonec'+id).fadeIn("fast", function(){
						$('#taskcol'+id).fadeOut("slow", function(){$('.donebox').load('/todo/donebox');
							$('#alltasksrender').load('/todo/alltasks');
					})
						x = $('#notificationdone').html()
						$('#notificationdone').html(x*1+1)
					})})
			}
});
}
var undonefunction = function(id){
	$.ajax({
			url:"/todo/undone_task/"+ id,
			type: 'GET',
			success: function(){
				console.log('hi')
				$('#taskundone'+id).fadeOut("fast",function(){
					$('#taskundonec'+id).fadeIn("slow", function(){
						$('#taskcoldone'+id).fadeOut("fast", function(){
							$('#alltasksrender').load('/todo/alltasks');
							$('.donebox').load('/todo/donebox')

						})
						x = $('#notificationdone').html()
						$('#notificationdone').html(x*1-1)
						
					})})
			}
});
}
var undeletefunction = function(id){
	$.ajax({
			url:"/todo/undelete_task/"+ id,
			type: 'GET',
			success: function(){
				x = $('#notificationdelete').html()
				$('#taskcoldeleted'+id).fadeOut("fast",function(){
					$('.deletedbox').load('/todo/deletedbox')
					$('#alltasksrender').load('/todo/alltasks');
				})
				$('#notificationdelete').html(x*1-1)
			}
});
}