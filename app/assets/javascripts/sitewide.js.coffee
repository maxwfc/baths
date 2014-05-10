# 
# brings up the login div or hides it if it's already showing and the user clicks elsewhere
# 

	$(document).click (e) ->
		t = $(e.target)
		if (t.attr("class") == "login" or ( t.parents(".compose").length <= 0 and $(".compose").find("div").is(":visible"))) 
			$(".compose").children().toggle()
	
	$(".reveal").click ->
		$(this).next().slideToggle()
		

	
		
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
