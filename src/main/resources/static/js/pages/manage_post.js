$(document).ready(function() {
	var myTinyMce = new MyTinyMce("post-editor");
	myTinyMce.load();
	
	$(".tag-editor").sbTagEditor();
	
	var postId = $("#postId").val();
	if (postId) {
		var url = sbRoot + "/post/" + postId + "/tags";
		$(".tag-editor").sbTagEditor("load", url);
	}

	$("input").eq(0).focus();
})
