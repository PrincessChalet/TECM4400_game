class PagesController < ApplicationController

def my_groups
	@groups = Group.where(user: current_user)
	render "groups/index"
end

end