module ApplicationHelper
	def index
		@user_groups = current_user.user_groups
	end
end