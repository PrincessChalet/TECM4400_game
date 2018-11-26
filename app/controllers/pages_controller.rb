class PagesController < ApplicationController

def my_groups
	@groups = Group.where(user: current_user)
	render "pages/my_groups"
end

end