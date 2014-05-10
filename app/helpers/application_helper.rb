module ApplicationHelper

	def login_form
		content_tag( :span, "Login", class: "login" )
		content_tag(:div) do
			render partial: "user_sessions/form"			
		end
	end

end
