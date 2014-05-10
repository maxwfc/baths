#
# Initiate wysiwyg text editor
#
$ ->
	$("#article_body").editable
		inlineMode: false
		height: 400
		width: 700
		buttons:[
			"bold"
			"italic"
			"underline"
			"strikeThrough"
			"fontSize"
			"color"
			"align"
			"insertOrderedList"
			"insertUnorderedList"
			"indent"
			"outdent"
			"createLink"
			"insertImage"
			"insertVideo"
			"html"]
		placeholder: "Article..."
		imageUploadURL: "/uploads"
		imageErrorCallback: (data) ->
			alert(data.errorCode)

$('document').ready ->

# Reads which submit button ("publish" or "save as draft") was clicked and appends to form data
	
	$('button').click ->
		submitValue = $(this).text()
		newFormValue = if submitValue is "publish now" then 1 else 0
		input = $("<input>");
		input.attr("type", "hidden").attr("name", "article[published]").attr("id", "published").val(newFormValue)
		$('form').append($(input))
		