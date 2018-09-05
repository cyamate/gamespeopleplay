module ApplicationHelper
	def show_check_icon(boolean_value)
		if boolean_value then 
			"<i class='fas fa-check fa-xs'></i>".html_safe
		else 
			""
		end 
	end

	def sort_link(column, title = nil)
	    title ||= column.titleize
	    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
	    icon = column == sort_column ? icon : ""
	    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
	end
end
