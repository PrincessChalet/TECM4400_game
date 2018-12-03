class PagesController < ApplicationController

def my_groups
	@groups = Group.where(user: current_user)
	render "pages/my_groups"
end

def profile
	#@users = User.where(user: current_user)
	@users = current_user
	render "pages/profile"
end

end