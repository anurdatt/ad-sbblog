$(document).ready(function () {
	var application = new Application();
	application.highlightSelectedMenu();
	application.highlightMenuSelected();
	application.bindLogo();
	application.setFocus();
})

function Application(){
	//window.confirm("I am executed");
}

Application.prototype.bindLogo = function(){
	$("#logo").draggable({
		revert : true,
		stop : function(event, ui) {
			if(ui.position.left > $("#login").position().left){
				$("#login").fadeIn(700).css("display", "inline-block");
			}
		}
	});	
};


Application.prototype.setFocus = function(){
	var $errors = $(".error");
	
	if($errors.length > 0){
		$("html, body").animate({
			scrollTop : $errors.eq(0).position().top
		}, "slow");
		return;
	}
	
	var $username = $("input[name='j_username']");

	if($username.length >0){
		$username.focus();
	}
};

Application.prototype.highlightMenuSelected = function(){
	var url = document.location.pathname;
	
	
	var $menuitems = $('#nav-menu ul li a');
	if(url.startsWith('/post') || url.startsWith('/blog') || url.startsWith('/comment') 
			|| url.startsWith('/secure/post') || url.startsWith('/secure/comment')){
		//alert(url);
		
		for (var i=0; i<$menuitems.length; i++) {
			if ($menuitems[i].innerText === "Blog") {
				//$($menuitems[i]).addClass('highlight');
				$($menuitems[i]).click();
			}
//			else {
//				$($menuitems[i]).removeClass('highlight');
//			}
		}
	}
	else if (url.startsWith('/about')) {
		for (var i=0; i<$menuitems.length; i++) {
			if ($menuitems[i].innerText === "About") {
				//$($menuitems[i]).addClass('highlight');
				$($menuitems[i]).click();
			}
//			else {
//				$($menuitems[i]).removeClass('highlight');
//			}
		}
	}
	else if (url.startsWith('/login')) {
		for (var i=0; i<$menuitems.length; i++) {
			if ($menuitems[i].innerText === "Admin") {
				$($menuitems[i]).click();
			}
		}
	}
};


Application.prototype.highlightSelectedMenu = function(){
	var $menuitems = $('#nav-menu ul li a');
	$menuitems.click(function(evt) {
		//console.log($(this).context.innerText);
		//	evt.preventDefault();
		var text = $(this).context.innerText;
		for (var i=0; i<$menuitems.length; i++) {
			$($menuitems[i]).removeClass('highlight');
			if ($menuitems[i].innerText === text) {
				$($menuitems[i]).addClass('highlight');
			}
		}
	});
	
}