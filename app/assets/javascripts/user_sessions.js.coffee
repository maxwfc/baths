$ ->
	$("label").click ->
		$(@).hide()
		$(@).next().focus()
	
	$(".login-field").focus ->
		$(@).prev().hide()
	
	$(".login-field").blur ->
		$(@).prev().show()

	
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
