module ApplicationHelper
	def show_check_icon(boolean_value)
		if boolean_value then 
			"<i class='fas fa-check fa-xs'></i>".html_safe
		else 
			""
		end 
	end
end
