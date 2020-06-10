function MyTinyMce(id){
	this.id = id;
}

MyTinyMce.prototype.load = function(){
	var that = this;
	tinyMCE.init({
		
		toolbar : "imageupload",
        setup: function(editor) {
            var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
            $(editor.getElement()).parent().append(inp);

            inp.on("change",function(){
                var input = inp.get(0);
                var file = input.files[0];
                var fr = new FileReader();
                fr.onload = function() {
                    var img = new Image();
                    img.src = fr.result;
                    editor.setContent(editor.getContent() + '<img src="'+img.src+'"/>');
                    //tinyMCEPopup.editor.execCommand('mceInsertContent', false, '<img src="'+img.src+'"/>');
                    inp.val('');
                }
                fr.readAsDataURL(file);
            });

            editor.addButton( 'imageupload', {
                text:"IMAGE",
                icon: 'image',
                image: '/libraries/tiny_mce/img/jbimages-bw.gif',
                onclick: function(e) {
                    inp.trigger('click');
                }
            });
        },
	
		mode: "exact",
		elements: that.id,
		theme: "advanced",
		plugins : "fullscreen,autolink,lists,save,advimage,advlink,inlinepopups,preview,contextmenu,directionality, noneditable,nonbreaking,template,syntaxhl,preelementfix",

		// Theme options
        theme_advanced_buttons1 : "save,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect,syntaxhl",
        theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,blockquote,nonbreaking,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,preview,|,forecolor,backcolor,|,imageupload,|,fullscreen",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
        
        // Skin options
        skin : "o2k7",
        skin_variant : "silver",
        
        //Allow Tabs
        nonbreaking_force_tab: true,

        //Required by jbimages to display images properly
        relative_urls : false,
        
        // Drop lists for link/image/media/template dialogs
        template_external_list_url : "js/template_list.js",
        external_link_list_url : "js/link_list.js",
        external_image_list_url : "js/image_list.js",
        media_external_list_url : "js/media_list.js",
        
	});
};