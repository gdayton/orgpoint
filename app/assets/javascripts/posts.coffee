# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).ready(function() {
    $('#expand').click(function(){
        $('#hide').toggle();
    });
});`

`$(document).ready(function() {
	var initPostLimit = 141;
	var extraTextAvail = "...";
	var moreLabel = "more";
	var lessLabel = "less";	

	$('.post-content').each(function(){
		var content = $(this).html();

		if(content.length > initPostLimit) {
			var initContent = content.substring(0, initPostLimit);
			var extraContent = content.substring(initPostLimit, content.length);

			var appendHtml = initContent + '<span class="moreelipses">'+extraTextAvail+'</span>&nbsp;<span class="post-content-hidden"><span>'
					   + extraContent + '</span>&nbsp;&nbsp;<a href="" class="post-continue">'+moreLabel+'</a></span>';

			$(this).html(appendHtml);
		}
	});

	$(".post-continue").click(function(){
		if($(this).hasClass("less")) {
			$(this).removeClass("less");
			$(this).html(moreLabel);
		} else {
			$(this).addClass("less");
			$(this).html(lessLabel);
		}
			$(this).parent().prev().toggle();
			$(this).prev().toggle();
			return false;
	});
});`
